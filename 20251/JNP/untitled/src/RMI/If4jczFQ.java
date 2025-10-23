//[Mã câu hỏi (qCode): If4jczFQ].  Một chương trình (tạm gọi là RMI Server) cung cấp giao diện cho phép triệu gọi từ xa để xử lý chuỗi.
//Giao diện từ xa:
//public interface CharacterService extends Remote {
//    public String requestCharacter(String studentCode, String qCode) throws RemoteException;
//    public void submitCharacter(String studentCode, String qCode, String strSubmit) throws RemoteException;
//}
//Trong đó:
//• Interface CharacterService được viết trong package RMI.
//• Đối tượng cài đặt giao diện từ xa CharacterService được đăng ký với RegistryServer với tên là: RMICharacterService.
//Yêu cầu: Viết chương trình tại máy trạm (RMI client) để thực hiện các công việc sau với chuỗi được nhận từ RMI Server:
//a. Triệu gọi phương thức requestCharacter để nhận chuỗi ngẫu nhiên từ server với định dạng: "Chuỗi số La Mã đầu vào".
//b. Thực hiện chuyển đổi chuỗi số La Mã nhận được thành số thập phân (Decimal).
//Quy tắc chuyển đổi: Các ký tự La Mã chính bao gồm: I=1, V=5, X=10, L=50, C=100, D=500, M=1000.
//Ví dụ: "MCMXCIV" -> 1994.
//c. Triệu gọi phương thức submitCharacter để gửi số thập phân đã chuyển đổi trở lại server.
//d. Kết thúc chương trình client.

package RMI;

import java.rmi.*;
import java.util.*;

public class If4jczFQ {
    public static int romanToDecimal(String roman) {
        Map<Character, Integer> map = new HashMap<>();
        map.put('I', 1);
        map.put('V', 5);
        map.put('X', 10);
        map.put('L', 50);
        map.put('C', 100);
        map.put('D', 500);
        map.put('M', 1000);

        int sum = 0;
        for (int i = 0; i < roman.length(); i++) {
            int value = map.get(roman.charAt(i));
            if (i + 1 < roman.length() && value < map.get(roman.charAt(i + 1))) {
                sum -= value;
            }
            else {
                sum += value;
            }
        }
        return sum;
    }

    public static void main(String[] args) throws Exception {
        CharacterService service = (CharacterService) Naming.lookup("rmi://203.162.10.109/RMICharacterService");

        String data = service.requestCharacter("B22DCDT294", "If4jczFQ");
        System.out.println("Received: " + data);

        String roman = data.trim();

        int decimal = romanToDecimal(roman);
        System.out.println("Result: " + decimal);

        service.submitCharacter("B22DCDT294", "If4jczFQ", String.valueOf(decimal));
    }
}
