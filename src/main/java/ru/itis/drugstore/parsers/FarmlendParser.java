package ru.itis.drugstore.parsers;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import ru.itis.drugstore.models.Item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FarmlendParser implements Parser {

    Document doc;
    final String SITE_URL = "https://farmlend.ru/search?keyword=";
    final String SEPARATOR = "+";

    @Override
    public List<Item> getItemsListByRequest(String request) {
        try {
            doc = Jsoup.connect(SITE_URL + request.replaceAll(" ", SEPARATOR)).get();
        } catch (IOException e){
            throw new IllegalArgumentException(e);
        }

        Elements elements = doc.getElementsByClass("p-item");
        List<Item> list = new ArrayList<>();

        for(Element element : elements){
            Element info = element.getElementsByClass("pi-content").first();
            String name = info.getElementsByClass("pi-title").text();
            Pattern p = Pattern.compile("(\\d+,?\\d+)");
            Matcher matcher = p.matcher(info.getElementsByClass("pi-current").text());
            Double price;
            if(matcher.find()) {
                price = Double.parseDouble(matcher.group(1).replace(",","."));
            }else{
                price = 0.0;
            }
            String href = "https://farmlend.ru" + element.getElementsByTag("a").attr("href");
            String img = "https://farmlend.ru" + element.getElementsByTag("img").attr("data-src");
            if(price != 0) {
                list.add(new Item(name, price, href, img));
            }
        }
        return list;
    }
}
