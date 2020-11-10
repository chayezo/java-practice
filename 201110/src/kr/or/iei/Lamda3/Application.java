package kr.or.iei.Lamda3;
import kr.or.iei.Lamda2.Comparator;
import java.util.List;
import java.util.stream.*;

public class Application {

	public static void main(String[] args) {
		List<String> list = List.of("asdsadsa", "asdf", "asdfe", "ba");
		final List<String> filteredList = list.stream()
				.filter(s -> s.length() > 3)
				.collect(Collectors.toList());
		filteredList.forEach(System.out::println);
		
		final int result = get(10, 100, (a,b) -> {
			if (a <= b) {
				return b;
			}
			return a;
		});
		System.out.println(result);

	}
	
	public static int get(int a, int b, Comparator comparator) {
		return comparator.compare(a, b);
	}

}
