package kr.or.iei.thread;

import java.awt.*;

/**
 * @author user1
 *
 */
public class BeepThread extends Thread {

    @Override
    public void run() {
        Toolkit tk = Toolkit.getDefaultToolkit();

        while (true) {
            tk.beep();
            try {
                System.out.printf("[%s] thread is running\n", Thread.currentThread().getName());
                Thread.sleep(5000);		// 괄호 안--millis
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
