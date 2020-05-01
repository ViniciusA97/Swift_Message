package com.example.demo.models;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity(name = "Chat")
public class Chat implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToMany()
    private List<Client> clients = new ArrayList<Client>();
    
    @Column(columnDefinition = "VARCHAR(20)")
    private String subject;

    @Column(columnDefinition = "TIMESTAMP")
    private LocalDateTime lastMessageDate;

    @Column(columnDefinition = "TEXT")
    private String lastMessage;

    public Chat() {
    }

    public Chat(List<Client> clients, String sub, LocalDateTime last, String lastM){
        this.clients = clients;
        this.lastMessage = lastM;
        this.lastMessageDate = last;
        this.subject = sub;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Client> getClients() {
        return clients;
    }

    public void setClients(List<Client> clients) {
        this.clients = clients;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public LocalDateTime getLastMessageDate() {
        return lastMessageDate;
    }

    public void setLastMessageDate(LocalDateTime lastMessageDate) {
        this.lastMessageDate = lastMessageDate;
    }

    public String getLastMessage() {
        return lastMessage;
    }

    public void setLastMessage(String lastMessage) {
        this.lastMessage = lastMessage;
    }
}
