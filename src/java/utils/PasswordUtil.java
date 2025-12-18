package utils;

import java.security.MessageDigest;

public class PasswordUtil {

  public static String hashPassword(String password) {
    if (password == null) {
        throw new IllegalArgumentException("Password không được null");
    }

    try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashBytes = md.digest(password.getBytes("UTF-8"));

        StringBuilder sb = new StringBuilder();
        for (byte b : hashBytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();

    } catch (Exception e) {
        throw new RuntimeException(e);
    }
}


    // So sánh password input với password đã hash
    public static boolean verifyPassword(String inputPassword, String storedHash) {
        String hashedInput = hashPassword(inputPassword);
        return hashedInput.equals(storedHash);
    }
}
