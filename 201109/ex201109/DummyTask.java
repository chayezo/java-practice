package kr.or.iei.ex201109;

public class DummyTask implements Runnable {

    @Override
    public void run() {
        while (true) {
            try {
                final String threadName = Thread.currentThread().getName();
                System.out.println(threadName + " - message");
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
/*public class Application {

    public static void main(String[] args) {
        final DummyTask task = new DummyTask();
        final Thread thread = new Thread(task);

        thread.start();

        final Scanner scanner = new Scanner(System.in);
        while (true) {
            final int i = scanner.nextInt();
            final String threadName = Thread.currentThread().getName();
            System.out.println(threadName + ": " + i);
        }
    }
}


 
 */

