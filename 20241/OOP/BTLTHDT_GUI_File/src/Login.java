import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.*;
import java.util.*;

public class Login extends JFrame {
    private final JTextField loginUsername;
    private final JPasswordField loginPassword;
    private final File credentialFile = new File("LoginCredential.data");
    private final MainApp mainApp;

    public Login(MainApp app) {
        super("Login");
        this.mainApp = app;
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(800, 400);
        setLayout(null);
        setLocationRelativeTo(null);
        setResizable(false);

        JLabel titleLabel = new JLabel("Login", SwingConstants.CENTER);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 40));
        titleLabel.setBounds(240, 20, 300, 60);
        add(titleLabel);

        JLabel usernameLabel = new JLabel("Username");
        usernameLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        usernameLabel.setBounds(200, 100, 150, 30);
        add(usernameLabel);

        loginUsername = new JTextField();
        loginUsername.setFont(new Font("Arial", Font.PLAIN, 18));
        loginUsername.setBounds(350, 100, 240, 30);
        add(loginUsername);

        JLabel passwordLabel = new JLabel("Password");
        passwordLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        passwordLabel.setBounds(200, 160, 150, 30);
        add(passwordLabel);

        loginPassword = new JPasswordField();
        loginPassword.setFont(new Font("Arial", Font.PLAIN, 18));
        loginPassword.setBounds(350, 160, 240, 30);
        add(loginPassword);

        JButton registerButton = new JButton("Register");
        registerButton.setFont(new Font("Arial", Font.BOLD, 20));
        registerButton.setBounds(200, 250, 150, 50);
        registerButton.addActionListener(e -> {
            mainApp.showRegister();
            clearFields();
        });
        add(registerButton);

        JButton loginButton = new JButton("Login");
        loginButton.setFont(new Font("Arial", Font.BOLD, 20));
        loginButton.setBounds(440, 250, 150, 50);
        loginButton.addActionListener(this::loginUser);
        add(loginButton);
    }

    private void loginUser(ActionEvent e) {
        String username = loginUsername.getText();
        String password = new String(loginPassword.getPassword());

        Map<String, String> credentials = loadCredentials();

        if (credentials.containsKey(username) && credentials.get(username).equals(password)) {
            JOptionPane.showMessageDialog(this, "You have successfully signed in.");
        } else {
            JOptionPane.showMessageDialog(this, "Login credentials incorrect.");
        }
    }

    private Map<String, String> loadCredentials() {
        Map<String, String> credentials = new HashMap<>();
        if (credentialFile.exists()) {
            try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(credentialFile))) {
                credentials = (Map<String, String>) ois.readObject();
            } catch (IOException | ClassNotFoundException ex) {
                ex.printStackTrace();
            }
        }
        return credentials;
    }

    private void clearFields() {
        loginUsername.setText("");
        loginPassword.setText("");
    }
}
