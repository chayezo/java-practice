package kr.or.iei.runnable;

public class Application {

	public static void main(String[] args) {
		final Task task = new Task();
		final Thread thread = new Thread(task);
		thread.start();

	}

}
