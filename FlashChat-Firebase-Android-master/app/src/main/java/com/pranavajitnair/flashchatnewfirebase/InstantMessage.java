package com.pranavajitnair.flashchatnewfirebase;

public class InstantMessage {
    private String message;
    private String author;

    public InstantMessage(String message,String author){
        this.message=message;
        this.author=author;
    }

    public String getMessage() {
        return message;
    }

    public InstantMessage(){

    }

    public String getAuthor() {
        return author;
    }
}
