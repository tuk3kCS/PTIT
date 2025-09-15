//[Mã câu hỏi (qCode): E8fa6gcZ].  Một chương trình server hỗ trợ kết nối qua giao thức TCP tại cổng 2206 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5s). Yêu cầu xây dựng chương trình client thực hiện kết nối tới server sử dụng luồng byte dữ liệu (InputStream/OutputStream) để trao đổi thông tin theo thứ tự:
//a. Gửi mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode".
//Ví dụ: "B16DCCN999;E56FAB67"
//b. Nhận dữ liệu từ server là một chuỗi các số nguyên được phân tách bởi ký tự ",".
//Ví dụ: " 3,7,2,5,8,1"
//c. Tìm vị trí mà độ lệch của tổng bên trái và tổng bên phải là nhỏ nhất -> Gửi lên server vị trí đó, tổng trái, tổng phải và độ lệch. Ví dụ: với dãy " 3,7,2,5,8,1", vị trí 3 có độ lệch nhỏ nhất = 3 → Kết quả gửi server: "3,12,9,3"
//d. Đóng kết nối và kết thúc chương trình.

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class E8fa6gcZ {
    public static void main(String[] args) throws Exception {
        String ip = "203.162.10.109";
        int port = 2206;
        String studentCode = "B22DCDT294";
        String qCode = "E8fa6gcZ";

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
        int[] nums = new int[domains.length];
        int sum = 0;
        for (int i = 0; i < domains.length; i++) {
            nums[i] = Integer.parseInt(domains[i]);
            sum += nums[i];
        }

        int bestIndex = -1;
        int bestLeft = 0, bestRight = 0, bestDiff = Integer.MAX_VALUE;

        for (int i = 0; i < nums.length; i++) {
            int sumLeft = 0, sumRight = 0;
            for (int l = 0; l < i; l++) sumLeft += nums[l];
            for (int r = i + 1; r < nums.length; r++) sumRight += nums[r];
            int diff = Math.abs(sumLeft - sumRight);

            if (diff < bestDiff) {
                bestDiff = diff;
                bestIndex = i;
                bestLeft = sumLeft;
                bestRight = sumRight;
            }
        }

        String result = bestIndex + "," + bestLeft + "," + bestRight + "," + bestDiff;
        out.write(result.getBytes());
        out.flush();
        System.out.println("Sent: " + result);

        socket.close();
    }
}
