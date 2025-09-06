import javax.swing.*;

public class MainApp {
    private final Register registerWindow;
    private final Login loginWindow;

    public static void main(String[] args) {
        SwingUtilities.invokeLater(MainApp::new);
    }

    public MainApp() {
        registerWindow = new Register(this);
        loginWindow = new Login(this);
        showRegister();
    }

    public void showRegister() {
        loginWindow.setVisible(false);
        registerWindow.setVisible(true);
    }

    public void showLogin() {
        registerWindow.setVisible(false);
        loginWindow.setVisible(true);
    }
}
