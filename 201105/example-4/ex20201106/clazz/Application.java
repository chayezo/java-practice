package kr.or.iei.ex20201106.clazz;
import java.util.Date;
public class Application {

	public static void main(String[] args) {
		// heap
		final Memo memo = getMemo();
		// memo
		System.out.println(memo.getName());

	}
	private static Memo getMemo() {
		return new Memo("abc", new Date());
		
	}
	// 1. 메모a = new Memo("abc", new Date())
	// 2. heap 메모a 생성됨.
	// 3. 참조하는 값을 반환.

}
