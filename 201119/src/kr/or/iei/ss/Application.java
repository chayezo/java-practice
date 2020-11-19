package kr.or.iei.ss;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Application {

	public static void main(String[] args) {
		
		// ip: 네트워크 상에서 컴퓨터를 식별하기 위한 주소 - 192.168.40.124
		// port: 컴퓨터에서 프로그램을 구분하기 위한 번호 - 12345
		try {
			// 서버 소켓 생성
			final ServerSocket serverSocket = new ServerSocket(12345);
			
			 // 외부의 접속을 대기
            System.out.println("접속 대기 중");
            final Socket socket = serverSocket.accept();
            System.out.println("접속 됨");

			
			// 1. 접속한 클라이언트에게 메세지를 하나 받음
			recvMessage(socket.getInputStream());
			
			// 2. 접속한 클라이언트에게 메세지를 보냄
			sendMessage(socket.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	private static void recvMessage(InputStream is) throws IOException {
		final byte[] buffer = new byte[4096];
		int readBytes;
		
		while ((readBytes = is.read(buffer)) != -1) {
            final String messageFromClient = new String(buffer);
            System.out.println(messageFromClient);
        }
    }

    private static void sendMessage(OutputStream os) {
        
    }
}

