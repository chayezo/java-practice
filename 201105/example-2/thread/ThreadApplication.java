package kr.or.iei.thread;
import java.util.*;

public class ThreadApplication {

	public static void main(String[] args) {
		final BeepThread thread = new BeepThread();
		//thread.setDaemon(true); -- main이랑 같이 죽음.
		thread.start();
		
		final Scanner scan = new Scanner(System.in);
		while(true) {
			final int value = scan.nextInt();
			System.out.println("main :" + value);
		}

	}

}
