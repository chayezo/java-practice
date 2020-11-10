package kr.or.iei.Lamda;

public class Application {

	public static void main(String[] args) {
		LengthOfTwoStrings l = (String t1, String t2) -> t1.length() + t2.length();
		final int length = l.getLength("abc", "def");
		
		System.out.println(length);
		System.out.println(l);

	}

}
