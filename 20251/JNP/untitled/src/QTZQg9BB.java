//[Mã câu hỏi (qCode): QTZQg9BB].  Một chương trình máy chủ cho phép kết nối qua TCP tại cổng 2207 (hỗ trợ thời gian liên lạc tối đa cho mỗi yêu cầu là 5s), yêu cầu xây dựng chương trình (tạm gọi là client) thực hiện kết nối tới server tại cổng 2207, sử dụng luồng byte dữ liệu (DataInputStream/DataOutputStream) để trao đổi thông tin theo thứ tự:
//a.	Gửi chuỗi là mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode". Ví dụ: "B15DCCN999;1D25ED92"
//b.	Nhận lần lượt hai số nguyên a và b từ server
//c.	Thực hiện tính toán tổng, tích và gửi lần lượt từng giá trị theo đúng thứ tự trên lên server
//d.	Đóng kết nối và kết thúc

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;

public class QTZQg9BB {
    public static void main(String[] args) throws Exception {
        String ip = "203.162.10.109";
        int port = 2207;
        String studentCode = "B22DCDT294";
        String qCode = "QTZQg9BB";

        Socket socket = new Socket(ip, port);
        socket.setSoTimeout(5000);

        DataInputStream in = new DataInputStream(socket.getInputStream());
        DataOutputStream out = new DataOutputStream(socket.getOutputStream());

        String request = studentCode + ";" + qCode;
        out.writeUTF(request);
        out.flush();
        System.out.println("Sent: " + request);

        int a = in.readInt();
        int b = in.readInt();
        System.out.println("Received: " + a + ", " + b);

        int sum = a + b;
        int prod = a * b;

        out.writeInt(sum);
        out.writeInt(prod);
        out.flush();
        System.out.println("Sent: " + sum + ", " + prod);
    }
}
