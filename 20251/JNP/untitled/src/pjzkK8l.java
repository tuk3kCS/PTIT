import java.math.BigInteger;
import java.net.*;
import java.io.*;

public class pjzkK8l {
    public static void main(String[] args) throws Exception {
        DatagramSocket socket = new DatagramSocket();

        String request = ";B22DCDT294;7pjzkK8l";
        byte[] sendData = request.getBytes();

        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, InetAddress.getByName("203.162.10.109"), 2207);
        socket.send(sendPacket);
        System.out.println("Gửi: " + request);

        byte[] receiveData = new byte[1024];
        DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
        socket.receive(receivePacket);

        String response = new String(receivePacket.getData(), 0, receivePacket.getLength());
        System.out.println("Nhận: " + response);

        String[] domains = response.split(";");
        String requestId = domains[0];
        BigInteger a = new BigInteger(domains[1]);
        BigInteger b = new BigInteger(domains[2]);
        BigInteger sum = a.add(b);
        BigInteger diff = a.subtract(b);

        String result = requestId + ";" + sum.toString() + "," + diff.toString();
        byte[] resultData = result.getBytes();

        DatagramPacket resultPacket = new DatagramPacket(resultData, resultData.length, InetAddress.getByName("203.162.10.109"), 2207);
        socket.send(resultPacket);
        System.out.println("Gửi: " + result);
    }
}
