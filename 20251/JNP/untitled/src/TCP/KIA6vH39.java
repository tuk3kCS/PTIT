//[Mã câu hỏi (qCode): KIA6vH39].  Một chương trình server cho phép kết nối qua giao thức TCP tại cổng 2209 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5 giây). Yêu cầu là xây dựng một chương trình client tương tác với server sử dụng các luồng đối tượng (ObjectOutputStream/ObjectInputStream) để gửi/nhận và chuẩn hóa thông tin địa chỉ của khách hàng.
//Biết rằng lớp TCP.Address có các thuộc tính (id int, code String, addressLine String, city String, postalCode String) và trường dữ liệu private static final long serialVersionUID = 20180801L.
//a. Gửi đối tượng là một chuỗi gồm mã sinh viên và mã câu hỏi với định dạng "studentCode;qCode". Ví dụ: "B15DCCN999;A1B2C3D4"
//b. Nhận một đối tượng là thể hiện của lớp TCP.Address từ server. Thực hiện chuẩn hóa thông tin addressLine bằng cách:
//•	Chuẩn hóa addressLine: Viết hoa chữ cái đầu mỗi từ, in thường các chữ còn lại, loại bỏ ký tự đặc biệt và khoảng trắng thừa (ví dụ: "123 nguyen!!! van cu" → "123 Nguyen Van Cu")
//•	Chuẩn hóa postalCode: Chỉ giữ lại số và ký tự "-" ví dụ: "123-456"
//c. Gửi đối tượng đã được chuẩn hóa thông tin địa chỉ lên server.
//d. Đóng kết nối và kết thúc chương trình.

package TCP;

import java.io.*;
import java.net.*;

public class KIA6vH39 {
    public static String chuanHoaAddressLine(String s) {
        if (s == null) return "";
        String cleaned = s.replaceAll("[^a-zA-Z0-9\\s]", "");
        cleaned = cleaned.trim().replaceAll("\\s+", " ");
        StringBuilder sb = new StringBuilder();
        for (String word : cleaned.split(" ")) {
            if (word.isEmpty()) continue;
            sb.append(Character.toUpperCase(word.charAt(0)));
            if (word.length() > 1) {
                sb.append(word.substring(1).toLowerCase());
            }
            sb.append(" ");
        }
        return sb.toString().trim();
    }

    public static void main(String[] args) throws Exception {
        Socket socket = new Socket("203.162.10.109", 2209);
        socket.setSoTimeout(5000);

        ObjectInputStream ois = new ObjectInputStream(socket.getInputStream());
        ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());

        String request = "B22DCDT294;KIA6vH39";
        oos.writeObject(request);
        oos.flush();
        System.out.println("Sent: " + request);

        Object obj = ois.readObject();
        Address address = (Address) obj;
        System.out.println("Received: " + address);

        String addressLine = chuanHoaAddressLine(address.getAddressLine());
        address.setAddressLine(addressLine);

        String postalCode = address.getPostalCode().replaceAll("[^0-9-]", "");
        address.setPostalCode(postalCode);

        oos.writeObject(address);
        oos.flush();
        System.out.println("Sent: " + address);

        socket.close();
    }
}
