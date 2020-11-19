package kr.or.iei.ss;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

public class ClientApplication {

    public static void main(String[] args) {
        try {
            final Socket socket = new Socket("localhost", 12345);
            final OutputStream out = socket.getOutputStream();
            System.out.println("ㄱㄱ");
            final String messageToServer = "Hello Server";
            out.write(messageToServer.getBytes(StandardCharsets.UTF_8));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

