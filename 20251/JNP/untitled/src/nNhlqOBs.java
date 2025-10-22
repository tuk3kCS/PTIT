//[Mã câu hỏi (qCode): nNhlqOBs].  Một chương trình server hỗ trợ kết nối qua giao thức TCP tại cổng 2206 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5s). Yêu cầu xây dựng chương trình client thực hiện kết nối tới server sử dụng luồng byte dữ liệu (InputStream/OutputStream) để trao đổi thông tin theo thứ tự:
//a. Gửi mã sinh viên và mã câu hỏi theo định dạng "studentCode;qCode". Ví dụ: "B16DCCN999;76B68B3B".
//b. Nhận dữ liệu từ server là một chuỗi các giá trị số nguyên được phân tách bởi ký tự ",". Ví dụ: 5,10,20,25,50,40,30,35.
//c. Tìm chuỗi con tăng dần dài nhất và gửi độ dài của chuỗi đó lên server theo format "chuỗi tăng dài nhất; độ dài". Ví dụ: 5,10,20,25,50;5
//d. Đóng kết nối và kết thúc chương trình.

import java.net.*;
import java.io.*;
import java.util.*;

public class nNhlqOBs {
    public static List<Integer> findLongestIncreasingSubsequence(int[] arr) {
        List<Integer> longest = new ArrayList<>();
        List<Integer> current = new ArrayList<>();

        current.add(arr[0]);
        for (int i = 1; i < arr.length; i++) {
            if (arr[i] > arr[i - 1]) {
                current.add(arr[i]);
            } else {
                if (current.size() > longest.size()) {
                    longest = new ArrayList<>(current);
                }
                current.clear();
                current.add(arr[i]);
            }
        }
        if (current.size() > longest.size()) {
            longest = new ArrayList<>(current);
        }
        return longest;
    }

    public static void main(String[] args) throws Exception {
        Socket socket = new Socket("203.162.10.109", 2206);
        socket.setSoTimeout(5000);

        InputStream in = socket.getInputStream();
        OutputStream out = socket.getOutputStream();

        String request = "B22DCDT294;nNhlqOBs";
        out.write(request.getBytes());
        out.flush();
        System.out.println("req: " + request);

        byte[] buffer = new byte[1024];
        int bytesRead = in.read(buffer);
        String response = new String(buffer, 0, bytesRead);
        System.out.println("res: " + response);

        String[] domains = response.split(",");
        int[] nums = new int[domains.length];
        for (int i = 0; i < nums.length; i++) nums[i] = Integer.parseInt(domains[i]);

        List<Integer> list = findLongestIncreasingSubsequence(nums);

        String result = "";
        for (int i = 0; i < list.size(); i++) {
            result += list.get(i);
            if (i < list.size() - 1) result += ",";
        }
        result += ";" + list.size();
        System.out.println("result: " + result);
        out.write(result.getBytes());
        out.flush();

        socket.close();
    }
}
