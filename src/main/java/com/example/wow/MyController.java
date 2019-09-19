package com.example.wow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.transaction.Transactional;
import java.util.List;

@Controller
public class MyController {
    @Qualifier("messageRepository")
    @Autowired
    private MessageRepository messageRepo;

    @Autowired
    private TagRepo tagRepo;

    @GetMapping("/main")
    public String mainM(@RequestParam(required = false, defaultValue = "") Integer filter, Model model) {
        Iterable<Message> messages;
        if (filter != null && filter != 0) {
            messages = messageRepo.findByTag(tagRepo.findById(filter).get().getTag());
        } else {
            messages = messageRepo.findAll();
        }
        model.addAttribute("tags", tagRepo.findAll());
        model.addAttribute("messages", messages);
       // model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Model model
    ) {
        Message message = new Message(text, tag, user);
        messageRepo.save(message);

        List<Tag> t = tagRepo.findByTag(tag);
        if (t.isEmpty()) {
            Tag userTag = new Tag(tag, user);
            tagRepo.save(userTag);
        }

        Iterable<Message> messages = messageRepo.findAll();
        Iterable<Tag> tags = tagRepo.findAll();

        model.addAttribute("messages", messages);
        model.addAttribute("tags", tags);
        return "main";
    }

    @Transactional
    @GetMapping("/message/{id}")
    public String messageRemoveForm(@PathVariable("id") Integer idx) {
        String tag = messageRepo.findById(idx).get().getTag();
        List<Message> m =messageRepo.findByTag(tag);
        if(m.size()==1){
            for(Message mes: m){
            tagRepo.deleteByTag(mes.getTag());}
        }
        messageRepo.deleteById(idx);
        return "redirect:/main";
    }

}