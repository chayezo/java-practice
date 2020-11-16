package kr.or.iei;

import java.util.LinkedList;
import java.util.List;

public class Application {

	public static void main(String[] args) {
		List<Integer> list = new LinkedList<>();
		
		list.add(10);
		list.add(20);
		list.add(30);
		list.add(40);
		
		final Integer value = list.remove(0);
		

	}

}
