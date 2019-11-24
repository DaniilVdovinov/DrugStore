package ru.itis.drugstore.parsers;

import ru.itis.drugstore.models.Item;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AptekaRuParser implements Parser {

    final String SITE_URL = "https://apteka.ru/search/?q=";

    @Override
    public List<Item> getItemsListByRequest(String request) {
        String link = SITE_URL + request.replace(' ','+');
        Document document;
        try {
            document = Jsoup.connect(link).get();
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
        List<Item> list = new ArrayList<>();
        Elements elements;
        try {
            elements = document.getElementsByClass("list catalog-list").get(0).getElementsByTag("article");
        } catch (IndexOutOfBoundsException ex){
            return list;
        }
        for(Element e : elements){
            String name = e.attr("data-product-name");
            Double price = Double.parseDouble(e.attr("data-product-price"));
            String href = "https://apteka.ru" + e.getElementsByTag("a").get(0).attr("href");
            String img = "https://apteka.ru" + e.getElementsByTag("img").get(0).attr("src");
            if(price != 0) {
                list.add(new Item(name, price, href, img));
            }
        }

        return list;
    }
}
