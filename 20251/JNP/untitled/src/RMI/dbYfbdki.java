//[Mã câu hỏi (qCode): dbYfbdki].  Một chương trình (tạm gọi là RMI Server) cung cấp giao diện cho phép triệu gọi từ xa để xử lý thông tin nhân viên. Chương trình sẽ ngẫu nhiên tạo ra đối tượng Employee với các giá trị ban đầu và cung cấp cho RMI client như sau:
//Giao diện từ xa:
//public interface ObjectService extends Remote {
//    public Serializable requestObject(String studentCode, String qCode) throws RemoteException;
//    public void submitObject(String studentCode, String qCode, Serializable object) throws RemoteException;
//}
//Lớp Employee gồm các thuộc tính: id String, name String, baseSalary double, experienceYears int, finalSalary double.
//Trường dữ liệu: private static final long serialVersionUID = 20241119L;
//02 hàm khởi dựng:
//public Employee()
//public Employee(String id, String name, double baseSalary, int experienceYears)
//Trong đó:
//•	Interface ObjectService và lớp Employee được viết trong package RMI.
//•	Đối tượng cài đặt giao diện từ xa ObjectService được đăng ký với RegistryServer với tên là: RMIObjectService.
//Yêu cầu: Viết chương trình tại máy trạm (RMI client) để thực hiện các công việc sau với đối tượng nhân viên được nhận từ RMI Server:
//a. Triệu gọi phương thức requestObject với tham số đầu vào là mã sinh viên và mã câu hỏi để nhận đối tượng Employee ngẫu nhiên từ server.
//b. Tính toán finalSalary dựa trên baseSalary, experienceYears, và áp dụng thuật toán xử lý số phức tạp để tạo hệ số điều chỉnh, yêu cầu sinh viên phải thao tác và xử lý experienceYears như sau:
//        •	Tách experienceYears thành tổng các chữ số (ví dụ, 14 sẽ thành 1 + 4 = 5).
//        •	Tính số lượng ước số nguyên của experienceYears (ví dụ, nếu experienceYears là 12, các ước số là 1, 2, 3, 4, 6, 12, nên có 6 ước số).
//        •	Xác định hệ số điều chỉnh factor dựa trên công thức sau: factor = (Số năm làm việc + tổng các chữ số + số lượng ước số) / 100.0
//        •	Tính finalSalary theo công thức: finalSalary = baseSalary * (1 + factor)
//c. Cập nhật giá trị finalSalary trong đối tượng Employee.
//d. Triệu gọi phương thức submitObject để gửi đối tượng Employee đã được xử lý trở lại server.
//e. Kết thúc chương trình client.

package RMI;

import java.rmi.*;

public class dbYfbdki {
    public static int sumOfDigits(int n) {
        n = Math.abs(n);
        int sum = 0;
        if (n == 0) return 0;
        while (n > 0) {
            sum += n % 10;
            n /= 10;
        }
        return sum;
    }

    public static int countDivisors(int n) {
        if (n <= 0) return 0;
        int count = 0;
        for (int i = 1; i <= Math.sqrt(n); i++) {
            if (n % i == 0) {
                count += (i * i == n) ? 1 : 2;
            }
        }
        return count;
    }

    public static void main(String[] args) throws Exception {
        ObjectService service = (ObjectService) Naming.lookup("rmi://203.162.10.109/RMIObjectService");

        Object object = service.requestObject("B22DCDT294", "dbYfbdki");
        Employee employee = (Employee) object;
        System.out.println("Received: " + employee);

        int experienceYears = employee.getExperienceYears();
        int sumDigits = sumOfDigits(experienceYears);
        int divisorCount = countDivisors(Math.abs(experienceYears));

        double factor = (experienceYears + sumDigits + divisorCount) / 100.0;
        double finalSalary = employee.getBaseSalary() * (1.0 + factor);

        employee.setFinalSalary(finalSalary);
        System.out.println("Result: " + employee);

        service.submitObject("B22DCDT294", "dbYfbdki", employee);
    }
}
