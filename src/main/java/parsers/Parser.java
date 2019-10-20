package parsers;

import models.Item;
import java.util.List;

public interface Parser {
    public List<Item> getItemsListByRequest(String request);
}
