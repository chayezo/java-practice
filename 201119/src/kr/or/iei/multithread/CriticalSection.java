package kr.or.iei.multithread;

public class CriticalSection {
	
	private int data = 1000;
	
	public synchronized boolean extractData(int value) {
		if (data >= value) {
			try {
				Thread.sleep(1000);		// w1, w2
			} catch (InterruptedException ignore) {}
			data -= value;
			return true;
		}
		return false;
	}
	
	public int getData() {
		return data;
	}

}
