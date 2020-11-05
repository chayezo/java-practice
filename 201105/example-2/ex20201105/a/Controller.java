package kr.or.iei.ex20201105.a;

import java.util.ArrayList;
import kr.or.iei.ex20201105.a.Dao;
import kr.or.iei.ex20201105.a.Memo;

public class Controller {
	public static void main(String[] args) {
		final Dao dao = new Dao();
		final ArrayList<Memo> list = dao.selectAll();
		// list.isEmpty() = 리스트 내에 값이 하나도 없으면 true.
		if(list.isEmpty()) {
			System.out.println("데이터가 없습니다.");
		} else {
			System.out.println("NO\tNAME\tMSG\tWRITEDAY");
			System.out.println("-----------------------------------");
			for(Memo m : list) {
				System.out.println(m.getNo() + "\t" + m.getName() + "\t" + m.getMsg() + "\t" + m.getWriteday());			
			}
		}

	}
}