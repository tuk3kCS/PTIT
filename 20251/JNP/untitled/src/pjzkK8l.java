//[Mã câu hỏi (qCode): 7pjzkK8l].  Một chương trình server cho phép giao tiếp qua giao thức UDP tại cổng 2207. Yêu cầu là xây dựng một chương trình client trao đổi thông tin với server theo kịch bản:
//        a. Gửi thông điệp là một chuỗi chứa mã sinh viên và mã câu hỏi theo định dạng ";studentCode;qCode".
//        Ví dụ: ";B15DCCN010;D3F9A7B8"
//        b. Nhận thông điệp là một chuỗi từ server theo định dạng "requestId;a;b", với:
//        •	requestId là chuỗi ngẫu nhiên duy nhất.
//        •	a và b là chuỗi thể hiện hai số nguyên lớn (hơn hoặc bằng 10 chữ số).
//        Ví dụ: "X1Y2Z3;9876543210;123456789"
//        c. Tính tổng và hiệu của hai số a và b, gửi thông điệp lên server theo định dạng "requestId;sum;difference".Ví dụ:
//        Nếu nhận được "X1Y2Z3;9876543210,123456789", tổng là 9999999999 và hiệu là 9753086421. Kết quả gửi lại sẽ là "X1Y2Z3;9999999999,9753086421".
//        d. Đóng socket và kết thúc chương trình

import java.math.BigInteger;
import java.net.*;
import java.io.*;

public class pjzkK8l {
    public static void main(String[] args) throws Exception {
        DatagramSocket socket = new DatagramSocket();

        String request = ";B22DCDT294;7pjzkK8l";
        byte[] sendData = request.getBytes();

        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, InetAddress.getByName("203.162.10.109"), 2207);
        socket.send(sendPacket);
        System.out.println("Gửi: " + request);

        byte[] receiveData = new byte[1024];
        DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
        socket.receive(receivePacket);

        String response = new String(receivePacket.getData(), 0, receivePacket.getLength());
        System.out.println("Nhận: " + response);

        String[] domains = response.split(";");
        String requestId = domains[0];
        BigInteger a = new BigInteger(domains[1]);
        BigInteger b = new BigInteger(domains[2]);
        BigInteger sum = a.add(b);
        BigInteger diff = a.subtract(b);

        String result = requestId + ";" + sum.toString() + "," + diff.toString();
        byte[] resultData = result.getBytes();

        DatagramPacket resultPacket = new DatagramPacket(resultData, resultData.length, InetAddress.getByName("203.162.10.109"), 2207);
        socket.send(resultPacket);
        System.out.println("Gửi: " + result);
    }
}
