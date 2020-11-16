package kr.or.iei;

public interface Queue<T> {
	void enqueue(T data);
	
	T dequeue();

}
