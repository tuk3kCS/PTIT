//[Mã câu hỏi (qCode): TCP.fWqyhfOU].  Một chương trình server cho phép kết nối qua giao thức TCP tại cổng 2209 (hỗ trợ thời gian giao tiếp tối đa cho mỗi yêu cầu là 5 giây). Yêu cầu là xây dựng một chương trình client tương tác với server sử dụng các luồng đối tượng (ObjectOutputStream/ObjectInputStream) theo kịch bản dưới đây:
//
//Biết lớp TCP.Product gồm các thuộc tính (id int, name String, price double, int discount) và private static final long serialVersionUID = 20231107;
//
//a. Gửi đối tượng là một chuỗi gồm mã sinh viên và mã câu hỏi với định dạng "studentCode;qCode". Ví dụ: "B15DCCN999;1E08CA31"
//
//b. Nhận một đối tượng là thể hiện của lớp TCP.Product từ server.
//
//c. Tính toán giá trị giảm giá theo price theo nguyên tắc: Giá trị giảm giá (discount) bằng tổng các chữ số trong phần nguyên của giá sản phẩm (price). Thực hiện gán giá trị cho thuộc tính discount và gửi lên đối tượng nhận được lên server.
//
//d. Đóng kết nối và kết thúc chương trình.

package TCP;

import java.io.*;
import java.net.*;

public class fWqyhfOU {
    public static void main(String[] args) throws Exception {
        Socket socket = new Socket("203.162.10.109", 2209);
        socket.setSoTimeout(5000);

        ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
        ObjectInputStream ois = new ObjectInputStream(socket.getInputStream());

        String request = "B22DCDT294;fWqyhfOU";
        oos.writeObject(request);
        oos.flush();
        System.out.println("Sent: " + request);

        Object obj = ois.readObject();
        Product product = (Product) obj;
        System.out.println("Received: " + product);

        long price = (long) product.getPrice();
        int discount = 0;
        while (price > 0) {
            discount += price % 10;
            price /= 10;
        }
        product.setDiscount(discount);

        oos.writeObject(product);
        oos.flush();
        System.out.println("Sent: " + product);

        socket.close();
    }
}
