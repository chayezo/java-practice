package kr.or.iei.linkedlist;

import java.util.List;

public class Application {

    public static void main(String[] args) {
        List<String> list = new DoublyLinkedList<>();
        //  list.add("hi");
        //list.add("bye");
        //list.add("byebye");
        list.add("abc");
        list.add("안녕하세요");
        list.add("조용히");
        list.add("12345");
        System.out.println(list.contains("abc"));
        System.out.println(list.size());
        System.out.println(list.get(0));
        System.out.println(list.size());

   }
}