package com.example.wow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
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
    private UserRepo userRepo;

    @Autowired
    private TagRepo tagRepo;

    @GetMapping("/main")
    public String mainM(@RequestParam(required = false, defaultValue = "") Integer filter, Model model) {
        Iterable<Message> messages;
        Iterable<User> users;
        if (filter != null && filter != 0) {
            messages = messageRepo.findByTag(tagRepo.findById(filter).get().getTag());
        } else {
            messages = messageRepo.findAll();
        }
        users=userRepo.findAll();
        model.addAttribute("tags", tagRepo.findAll());
        model.addAttribute("messages", messages);
        model.addAttribute("users", users);

        return "main";
    }

//    @GetMapping("/status")
//    public String status(@RequestParam(required = false, defaultValue = "") String statusFilter, Model model) {
//        Iterable<Message> messages;
//        Iterable<User> users;
//        if (statusFilter != null && !statusFilter.equals("")) {
//            messages = messageRepo.findByStatus(statusFilter);
//        } else {
//            messages = messageRepo.findAll();
//        }
//        users=userRepo.findAll();
//        model.addAttribute("tags", tagRepo.findAll());
//        model.addAttribute("status", Status.values());
//        model.addAttribute("messages", messages);
//        model.addAttribute("users", users);
//
//        return "main";
//    }

    @GetMapping("/tasks")
    public String tasks(Model model) {
        Iterable<Message> tasks;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUserName = authentication.getName();
        tasks = messageRepo.findByToWhom(currentUserName);
        model.addAttribute("tasks", tasks);

        return "tasks";
    }

    @PostMapping("/main")
    public String add(@RequestParam(defaultValue = "") Integer userFilter,
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag,  Model model
    ) {
        User filter = userRepo.findById((long) (userFilter)).get();
        Message message = new Message(text, tag, user, filter.getUsername());
        message.setStatus(Status.InProgress);
        messageRepo.save(message);

        List<Tag> t = tagRepo.findByTag(tag);
        if (t.isEmpty()) {
            Tag userTag = new Tag(tag, user);
            tagRepo.save(userTag);
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUserName = authentication.getName();
        Iterable<Message> tasks = messageRepo.findByToWhom(currentUserName);
        Iterable<Message> messages = messageRepo.findAll();
        Iterable<Tag> tags = tagRepo.findAll();
        Iterable<User> users = userRepo.findAll();
        model.addAttribute("messages", messages);
        model.addAttribute("tags", tags);
        model.addAttribute("status", Status.values());
        model.addAttribute("tasks", tasks);
        model.addAttribute("users", users);
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

    @Transactional
    @GetMapping("/tasks/{id}")
    public String tasksRemoveForm(@PathVariable("id") Integer idx) {
        Status status = messageRepo.findById(idx).get().getStatus();
        Message m = messageRepo.findById(idx).get();
        if(status.equals(Status.InProgress)){
            m.setStatus(Status.Done);
        }else{
            m.setStatus(Status.InProgress);
        }
        messageRepo.save(m);
        return "redirect:/tasks";
    }

}