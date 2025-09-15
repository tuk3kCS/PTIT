//[Mã câu hỏi (qCode): eh8DMnVV].  Một chương trình server cho phép kết nối qua TCP tại cổng 2207 (hỗ trợ thời gian liên lạc tối đa cho mỗi yêu cầu là 5 giây). Yêu cầu xây dựng chương trình client thực hiện giao tiếp với server sử dụng luồng data (DataInputStream/DataOutputStream) để trao đổi thông tin theo thứ tự:
//a. Gửi mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode".
//Ví dụ: "B10DCCN002;B4C5D6E7"
//b. Nhận chuỗi chứa mảng số nguyên từ server, các phần tử được phân tách bởi dấu phẩy ",". Ví dụ: "1,3,2,5,4,7,6"
//c. Tính số lần đổi chiều và tổng độ biến thiên trong dãy số.
//- Đổi chiều: Khi dãy chuyển từ tăng sang giảm hoặc từ giảm sang tăng
//-   Độ biến thiên: Tổng giá trị tuyệt đối của các hiệu số liên tiếp
//Gửi lần lượt lên server: số nguyên đại diện cho số lần đổi chiều, sau đó là số nguyên đại diện cho tổng độ biến thiên. Ví dụ: Với mảng "1,3,2,5,4,7,6", số lần đổi chiều: 5 lần, Tổng độ biến thiên 11 -> Gửi lần lượt số nguyên 5 và 11 lên server.
//d. Đóng kết nối và kết thúc chương trình.

import java.io.*;
import java.net.*;

public class eh8DMnVV {
    public static void main(String[] args) throws Exception {
        Socket socket = new Socket("203.162.10.109", 2207);
        socket.setSoTimeout(5000);

        DataInputStream in = new DataInputStream(socket.getInputStream());
        DataOutputStream out = new DataOutputStream(socket.getOutputStream());

        String request = "B22DCDT294;eh8DMnVV";
        out.writeUTF(request);
        out.flush();
        System.out.println("Sent: " + request);

        String response = in.readUTF();
        System.out.println("Received: " + response);

        String[] domains = response.split(",");
        long[] nums = new long[domains.length];
        for (int i = 0; i < domains.length; i++) {
            nums[i] = Integer.parseInt(domains[i].trim());
        }

        long diffSum = Math.abs(nums[nums.length - 1] - nums[nums.length - 2]);
        int count = 0;
        for (int i = 1; i < nums.length - 1; i++) {
            if ((nums[i - 1] - nums[i]) * (nums[i] - nums[i + 1]) < 0) count += 1;
            diffSum += Math.abs(nums[i - 1] - nums[i]);
        }

        out.writeInt(count);
        int result = (int) diffSum;
        out.writeInt(result);
        out.flush();
        System.out.println("Sent: " + count + ", " + result);

        socket.close();
    }
}
