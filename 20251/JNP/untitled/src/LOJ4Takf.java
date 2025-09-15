//[Mã câu hỏi (qCode): LOJ4Takf].  Một chương trình server cho phép kết nối qua giao thức TCP tại cổng 2208 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5 giây). Yêu cầu là xây dựng một chương trình client tương tác với server sử dụng các luồng ký tự (BufferedReader/BufferedWriter) theo kịch bản sau:
//
//a. Gửi một chuỗi chứa mã sinh viên và mã câu hỏi với định dạng "studentCode;qCode". Ví dụ: "B15DCCN999;C1234567"
//
//b. Nhận từ server một chuỗi chứa nhiều từ, các từ được phân tách bởi khoảng trắng. Ví dụ: "hello world this is a test example"
//
//c. Sắp xếp các từ trong chuỗi theo độ dài, thứ tự xuất hiện. Gửi danh sách các từ theo từng nhóm về server theo định dạng: "a, is, this, test, hello, world, example".
//
//d. Đóng kết nối và kết thúc chương trình.

import java.io.*;
import java.net.*;
import java.util.*;

public class LOJ4Takf {
    public static void main(String[] args) throws Exception {
        String ip = "203.162.10.109";
        int port = 2208;
        String studentCode = "B22DCDT294";
        String qCode = "LOJ4Takf";

        Socket socket = new Socket(ip, port);
        socket.setSoTimeout(5000);

        BufferedWriter out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

        String request = studentCode + ";" + qCode;
        out.write(request);
        out.newLine();
        out.flush();
        System.out.println("Sent: " + request);

        String reponse = in.readLine();
        System.out.println("Received: " + reponse);
        String[] words = reponse.split("\\s+");

        List<String> wordList = Arrays.asList(words);
        wordList.sort(Comparator.comparingInt(String::length));
        String result = String.join(", ", wordList);

        out.write(result);
        out.newLine();
        out.flush();
        System.out.println("Sent: " + result);

        socket.close();
    }
}
