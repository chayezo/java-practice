package kr.or.iei.thread;

public class Application {
	public static void main(String[] args) {

		final Thread thread = new HelloThread();
		thread.run();

	}

}
