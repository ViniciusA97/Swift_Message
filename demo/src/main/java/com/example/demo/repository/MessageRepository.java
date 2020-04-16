package com.example.demo.repository;

import com.example.demo.models.Chat;
import com.example.demo.models.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Long> {

    List<Message> findByChatOrderByTimeSendAsc(Chat chat);
}
