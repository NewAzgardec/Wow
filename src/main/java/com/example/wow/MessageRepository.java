package com.example.wow;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("messageRepository")
public interface MessageRepository extends CrudRepository<Message, Long> {

    List<Message> findByTag(String tag);

    List<Message> deleteById(int id);

    Message findById(int id);

}
