package kr.or.iei.Hashset;
// Set<E>
import java.util.HashSet;
import java.util.Set;

public class Application {

	public static void main(String[] args) {
		final Set<String> set = new HashSet<>();
		set.add("포도");
		set.add("포도");
		set.add("사과");
		
		for (String s : set) {
			System.out.println(s);
		}
		
		System.out.println(set.contains("포도"));

	}
	
}
