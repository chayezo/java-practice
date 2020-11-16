package kr.or.iei.arrayQueue;

import kr.or.iei.Queue;

public class Application {

	public static void main(String[] args) {
		final Queue<Integer> queue = new ArrayQueue<>();
		queue.enqueue(10);
		queue.enqueue(20);
		queue.enqueue(30);
		queue.enqueue(40);
		queue.enqueue(50);
		
		System.out.println(queue.dequeue());	// 10
		System.out.println(queue.dequeue());	// 20
		
	}

}
