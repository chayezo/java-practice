package kr.or.iei.stream;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class BasicApplication {

	public static void main(String[] args) {
		final List<String> list = List.of("포도", "바나나", "사과", "아보카도", "오렌지");
		// 1. 생성
		final Stream<String> stream = list.stream();
		// 2. 가공
		final Stream<String> filtered = stream.filter(s -> s.length() <= 2);
		// 3. 취합
		final List<String> filteredList = filtered.collect(Collectors.toList());
		list.stream()
				.filter(s -> s.length() <= 2)
				.collect(Collectors.toList());
		
		for (String s : filteredList) {
			System.out.println(s);
		}

	}

}
