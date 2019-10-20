import models.Item;
import parsers.*;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        ParserThread thread = new ParserThread(new FarmlendParser(), "нурофен");
        thread.join();
        for(Item item : thread.getResult()){
            System.out.println(item);
        }

    }
}

