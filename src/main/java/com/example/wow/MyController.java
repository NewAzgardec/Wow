package com.example.wow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sun.awt.util.IdentityArrayList;
import sun.awt.util.IdentityLinkedList;

import javax.transaction.Transactional;
import java.util.*;

@Controller
public class MyController {
    @Qualifier("messageRepository")
    @Autowired
    private MessageRepository messageRepo;

    @GetMapping("/")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }
        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Model model
    ) {
        Message message = new Message(text, tag, user);
        messageRepo.save(message);

//        List<Message> m = messageTag.findByTag(message.getTag());
//        if (m==null) {
//            messageTag.save(message);
//        }else {
//        }
//        Iterable<Message> tags = messageTag.findByTag(message.getTag());

//        HashMap<String, String> list = new HashMap<>();
//        list.put(message.getAuthorName(), message.getTag());

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);
      //  model.addAttribute("tags", list);
        return "main";
    }

    @Transactional
    @GetMapping("/message/{id}")
    public String messageRemoveForm(@PathVariable("id") Integer idx) {
      messageRepo.deleteById(idx);
        return "redirect:/";
    }

}