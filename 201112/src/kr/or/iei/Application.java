package kr.or.iei;

public class Application {
	public static void main(String[] args) {
		final List<String> list = new LinkedList<>();
		list.add("apple");
		list.add("banana");
		list.add("grape");
		
		System.out.println(list.size());
		System.out.println(list.get(1));

	}

}
