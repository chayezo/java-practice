package kr.or.iei;

import java.util.LinkedList;

public class LinkedListStack<T> implements Stack<T> {

    private LinkedList<T> stack = new LinkedList<>();


    @Override
    public void push(T value) {
        stack.add(value);
    }

    @Override
    public T pop() {
        final int size = stack.size();
        if(size <= 0) {
            return null;
        }
        return stack.remove(size-1);
    }

    @Override
    public boolean isEmpty() {
        return stack.isEmpty();
    }
}
