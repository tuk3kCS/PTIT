//[Mã câu hỏi (qCode): Eo0r3z68].  Một chương trình server hỗ trợ kết nối qua giao thức TCP tại cổng 2206 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5s).
//Yêu cầu xây dựng chương trình client thực hiện kết nối tới server trên sử dụng luồng byte dữ liệu (InputStream/OutputStream) để trao đổi thông tin theo thứ tự:
//a.	Gửi mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode". Ví dụ: "B16DCCN999;C64967DD"
//b.	Nhận dữ liệu từ server là một chuỗi gồm các giá trị nguyên được phân tách với nhau bằng  "|"
//Ex: 2|5|9|11
//c.	Thực hiện tìm giá trị tổng của các số nguyên trong chuỗi và gửi lên server
//Ex: 27
//d.	Đóng kết nối và kết thúc

import java.io.*;
import java.net.*;

public class Eo0r3z68 {
    public static void main(String[] args) throws Exception{
        String ip = "203.162.10.109";
        int port = 2206;
        String studentCode = "B22DCDT294";
        String qCode = "Eo0r3z68";

        Socket socket = new Socket(ip, port);
        socket.setSoTimeout(5000);

        InputStream in = socket.getInputStream();
        OutputStream out = socket.getOutputStream();

        String request = studentCode + ";" + qCode;
        out.write(request.getBytes());
        out.flush();
        System.out.println("Sent: " + request);

        byte[] buffer = new byte[1024];
        int bytesRead = in.read(buffer);
        String response = new String(buffer, 0, bytesRead).trim();
        System.out.println("Receive: " + response);

        String[] domains = response.split("\\|");
        int sum = 0;
        for (String domain : domains) sum += Integer.parseInt(domain);

        String result = "" + sum;
        out.write(result.getBytes());
        out.flush();
        System.out.println("Send: " + result);

        socket.close();
    }
}
