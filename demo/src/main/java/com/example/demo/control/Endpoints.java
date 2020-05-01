package com.example.demo.control;

import com.example.demo.models.Chat;
import com.example.demo.models.Client;
import com.example.demo.models.Message;
import com.example.demo.repository.ChatRepository;
import com.example.demo.repository.ClientRepository;
import com.example.demo.repository.MessageRepository;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
public class Endpoints {

    @Autowired
    ClientRepository clientDAO;

    @Autowired
    ChatRepository chatDAO;

    @Autowired
    MessageRepository messageDAO;


    //COM REQUEST PARAM DEVEMOS ADICIONAR OS DADOS REQUISITADO NO BODY
    @PostMapping(path="/client/create")
    public ResponseEntity<?> createClient(@RequestParam("name") String name,
                                          @RequestParam("email") String email,
                                          @RequestParam("password") String password){

        Client client = new Client(name,email,password);
        try{
            Client c = clientDAO.save(client);
            return new ResponseEntity<>(c,HttpStatus.CREATED);
        }catch (Exception e){
            return new ResponseEntity<>("Houve um erro ao cria sua conta. Confira se seu email já está sendo utilizado",HttpStatus.CONFLICT);
        }
    }

    @PostMapping(path = "/chat/create")
    public ResponseEntity<?> createChat(@RequestParam("users") List<String> users){

        Client c1;
        Client c2;
        try{
            c1 = clientDAO.findByEmail(users.get(0));
            c2 = clientDAO.findByEmail(users.get(1));
        }catch (Exception e){
            return new ResponseEntity<>("Usuário não encontrado",HttpStatus.FAILED_DEPENDENCY);
        }

        ArrayList<Client> clients = new ArrayList<Client>();
        clients.add(c1);
        clients.add(c2);

        Chat chat = new Chat(clients, null, null, null);

        try{
            chat = chatDAO.save(chat);
            return new ResponseEntity<>(chat,HttpStatus.CREATED);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<>("Houve algum problema na criação do chat", HttpStatus.BAD_GATEWAY);
        }
    }

    @PostMapping(path = "/message/sendMessage")
    public ResponseEntity<?> sendMessage(@RequestParam("idChat") int idChat,
                                         @RequestParam("clientEmail") String clientEmail,
                                         @RequestParam("message") String message){
        Chat chat;
        Client client;

        try{
            chat = chatDAO.getChatById(idChat);
            client = clientDAO.findByEmail(clientEmail);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<>("Houve um problema para enviar a messagem.",HttpStatus.FAILED_DEPENDENCY);
        }
        LocalDateTime date = LocalDateTime.now();
        Message msg = new Message(message,date,client,chat.getClients(),chat);

        try{
            messageDAO.save(msg);
            List<Message> msgs = messageDAO.findByChatOrderByTimeSendAsc(chat);
            return new ResponseEntity<>(msgs,HttpStatus.CREATED);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }


    //COM PATHVARIABLE DEVEMOS ADICIONAR O PARAMETRO NO PRÓPRIO URL : localhost:8080/client/vini
    @GetMapping(path="/client/{email}")
    public ResponseEntity<?> getClientForEmail(@PathVariable("email") String email){
        Client usual;
        try{
            usual = clientDAO.findByEmail(email);
            return new ResponseEntity<>(usual,HttpStatus.FOUND);
        }catch (Exception e){
            return  new ResponseEntity<>(e.getMessage(),HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(path = "/chat/getChats/{idUser}")
    public ResponseEntity<?> getChats(@PathVariable("idUser") long idUser){
        List<Chat> chat;
        System.out.println(idUser);
        try{
            chat = chatDAO.getChatsUser(idUser);
            return new ResponseEntity<>(chat,HttpStatus.FOUND);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(path = "/message/getMessages/{idChat}")
    public ResponseEntity<?> getMessagesChat(@PathVariable("idChat") long idChat){
        List<Message> messages;
        Chat chat;
        try{
            chat = chatDAO.getChatById(idChat);
            messages = messageDAO.findByChatOrderByTimeSendAsc(chat);
            return new ResponseEntity<>(messages, HttpStatus.FOUND);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
//-----Post-----
// Criar usuario - ok
// Criar chat - ok
// Mandar mensage - ok

//----Get-----
// Get chats
// Get message
// Get client - ok

