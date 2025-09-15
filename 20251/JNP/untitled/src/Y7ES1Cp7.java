//[Mã câu hỏi (qCode): Y7ES1Cp7].  Một chương trình server cho phép kết nối qua giao thức TCP tại cổng 2208 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5 giây). Yêu cầu là xây dựng một chương trình client tương tác với server sử dụng các luồng ký tự (BufferedReader/BufferedWriter) theo kịch bản sau:
//a. Gửi một chuỗi chứa mã sinh viên và mã câu hỏi với định dạng "studentCode;qCode".
//Ví dụ: "B15DCCN999;1D08FX21"
//b. Nhận từ server một chuỗi chứa nhiều từ, các từ được phân tách bởi khoảng trắng.
//Ví dụ: "hello world programming is fun"
//c. Thực hiện đảo ngược từ và mã hóa RLE để nén chuỗi ("aabb" nén thành "a2b2"). Gửi chuỗi đã được xử lý lên server. Ví dụ: "ol2eh dlrow gnim2argorp si nuf".
//d. Đóng kết nối và kết thúc chương trình

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class Y7ES1Cp7 {
    public static String rleEncode(String s) {
        StringBuilder sb = new StringBuilder();
        int count = 1;
        for (int i = 1; i <= s.length(); i++) {
            if (i < s.length() && s.charAt(i) == s.charAt(i - 1)) count++;
            else {
                sb.append(s.charAt(i - 1));
                if (count > 1) sb.append(count);
                count = 1;
            }
        }
        return sb.toString();
    }

    public static void main(String[] args) throws Exception {
        String ip = "203.162.10.109";
        int port = 2208;
        String studentCode = "B22DCDT294";
        String qCode = "Y7ES1Cp7";

        Socket socket = new Socket(ip, port);
        socket.setSoTimeout(5000);

        BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

        String request = studentCode + ";" + qCode;
        bw.write(request);
        bw.newLine();
        bw.flush();
        System.out.println("Sent: " + request);

        String response = br.readLine();
        System.out.println("Received: " + response);

        String[] words = response.split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (String word : words) {
            //word = word.trim().toLowerCase();
            String reversed = new StringBuilder(word).reverse().toString();
            String encoded = rleEncode(reversed);
            if (sb.length() > 0) sb.append(" ");
            sb.append(encoded);
        }

        String result = sb.toString();
        bw.write(result);
        bw.newLine();
        bw.flush();
        System.out.println("Sent: " + result);

        socket.close();
    }
}
