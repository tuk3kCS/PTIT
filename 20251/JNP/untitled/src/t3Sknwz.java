//[Mã câu hỏi (qCode): 5t3Sknwz].  Một chương trình server hỗ trợ kết nối qua giao thức TCP tại cổng 2206 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5s). Yêu cầu xây dựng chương trình client thực hiện kết nối tới server sử dụng luồng byte dữ liệu (InputStream/OutputStream) để trao đổi thông tin theo thứ tự:
//a. Gửi mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode".
//Ví dụ: "B16DCCN999;D45EFA12"
//b. Nhận dữ liệu từ server là một chuỗi các số nguyên được phân tách bởi ký tự ",".
//Ví dụ: "10,5,15,20,25,30,35"
//c. Xác định hai số trong dãy có tổng gần nhất với gấp đôi giá trị trung bình của toàn bộ dãy. Gửi thông điệp lên server theo định dạng "num1,num2" (với num1 < num2)
//Ví dụ: Với dãy "10,5,15,20,25,30,35", gấp đôi giá trị trung bình là 40, hai số có tổng gần nhất là 15 và 25. Gửi lên server chuỗi "15,25".
//d. Đóng kết nối và kết thúc chương trình.

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class t3Sknwz {
    public static void main(String[] args) throws Exception {
        String ip = "203.162.10.109";
        int port = 2206;
        String studentCode = "B22DCDT294";
        String qCode = "5t3Sknwz";

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

        String[] domains =  response.split(",");
        int[] nums = new int[domains.length];
        int sum = 0;
        for (int i = 0; i < domains.length; i++) {
            nums[i] = Integer.parseInt(domains[i].trim());
            sum += nums[i];
        }

        double avg = (double) sum / nums.length;
        double target = 2 * avg;

        int num1 = nums[0], num2 = nums[1];
        double minDiff = Math.abs((num1 + num2) - target);

        for (int i = 0; i < nums.length; i++) {
            for (int j = i + 1; j < nums.length; j++) {
                int a = nums[i], b = nums[j];
                double diff = Math.abs((a + b) - target);
                if (diff < minDiff) {
                    minDiff = diff;
                    num1 = Math.min(a, b);
                    num2 = Math.max(a, b);
                }
            }
        }

        String result = num1 + "," + num2;
        out.write(result.getBytes());
        out.flush();
        System.out.println("Sent: " + result);

        socket.close();
    }
}
