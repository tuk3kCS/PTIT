import java.io.FileWriter;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        String data = "cứt";
        try {
            FileWriter writer = new FileWriter("output.txt");
            writer.write(data);
            writer.close();
            System.out.println("Successfully wrote text to file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}