package com.example.wow;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("messageRepository")
public interface MessageRepository extends CrudRepository<Message, Integer> {

    List<Message> findByTag(String tag);

    List<Message> findByAuthor(User i);

    List<Message> findByToWhom(String i);

    List<Message> findByStatus(String status);

}
