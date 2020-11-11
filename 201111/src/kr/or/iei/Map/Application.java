package kr.or.iei.Map;

import java.util.HashMap;
import java.util.Map;

public class Application {

	public static void main(String[] args) {
		Map<String, String> map = new HashMap<>();
		map.put("one", "하나");
		map.put("two", "둘");
		
		for (Map.Entry<String, String> entry : map.entrySet()) {
			System.out.println(entry.getKey());
			System.out.println(entry.getValue());
			System.out.println("------------------------");
		}

	}

}
