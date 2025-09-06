import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.*;
import java.util.*;

public class Register extends JFrame {
    private final JTextField regFirstName;
    private final JTextField regLastName;
    private final JTextField regEmail;
    private final JTextField regUsername;
    private final JTextField regPhone;
    private final JPasswordField regPassword;
    private final File credentialFile = new File("LoginCredential.data");
    private final MainApp mainApp;

    public Register(MainApp app) {
        super("New User Register");
        this.mainApp = app;
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1200, 450);
        setLayout(null);
        setLocationRelativeTo(null);
        setResizable(false);

        JLabel titleLabel = new JLabel("New User Register", SwingConstants.CENTER);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 40));
        titleLabel.setBounds(350, 20, 500, 60);
        add(titleLabel);

        JLabel firstNameLabel = new JLabel("First Name");
        firstNameLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        firstNameLabel.setBounds(100, 100, 150, 30);
        add(firstNameLabel);

        regFirstName = new JTextField();
        regFirstName.setFont(new Font("Arial", Font.PLAIN, 18));
        regFirstName.setBounds(250, 100, 200, 30);
        add(regFirstName);

        JLabel lastNameLabel = new JLabel("Last Name");
        lastNameLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        lastNameLabel.setBounds(100, 160, 150, 30);
        add(lastNameLabel);

        regLastName = new JTextField();
        regLastName.setFont(new Font("Arial", Font.PLAIN, 18));
        regLastName.setBounds(250, 160, 200, 30);
        add(regLastName);

        JLabel emailLabel = new JLabel("Email Address");
        emailLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        emailLabel.setBounds(100, 220, 150, 30);
        add(emailLabel);

        regEmail = new JTextField();
        regEmail.setFont(new Font("Arial", Font.PLAIN, 18));
        regEmail.setBounds(250, 220, 200, 30);
        add(regEmail);

        JLabel usernameLabel = new JLabel("Username");
        usernameLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        usernameLabel.setBounds(700, 100, 150, 30);
        add(usernameLabel);

        regUsername = new JTextField();
        regUsername.setFont(new Font("Arial", Font.PLAIN, 18));
        regUsername.setBounds(850, 100, 200, 30);
        add(regUsername);

        JLabel passwordLabel = new JLabel("Password");
        passwordLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        passwordLabel.setBounds(700, 160, 150, 30);
        add(passwordLabel);

        regPassword = new JPasswordField();
        regPassword.setFont(new Font("Arial", Font.PLAIN, 18));
        regPassword.setBounds(850, 160, 200, 30);
        add(regPassword);

        JLabel phoneLabel = new JLabel("Phone Number");
        phoneLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        phoneLabel.setBounds(700, 220, 150, 30);
        add(phoneLabel);

        regPhone = new JTextField();
        regPhone.setFont(new Font("Arial", Font.PLAIN, 18));
        regPhone.setBounds(850, 220, 200, 30);
        add(regPhone);

        JButton registerButton = new JButton("Register");
        registerButton.setFont(new Font("Arial", Font.BOLD, 20));
        registerButton.setBounds(200, 300, 150, 50);
        registerButton.addActionListener(this::registerUser);
        add(registerButton);

        JButton loginButton = new JButton("Login");
        loginButton.setFont(new Font("Arial", Font.BOLD, 20));
        loginButton.setBounds(820, 300, 150, 50);
        loginButton.addActionListener(e -> {
            mainApp.showLogin();
            clearFields();
        });
        add(loginButton);
    }

    private void registerUser(ActionEvent e) {
        String username = regUsername.getText();
        String password = new String(regPassword.getPassword());

        if (username.isEmpty() || password.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Username and password cannot be empty.");
            return;
        }

        Map<String, String> credentials = loadCredentials();

        if (credentials.containsKey(username)) {
            JOptionPane.showMessageDialog(this, "Username has been already taken.");
        } else {
            credentials.put(username, password);
            saveCredentials(credentials);
            JOptionPane.showMessageDialog(this, "Welcome, " + username + ".\nYour account is successfully registered.");
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

    private void saveCredentials(Map<String, String> credentials) {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(credentialFile))) {
            oos.writeObject(credentials);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void clearFields() {
        regFirstName.setText("");
        regLastName.setText("");
        regEmail.setText("");
        regUsername.setText("");
        regPassword.setText("");
        regPhone.setText("");
    }
}
