package kr.or.iei.ex201109;

public class CriticalSection {

    private int data = 1000;

    public boolean 무언가심각한작업(int 인출할값) {
        if (data >= 인출할값) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            data -= 인출할값;
            return true;
        }
        return false;
    }

    public int getData() {
        return data;
    }
}
