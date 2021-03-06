package com.example.demo.repository;

import com.example.demo.models.Client;
import org.springframework.data.repository.CrudRepository;

public interface ClientRepository extends CrudRepository<Client, Long> {

    Client findByEmail(String email);
    Client findByName(String name);


}
