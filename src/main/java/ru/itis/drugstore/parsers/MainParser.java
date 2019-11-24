package ru.itis.drugstore.parsers;

import org.springframework.stereotype.Component;
import ru.itis.drugstore.models.Item;

import java.util.ArrayList;
import java.util.List;

@Component
public class MainParser implements Parser {

    private static Parser[] parsers = {new AptekaRuParser(), new FarmlendParser(), new SakuraParser(), new ZdravCityParser()};

    @Override
    public List<Item> getItemsListByRequest(String request) {
        List<Item> list = new ArrayList<>();
        ParserThread[] threads = new ParserThread[parsers.length];
        try {
            for (int i = 0; i < parsers.length; i++) {
                threads[i] = new ParserThread(parsers[i], request);
                threads[i].join();
            }
        } catch (InterruptedException e){
            throw new IllegalArgumentException(e);
        }
        for(ParserThread p : threads){
            list.addAll(p.getResult());
        }
        return list;
    }
}
