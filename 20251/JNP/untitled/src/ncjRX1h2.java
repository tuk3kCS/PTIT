//[Mã câu hỏi (qCode): ncjRX1h2].  Một chương trình server cho phép kết nối qua TCP tại cổng 2207 (hỗ trợ thời gian liên lạc tối đa cho mỗi yêu cầu là 5 giây). Yêu cầu xây dựng chương trình client thực hiện giao tiếp với server sử dụng luồng data (DataInputStream/DataOutputStream) để trao đổi thông tin theo thứ tự:
//a. Gửi mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode".
//Ví dụ: "B10DCCN003;C6D7E8F9"
//b. Nhận lần lượt:
//        •	Một số nguyên k là độ dài đoạn.
//        •	Chuỗi chứa mảng số nguyên, các phần tử được phân tách bởi dấu phẩy ",".
//Ví dụ: Nhận k = 3 và "1,2,3,4,5,6,7,8".
//c. Thực hiện chia mảng thành các đoạn có độ dài k và đảo ngược mỗi đoạn, sau đó gửi mảng đã xử lý lên server. Ví dụ: Với k = 3 và mảng "1,2,3,4,5,6,7,8", kết quả là "3,2,1,6,5,4,8,7". Gửi chuỗi kết quả "3,2,1,6,5,4,8,7" lên server.
//d. Đóng kết nối và kết thúc chương trình

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class ncjRX1h2 {
    public static void main(String[] args) throws Exception {
        Socket socket = new Socket("203.162.10.109", 2207);
        socket.setSoTimeout(5000);

        DataInputStream in = new DataInputStream(socket.getInputStream());
        DataOutputStream out = new DataOutputStream(socket.getOutputStream());

        String request = "B22DCDT294;ncjRX1h2";
        out.writeUTF(request);
        out.flush();
        System.out.println("Sent: " + request);

        int k = in.readInt();
        String response = in.readUTF();
        System.out.println("Received: " + k + "\n" + response);

        String[] domains = response.split(",");
        int[] nums = new int[domains.length];
        for (int i = 0; i < domains.length; i++) {
            nums[i] = Integer.parseInt(domains[i].trim());
        }

        int r = domains.length % k;
        int mul = domains.length / k;
        System.out.println(r + " " + mul);
        if (r == 0) {
            r = k;
            mul -= 1;
        }

        List<String> list = new ArrayList<String>();
        for (int i = 1; i <= mul; i++) {
            int pos = i * k;
            for (int j = pos - 1; j > pos - 1 - k; j--) {
                list.add(nums[j] + "");
            }
        }

        for (int i = nums.length - 1; i > nums.length - 1 - r; i--) {
            list.add(nums[i] + "");
        }

        String result = String.join(",", list);
        out.writeUTF(result);
        out.flush();
        System.out.println("Sent: " + result);

        socket.close();
    }
}
