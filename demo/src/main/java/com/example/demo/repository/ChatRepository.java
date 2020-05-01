package com.example.demo.repository;

import com.example.demo.models.Chat;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ChatRepository extends CrudRepository<Chat, Long> {


    @Query("SELECT c FROM Chat c JOIN c.clients cc WHERE cc.id = ?1")
    List<Chat> getChatsUser(Long id);


    Chat getChatById(long id);
}
