package kr.or.iei.thread;

public class HelloThread extends Thread {

	@Override
	public void run() {
		while(true) {
			System.out.println("안녕");
			try {
				Thread.sleep(1000);
			} catch (InterruptedException ignore) {

			}
		}

	}
}
