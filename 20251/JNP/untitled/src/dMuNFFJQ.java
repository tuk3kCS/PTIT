import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class dMuNFFJQ {
    public static void main(String[] args) {
        final String SERVER_IP = "203.162.10.109";
        final int SERVER_PORT = 2207;
        final String STUDENT_CODE = "B22DCDT294";  // thay bằng mã sinh viên của bạn
        final String Q_CODE = "dMuNFFJQ";          // thay bằng mã câu hỏi của bạn

        try {
            // 1. Tạo UDP socket
            DatagramSocket socket = new DatagramSocket();

            // 2. Tạo gói tin gửi cho server
            String message = ";" + STUDENT_CODE + ";" + Q_CODE;
            byte[] sendData = message.getBytes();
            InetAddress serverAddr = InetAddress.getByName(SERVER_IP);

            DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, serverAddr, SERVER_PORT);
            socket.send(sendPacket);
            System.out.println("Đã gửi: " + message);

            // 3. Nhận dữ liệu phản hồi từ server
            byte[] receiveData = new byte[4096];
            DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receivePacket);

            String response = new String(receivePacket.getData(), 0, receivePacket.getLength());
            System.out.println("Nhận: " + response);

            // 4. Phân tích dữ liệu
            String[] parts = response.split(";");
            String requestId = parts[0];
            String[] numbersStr = parts[1].split(",");

            int[] numbers = new int[numbersStr.length];
            for (int i = 0; i < numbersStr.length; i++) {
                numbers[i] = Integer.parseInt(numbersStr[i].trim());
            }

            // 5. Tìm max và min
            int max = numbers[0], min = numbers[0];
            for (int num : numbers) {
                if (num > max) max = num;
                if (num < min) min = num;
            }

            // 6. Gửi lại kết quả
            String result = requestId + ";" + max + "," + min;
            byte[] resultData = result.getBytes();
            DatagramPacket resultPacket = new DatagramPacket(resultData, resultData.length, serverAddr, SERVER_PORT);
            socket.send(resultPacket);
            System.out.println("Đã gửi kết quả: " + result);

            // 7. Đóng socket
            socket.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
