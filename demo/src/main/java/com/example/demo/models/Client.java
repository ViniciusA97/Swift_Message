package com.example.demo.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity(name = "Client")
public class Client implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    @Column(columnDefinition = "VARCHAR(60)", unique = true)
    private String email;

    @Column(columnDefinition = "VARCHAR(60)")
    private String name;

    @Column(columnDefinition = "VARCHAR(120)")
    private String password;


    public Client(String name, String email, String password){
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public Client() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
