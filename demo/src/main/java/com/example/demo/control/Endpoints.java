package com.example.demo.control;

import com.example.demo.models.Client;
import com.example.demo.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("client")
public class Endpoints {

    @Autowired
    ClientRepository clientDAO;

    //COM REQUEST PARAM DEVEMOS ADICIONAR OS DADOS REQUISITADO NO BODY
    @PostMapping(path="/create")
    public ResponseEntity<?> createClient(@RequestParam("name") String name,
                                          @RequestParam("email") String email,
                                          @RequestParam("senha") String senha){
        Client client = new Client(name,email,senha);
            clientDAO.save(client);
            return new ResponseEntity<>(HttpStatus.CREATED);

    }

    //COM PATHVARIABLE DEVEMOS ADICIONAR O PARAMETRO NO PRÓPRIO URL : localhost:8080/client/vini
    @GetMapping(path="/{email}")
    public ResponseEntity<?> getClientForEmail(@PathVariable("email") String email){
        Client usual;
        try{
            usual = clientDAO.findByEmail(email);
            return new ResponseEntity<>(usual,HttpStatus.FOUND);
        }catch (Exception e){
            return  new ResponseEntity<>(e.getMessage(),HttpStatus.NOT_FOUND);
        }
    }
}
