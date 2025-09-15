//[Mã câu hỏi (qCode): XyLnwV87].  Một chương trình server hỗ trợ kết nối qua giao thức TCP tại cổng 2206 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5s). Yêu cầu xây dựng chương trình client thực hiện kết nối tới server sử dụng luồng byte dữ liệu (InputStream/OutputStream) để trao đổi thông tin theo thứ tự:
//a. Gửi mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode".
//Ví dụ: "B16DCCN999;C89DAB45"
//b. Nhận dữ liệu từ server là một chuỗi các số nguyên được phân tách bởi ký tự ",".
//Ví dụ: "8,4,2,10,5,6,1,3"
//c. Tính tổng của tất cả các số nguyên tố trong chuỗi và gửi kết quả lên server.
//Ví dụ: Với dãy "8,4,2,10,5,6,1,3", các số nguyên tố là 2, 5, 3, tổng là 10. Gửi lên server chuỗi "10".
//d. Đóng kết nối và kết thúc chương trình.

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class XyLnwV87 {
    public static int primeCheck(int n) {
        for (int i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0) return 0;
        }
        return 1;
    }

    public static void main(String[] args) throws Exception {
        String ip = "203.162.10.109";
        int port = 2206;
        String studentCode = "B22DCDT294";
        String qCode = "XyLnwV87";

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
        String response = new String(buffer, 0, bytesRead);
        System.out.println("Received: " + response);

        String[] domains = response.split(",");
        int sum = 0;
        for (String domain : domains) {
            int num = Integer.parseInt(domain);
            if (primeCheck(num) == 1) sum += num;
        }

        String result = "" + sum;
        out.write(result.getBytes());
        out.flush();
        System.out.println("Sent: " + result);

        socket.close();
    }
}
