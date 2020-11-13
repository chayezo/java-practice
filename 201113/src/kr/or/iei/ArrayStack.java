package kr.or.iei;

import java.util.Arrays;

public class ArrayStack<T> implements Stack<T> {

    private static final int DEFAULT_SIZE = 5;

    private Object[] array = new Object[DEFAULT_SIZE];
    private int top = 0;
    private int currentCapacity = DEFAULT_SIZE;

    @Override
    public void push(T value) {
    	ensureCapacity();
        array[top++] = value;
    }
    
    private void ensureCapacity() {
    	// 1. 배열이 가득 찼는지 검사
    	if( top >= DEFAULT_SIZE) {
    		// 2. 가득 찬 경우 배열을 늘린다
    		Arrays.copyOf(array, currentCapacity * 2);
    		// 3. 현재 최대 용량값 늘림
    		currentCapacity *= 2;
    	}
    }

    @SuppressWarnings("unchecked")  // 앎.
    @Override
    public T pop() {
    	if (top <= 0) {
    		return null;
    	}
        top -= 1;
        final Object result = array[top];
        array[top] = null;
        return (T) result;
    }

    @Override
    public boolean isEmpty() {
        return array[0] == null;
    }
}


