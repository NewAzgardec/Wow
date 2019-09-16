package com.example.wow;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("tagRepository")
public interface TagRepo  extends CrudRepository<Tag, Integer> {

    List<Tag> findByTag(String tag);

    List<Tag> deleteByTag(String tag);

    List<Tag> findByAuthor(User user);

}