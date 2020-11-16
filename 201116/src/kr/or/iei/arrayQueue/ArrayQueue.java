package kr.or.iei.arrayQueue;

import kr.or.iei.Queue;

public class ArrayQueue<T> implements Queue<T> {

	
	private static final int DEFAULT_SIZE = 5;
	
	private Object[] queue = new Object[DEFAULT_SIZE];
	private int rear = -1;
	private int front = -1;
	
	@Override
	public void enqueue(T data) {
		if (isFull()) {
			System.out.println("full");
			return;
		}
		queue[++rear] = data;
		
	}

	@Override
	public T dequeue() {
		if(isEmpty()) {
			System.out.println("empty queue");
			return null;
		}
		front = ++front % DEFAULT_SIZE;
		return (T) queue[front];
		
	}
	
	// 큐가 꽉 찼는지 검사
	private boolean isFull() {
		return rear == (DEFAULT_SIZE - 1);
	}
	
	// 
	private boolean isEmpty() {
		if(front == rear) {
			front = -1;
			rear = -1;
		}
		return front == rear;
	}

}
