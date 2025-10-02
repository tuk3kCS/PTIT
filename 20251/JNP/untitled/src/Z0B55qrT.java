//[Mã câu hỏi (qCode): Z0B55qrT].  Một chương trình server cho phép kết nối qua giao thức UDP tại cổng 2208. Yêu cầu là xây dựng một chương trình client trao đổi thông tin với server theo kịch bản dưới đây:
//a.	Gửi thông điệp là một chuỗi chứa mã sinh viên và mã câu hỏi theo định dạng “;studentCode;qCode”. Ví dụ: “;B15DCCN001;5B35BCC1”
//b.	Nhận thông điệp từ server theo định dạng “requestId;data”
//        -	requestId là một chuỗi ngẫu nhiên duy nhất
//-	data là chuỗi dữ liệu cần xử lý
//c.	Xử lý chuẩn hóa chuỗi đã nhận thành theo nguyên tắc
//i.	Ký tự đầu tiên của từng từ trong chuỗi là in hoa
//ii.	Các ký tự còn lại của chuỗi là in thường
//Gửi thông điệp chứa chuỗi đã được chuẩn hóa lên server theo định dạng “requestId;data”
//d.	Đóng socket và kết thúc chương trình

import java.io.*;
import java.util.*;
import java.net.*;
import java.nio.*;

public class Z0B55qrT {
    public static void main(String[] args) throws Exception {
        DatagramSocket socket = new DatagramSocket();

        String request = ";B22DCDT294;Z0B55qrT";
        byte[] sendData = request.getBytes();

        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, InetAddress.getByName("203.162.10.109"), 2208);
        socket.send(sendPacket);
        System.out.println("Sent: " + request);

        byte[] receiveData = new byte[1024];
        DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
        socket.receive(receivePacket);

        String response = new String(receivePacket.getData(), 0, receivePacket.getLength());
        System.out.println("Received: " + response);

        String[] domains = response.split("[;]");
        String requestId = domains[0];
        String data = domains[1];

        String[] words = data.trim().split(" ");
        for (int i = 0; i < words.length; i++) {
            words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase();
        }

        data = "";
        for (int i = 0; i < words.length; i++) {
            data += words[i];
            if  (i != words.length - 1) {
                data += " ";
            }
        }

        String result = requestId + ";" + data;
        byte[] sendResult = result.getBytes();

        DatagramPacket resultPacket = new DatagramPacket(sendResult, sendResult.length, InetAddress.getByName("203.162.10.109"), 2207);
        socket.send(resultPacket);
        System.out.println("Sent: " + result);

        socket.close();
    }
}
