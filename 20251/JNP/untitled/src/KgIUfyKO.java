//[Mã câu hỏi (qCode): KgIUfyKO].
//Một chương trình server cho phép giao tiếp qua giao thức UDP tại cổng 2207. Yêu cầu là xây dựng một chương trình client trao đổi thông tin với server theo kịch bản:
//a. Gửi thông điệp là một chuỗi chứa mã sinh viên và mã câu hỏi theo định dạng “;studentCode;qCode”. Ví dụ: “;B15DCCN004;99D9F604”
//b. Nhận thông điệp là một chuỗi từ server theo định dạng “requestId;z1,z2,...,z50” requestId là chuỗi ngẫu nhiên duy nhất
//z1 -> z50 là 50 số nguyên ngẫu nhiên
//c. Thực hiện tính số lớn thứ hai và số nhỏ thứ hai của thông điệp trong z1 -> z50 và gửi thông điệp lên server theo định dạng “requestId;secondMax,secondMin”
//d. Đóng socket và kết thúc chương trình

import java.net.*;
import java.io.*;
import java.util.*;

public class KgIUfyKO {
    public static void main(String[] args) throws Exception {
        DatagramSocket socket = new DatagramSocket();

        String request = ";B22DCDT294;KgIUfyKO";
        byte[] sendData = request.getBytes();

        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, InetAddress.getByName("203.162.10.109"), 2207);
        socket.send(sendPacket);
        System.out.println("Sent: " + request);

        byte[] receiveData = new byte[1024];
        DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
        socket.receive(receivePacket);

        String response = new String(receivePacket.getData(), 0, receivePacket.getLength());
        System.out.println("Received: " + response);
        String[] domains = response.split("[,;]");
        String requestId = domains[0];

        int[] nums = new int[domains.length - 1];
        for (int i = 1; i < domains.length - 1; i++) {
            nums[i - 1] = Integer.parseInt(domains[i]);
        }
        Arrays.sort(nums);

        String result = requestId + ";" + nums[nums.length - 2] + "," + nums[2];
        byte[] sendResult = result.getBytes();

        DatagramPacket resultPacket = new DatagramPacket(sendResult, sendResult.length, InetAddress.getByName("203.162.10.109"), 2207);
        socket.send(resultPacket);
        System.out.println("Sent: " + result);

        socket.close();
    }
}
