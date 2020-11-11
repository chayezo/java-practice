package kr.or.iei.example;

public class Application {

	public static void main(String[] args) {
		ConcatStrings cs = (s1, s2) -> s1 + s2;
		final String s = cs.concat("Hello", "Lamda!");
		System.out.println(s);
			
		

	}

}
