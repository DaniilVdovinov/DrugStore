package ru.itis.drugstore.parsers;

import ru.itis.drugstore.models.Item;

import java.util.List;

public class ParserThread extends Thread{

    private Parser parser;
    private List<Item> result;
    private String request;

    public ParserThread(Parser parser, String request) {
        this.parser = parser;
        this.request = request;
        this.start();
    }

    @Override
    public void run() {
        result = parser.getItemsListByRequest(request);
    }

    public List<Item> getResult() {
        return result;
    }
}
