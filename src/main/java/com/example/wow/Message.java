package com.example.wow;

import javax.persistence.*;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String text;
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "toWhom_id")
    private User toWhom;

    private Status status;

    public Message() {
    }

    public Message(String text, String tag, User user, User toWhom) {
        this.author = user;
        this.text = text;
        this.tag = tag;
        this.toWhom = toWhom;
    }

    public String getToWhom() {
        return toWhom.getUsername();
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "no";
    }

    public String getText() {
        return text;
    }

    public Integer getId() {
        return id;
    }

    public String getTag() {
        return tag;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}