package kr.or.iei;

public interface Stack<T> {
		
    /**
     * @param value 값을 넣는다
     */
    public void push(T value);

    /**
     * @return 꼭대기에 있는 값을 꺼낸다
     */
    public T pop();

    /**
     * @return 비어있으면 true
     */
    public boolean isEmpty();
}

