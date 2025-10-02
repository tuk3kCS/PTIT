//[Mã câu hỏi (qCode): UMtOLE8G].  Một chương trình server cho phép giao tiếp qua giao thức UDP tại cổng 2208. Yêu cầu là xây dựng một chương trình client trao đổi thông tin với server theo kịch bản:
//a. Gửi thông điệp là một chuỗi chứa mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode". Ví dụ: ";B15DCCN009;EF56GH78"
//b. Nhận thông điệp là một chuỗi từ server theo định dạng "requestId;data", với:•	requestId là chuỗi ngẫu nhiên duy nhất.
//•	data là một chuỗi ký tự chứa nhiều từ, được phân cách bởi dấu cách.
//Ví dụ: "EF56GH78;The quick brown fox"
//c. Sắp xếp các từ trong chuỗi theo thứ tự từ điển ngược (z đến a) và gửi thông điệp lên server theo định dạng "requestId;word1,word2,...,wordN".
//Ví dụ: Với data = "The quick brown fox", kết quả là: "EF56GH78;quick,fox,brown,The"
//d. Đóng socket và kết thúc chương trình

import java.io.*;
import java.net.*;
import java.util.*;

public class UMtOLE8G {
    public static void main(String[] args) throws Exception {
        DatagramSocket socket = new DatagramSocket();

        String request = ";B22DCDT294;UMtOLE8G";
        byte[] sendData = request.getBytes();
        System.out.println("Sending request: " +  request);

        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, InetAddress.getByName("203.162.10.109"), 2208);
        socket.send(sendPacket);

        byte[] receiveData = new byte[1024];
        DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
        socket.receive(receivePacket);

        String response = new String(receivePacket.getData(), 0, receivePacket.getLength());
        System.out.println("Response: " + response);

        String[] domains = response.split(";");
        String requestId = domains[0];
        String data = domains[1];

        String[] words = data.trim().split(" ");
        List<String> list = Arrays.asList(words);
        list.sort(Collections.reverseOrder(String.CASE_INSENSITIVE_ORDER));

        String result = requestId + ";" + String.join(",", list);

        byte[] sendResult = result.getBytes();

        DatagramPacket resultPacket = new DatagramPacket(sendResult, sendResult.length, InetAddress.getByName("203.162.10.109"), 2208);
        socket.send(resultPacket);
        System.out.println("Result: " + result);

        socket.close();
    }
}
