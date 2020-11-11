package kr.or.iei.stream;

import java.util.Arrays;
import java.util.Optional;
import java.util.stream.Stream;

public class OptionalApplication {
	public static void main(String[] args) {
		final String[] array = {"포도", "바나나", "사과", "아보카도", "오렌지"};
		final Stream<String> stream = Arrays.stream(array);

		final Optional<String> maybeString = stream.filter(s -> s.length() >= 4)
				.findFirst();
		final Optional<String> o = Optional.ofNullable("값있음");
		System.out.println(o.isPresent());
		System.out.println(o.isEmpty());

		final String s = maybeString.get();
		System.out.println(s);
	}
}
