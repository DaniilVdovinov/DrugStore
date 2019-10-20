package ru.itis.drugstore.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class Item implements Comparable<Item>{
    String name;
    Double price;
    String href;
    String img;

    @Override
    public int compareTo(Item u) {
        if(this.price > u.getPrice()){
            return 1;
        }
        else {
            return -1;
        }
    }
}
