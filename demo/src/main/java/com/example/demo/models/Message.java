package com.example.demo.models;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity(name = "Message")
public class Message {

    @Id
    @GeneratedValue
    private Long id;

    @Column(columnDefinition = "TEXT")
    private String message;

    @Column(columnDefinition = "TIMESTAMP")
    private LocalDateTime timeSend;

    @ManyToOne
    private Chat chat;

    @ManyToOne
    private Client sendUser;

    @ManyToMany
    private List<Client> recivers;

    public Message() {
    }

    public Message(String message, LocalDateTime send, Client sender, List<Client> reciver, Chat chat){
        this.message = message;
        this.timeSend = send;
        this.sendUser = sender;
        this.recivers = reciver;
        this.chat = chat;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getTimeSend() {
        return timeSend;
    }

    public void setTimeSend(LocalDateTime timeSend) {
        this.timeSend = timeSend;
    }

    public Chat getChat() {
        return chat;
    }

    public void setChat(Chat chat) {
        this.chat = chat;
    }

    public Client getSendUser() {
        return sendUser;
    }

    public void setSendUser(Client sendUser) {
        this.sendUser = sendUser;
    }

    public List<Client> getRecivers() {
        return recivers;
    }

    public void setRecivers(List<Client> recivers) {
        this.recivers = recivers;
    }
}
