package kr.or.iei;

public class Application {

	public static void main(String[] args) {
		System.out.println(factorial(5));
		
		// 1 1 2 3 5
		fibonacci(4);
	}
	
	/**
	 * @param n 항 번호
	 * @return 피보나치 수열의 해당 항 값
	 * 
	 **/
	
	private static int fibonacci(int n) {
		System.out.println(n);
		System.out.println("-----------------");
		if ( n <= 1) {
			return n;
		}
		return fibonacci(n-1) + fibonacci(n-2);
	}
	// call fibo(4)
	// fibo(3) + fibo(2)
	
	// call fibo(3)
	// 1 + fibo(1)
	
	// call fibo(2)
	// 1 + 0
	
	// call fibo(1)
	// 0 + -1
	
	private static int factorial(int n) {
		// 탈출조건
		if (n == 1) {
			return 1;
		}
		// 5
		// 4 * 3 * 2 * 1
		// 4
		// 3 * 2 * 1
		// 3
		// 2 * 1
		// 5 * factorial(4) * factorial(3) * ...
		return n * factorial(n-1);
	}

}
