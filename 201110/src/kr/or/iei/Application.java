package kr.or.iei;	// Generic

import java.util.ArrayList;
import java.util.List;

public class Application {

    public static void main(String[] args) {
        List list = new ArrayList<>();
        list.add("String");
        list.add(123);

        for(Object o : list){
            System.out.println(o);
        }
    }
}
