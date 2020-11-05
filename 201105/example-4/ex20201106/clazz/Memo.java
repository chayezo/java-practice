package kr.or.iei.ex20201106.clazz;
import java.util.Date;

public class Memo {
	
	// Memo라는 타입을 사용자가 정의.
	// int, long, String
	private final String name;
	private final Date date;
	
	public Memo(String name, Date date) {
		this.name = name;
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public Date getDate() {
		return date;
	}
	
	

}
