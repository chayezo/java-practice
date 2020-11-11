package kr.or.iei.path; // 이런 방법으로 스트림을 열 수 있다 .. 보여줌.

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Application {

    public static void main(String[] args) throws IOException {
        final Path path = Paths.get("a.txt");
        final Stream<String> stream = Files.lines(path, Charset.defaultCharset());
        final List<String> filteredList = stream.filter(s -> s.length() <= 2).collect(Collectors.toList());

        for (String s : filteredList) {
            System.out.println(s);
        }

    }
}
