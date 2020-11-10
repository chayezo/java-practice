package kr.or.iei.Lamda2;

public class Application {
	public static void main(String[] args) {
		final int result = get(10, 100, (a,b) -> {
			if (a>b) {
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
