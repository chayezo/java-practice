package kr.or.iei.ex201109;

public class Application {

    public static void main(String[] args) {
        final Thread thread = new Thread(new WorkerThread());
        new Watchdog(thread).start();
    }
}

