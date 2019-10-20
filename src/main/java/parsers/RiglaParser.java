package parsers;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.javascript.host.dom.NodeList;
import models.Item;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Deprecated
public class RiglaParser implements Parser {

    Document doc;
    HtmlPage page;
    final String SITE_URL = "https://kazan.rigla.ru/search/";
    final String SEPARATOR = "%20";
    final String IN_STOCK = "?filter=stock__in_stock";

    public List<Item> getItemsListByRequest(String request) {
        List<Item> list = new ArrayList<>();

        try {
            String link = SITE_URL + request.replaceAll(" ", SEPARATOR) + IN_STOCK;

            WebClient webClient = new WebClient(BrowserVersion.BEST_SUPPORTED);
            webClient.getOptions().setJavaScriptEnabled(true);
            webClient.waitForBackgroundJavaScript(5000);
            page = webClient.getPage(link);
        } catch (IOException e){
            throw new IllegalArgumentException(e);
        }

        List<HtmlElement> elements = page.getByXPath("//div[contains(@class, 'product-list-mode-grid__item')]");

        for(HtmlElement element : elements){
            System.out.println(element.asText() + "!!!!!");
            HtmlElement info = element.getElementsByTagName("img").get(0);
            String name = info.getAttribute("alt");
            Double price = Double.parseDouble(element.getByXPath("//*[contains(@class,’product__active-price-number’)]").get(0).toString());
            String href = "https://kazan.rigla.ru" + element.getElementsByTagName("a").get(0).getAttribute("href");
            String img = info.getAttribute("src");
            list.add(new Item(name, price, href, img));
        }
        return list;
    }
}
