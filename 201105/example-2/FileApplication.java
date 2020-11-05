package kr.or.iei;
import java.io.*;

public class FileApplication {

	public static void main(String[] args) {
		final File origin = new File("C:\\Users\\user1\\Desktop\\5bddba7b6574b95d37b6079c199d7101.jpg");
		try (
				final InputStream fileInputStream = new FileInputStream(origin);
				final OutputStream fileOutputStream = new FileOutputStream("C:\\Users\\user1\\Desktop\\5bddba7b6574b95d37b6079c199d7101.jpg");

			) {
				final byte[] buffer = new byte[]


		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
