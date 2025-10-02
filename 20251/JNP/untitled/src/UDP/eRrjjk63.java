//[Mã câu hỏi (qCode): eRrjjk63].  Thông tin khách hàng được yêu cầu thay đổi định dạng lại cho phù hợp với khu vực, cụ thể:
//a.	Tên khách hàng cần được chuẩn hóa theo định dạng mới. Ví dụ: nguyen van hai duong -> DUONG, Nguyen Van Hai
//b.	Ngày sinh của khách hàng đang ở dạng mm-dd-yyyy, cần được chuyển thành định dạng dd/mm/yyyy. Ví dụ: 10-11-2012 -> 11/10/2012
//c.	Tài khoản khách hàng được tạo từ các chữ cái in thường được sinh tự động từ họ tên khách hàng. Ví dụ: nguyen van hai duong -> nvhduong
//
//
//Một chương trình server cho phép giao tiếp qua giao thức UDP tại cổng 2209. Yêu cầu là xây dựng một chương trình client giao tiếp với server theo mô tả sau:
//a.	Đối tượng trao đổi là thể hiện của lớp UDP.Customer được mô tả như sau
//•	Tên đầy đủ của lớp: UDP.Customer
//•	Các thuộc tính: id String, code String, name String, , dayOfBirth String, userName String
//•	Một Hàm khởi tạo với đầy đủ các thuộc tính được liệt kê ở trên
//•	Trường dữ liệu: private static final long serialVersionUID = 20151107;
//
//b.	Client giao tiếp với server theo các bước
//•       Gửi thông điệp là một chuỗi chứa mã sinh viên và mã câu hỏi theo định dạng “;studentCode;qCode”. Ví dụ: “;B15DCCN001;EE29C059”
//
//        •	Nhận thông điệp chứa: 08 byte đầu chứa chuỗi requestId, các byte còn lại chứa một đối tượng là thể hiện của lớp Customer từ server. Trong đó, các thuộc tính id, code, name,dayOfBirth đã được thiết lập sẵn.
//        •	Yêu cầu thay đổi thông tin các thuộc tính như yêu cầu ở trên và gửi lại đối tượng khách hàng đã được sửa đổi lên server với cấu trúc:
//        08 byte đầu chứa chuỗi requestId và các byte còn lại chứa đối tượng Customer đã được sửa đổi.
//•	Đóng socket và kết thúc chương trình.

package UDP;

import java.io.*;
import java.net.*;

public class eRrjjk63 {
    public static void main(String[] args) throws Exception {
        DatagramSocket socket = new DatagramSocket();

        String request = ";B22DCDT294;eRrjjk63";
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
        Customer customer = (Customer) ois.readObject();

        String name = customer.getName();
        String[] words = name.trim().split(" ");
        String newName = words[words.length - 1].toUpperCase() + ", ";
        for (int i = 0; i < words.length - 1; i++) {
            newName += words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase();
            if (i < words.length - 2) newName += " ";
        }
        customer.setName(newName);
        System.out.println("Name: " + newName);

        String dob = customer.getDayOfBirth();
        String[] nums = dob.trim().split("-");
        String temp = nums[0];
        nums[0] = nums[1];
        nums[1] = temp;
        dob = String.join("/", nums);
        customer.setDayOfBirth(dob);
        System.out.println("DOB: " + dob);

        String[] newWords = name.trim().split(" ");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < newWords.length; i++) {
            if (i < newWords.length - 1) {
                sb.append(newWords[i].substring(0, 1).toLowerCase());
            } else {
                sb.append(newWords[i].toLowerCase());
            }
        }
        String userName = sb.toString();
        customer.setUserName(userName);
        System.out.println("UserName: " + customer.getUserName());

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        baos.write(requestId.getBytes());
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(customer);
        oos.flush();

        byte[] sendResult = baos.toByteArray();
        DatagramPacket resultPacket = new DatagramPacket(sendResult, sendResult.length, InetAddress.getByName("203.162.10.109"), 2209);
        socket.send(resultPacket);

        socket.close();
    }
}
