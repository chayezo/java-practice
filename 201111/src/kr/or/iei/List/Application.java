package kr.or.iei.List;

import java.util.ArrayList;
import java.util.List;

public class Application {

	public static void main(String[] args) {
		final List<String> list = new ArrayList<>();
		list.add("포도");
		list.add("포도");
		list.add("사과");
		
		list.remove("포도");
		for (String s : list) {
			System.out.println(s);
		}
		System.out.println(list.contains("포도"));

	}

}
