package com.example.test2;

public class Mass {

    private String message,author;

    public Mass(){

    }

    public Mass(String mauthor, String mmessage){
        message=mmessage;
        author=mauthor;
    }

    public String getAuthor() {
        return author;
    }

    public String getMessage() {
        return message;
    }
}
