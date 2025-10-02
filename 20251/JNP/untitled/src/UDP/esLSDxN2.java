//[Mã câu hỏi (qCode): esLSDxN2].  Thông tin sản phẩm vì một lý do nào đó đã bị sửa đổi thành không đúng, cụ thể:
//a.	Tên sản phẩm bị đổi ngược từ đầu tiên và từ cuối cùng, ví dụ: “lenovo thinkpad T520” bị chuyển thành “T520 thinkpad lenovo”
//b.	Số lượng sản phẩm cũng bị đảo ngược giá trị, ví dụ từ 9981 thành 1899
//
//Một chương trình server cho phép giao tiếp qua giao thức UDP tại cổng 2209. Yêu cầu là xây dựng một chương trình client giao tiếp với server để gửi/nhận các sản phẩm theo mô tả dưới đây:
//a.	Đối tượng trao đổi là thể hiện của lớp Product được mô tả như sau
//•	Tên đầy đủ của lớp: UDP.Product
//•	Các thuộc tính: id String, code String, name String, quantity int
//•	Một hàm khởi tạo có đầy đủ các thuộc tính được liệt kê ở trên
//•	Trường dữ liệu: private static final long serialVersionUID = 20161107;
//b.	Giao tiếp với server theo kịch bản
//•       Gửi thông điệp là một chuỗi chứa mã sinh viên và mã câu hỏi theo định dạng “;studentCode;qCode”. Ví dụ: “;B15DCCN001;EE29C059”
//
//        •	Nhận thông điệp chứa: 08 byte đầu chứa chuỗi requestId, các byte còn lại chứa một đối tượng là thể hiện của lớp Product từ server. Trong đối tượng này, các thuộc tính id, name và quantity đã được thiết lập giá trị.
//•	Sửa các thông tin sai của đối tượng về tên và số lượng như mô tả ở trên và gửi đối tượng vừa được sửa đổi lên server theo cấu trúc:
//        08 byte đầu chứa chuỗi requestId và các byte còn lại chứa đối tượng Product đã được sửa đổi.
//•	Đóng socket và kết thúc chương trình.

package UDP;

import java.io.*;
import java.net.*;
import java.util.*;

public class esLSDxN2 {
    public static void main(String[] args) throws Exception {
        DatagramSocket socket = new DatagramSocket();

        String request = ";B22DCDT294;esLSDxN2";
        byte[] sendData = request.getBytes();

        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, InetAddress.getByName("203.162.10.109"), 2209);
        socket.send(sendPacket);
        System.out.println("Send: " + request);

        byte[] receiveData = new byte[1024];
        DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
        socket.receive(receivePacket);

        byte[] data = receivePacket.getData();
        String requestId = new String(data, 0, 8);
        System.out.println("RequestId: " + requestId);

        ByteArrayInputStream bais = new ByteArrayInputStream(data, 8, receivePacket.getLength() - 8);
        ObjectInputStream ois = new ObjectInputStream(bais);
        Product product = (Product) ois.readObject();
        System.out.println("Product: " + product);

        String name = product.getName();
        String[] words = name.split(" ");
        String temp = "";
        temp = words[0];
        words[0] = words[words.length - 1];
        words[words.length - 1] = temp;
        product.setName(String.join(" ", words));

        StringBuilder sb = new StringBuilder(Integer.toString(product.getQuantity()));
        product.setQuantity(Integer.parseInt(sb.reverse().toString()));
        System.out.println("New product: " + product);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        baos.write(requestId.getBytes());
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(product);
        oos.flush();

        byte[] sendResult = baos.toByteArray();
        DatagramPacket resultPacket = new DatagramPacket(sendResult, sendResult.length, InetAddress.getByName("203.162.10.109"), 2209);
        socket.send(resultPacket);
        System.out.println("Send: " + resultPacket);
    }
}
