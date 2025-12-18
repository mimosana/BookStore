package utils;

import java.util.regex.Pattern;

public class ValidateUtils {

    /* =====================
       CHECK RỖNG
       ===================== */
    public static boolean isEmpty(String s) {
        return s == null || s.trim().isEmpty();
    }

    /* =====================
       USERNAME
       3–20 ký tự, chữ + số + _
       ===================== */
    public static boolean isValidUsername(String username) {
        if (isEmpty(username)) return false;
        return username.matches("^[a-zA-Z0-9_]{3,20}$");
    }

    /* =====================
       PASSWORD
       >= 6 ký tự
       ===================== */
    public static boolean isValidPassword(String password) {
        if (isEmpty(password)) return false;
        return password.length() >= 6;
    }

    /* =====================
       PASSWORD STRONG
       >= 8 ký tự, có chữ hoa, chữ thường, số
       ===================== */
    public static boolean isStrongPassword(String password) {
        if (isEmpty(password)) return false;
        return password.matches(
            "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$"
        );
    }

    /* =====================
       EMAIL
       ===================== */
    public static boolean isValidEmail(String email) {
        if (isEmpty(email)) return false;
        return email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
    }

    /* =====================
       PHONE (VN)
       0xxxxxxxxx (10 số)
       ===================== */
    public static boolean isValidPhone(String phone) {
        if (isEmpty(phone)) return false;
        return phone.matches("^0\\d{9}$");
    }

    /* =====================
       FULL NAME
       Chỉ chữ và khoảng trắng
       ===================== */
    public static boolean isValidFullName(String name) {
        if (isEmpty(name)) return false;
        return name.matches("^[a-zA-ZÀ-ỹ\\s]{2,50}$");
    }

    /* =====================
       ADDRESS
       ===================== */
    public static boolean isValidAddress(String address) {
        if (isEmpty(address)) return false;
        return address.length() >= 5;
    }

    /* =====================
       PRICE
       > 0
       ===================== */
    public static boolean isValidPrice(double price) {
        return price > 0;
    }

    /* =====================
       QUANTITY
       >= 1
       ===================== */
    public static boolean isValidQuantity(int quantity) {
        return quantity > 0;
    }

    /* =====================
       ROLE
       ===================== */
    public static boolean isValidRole(String role) {
        if (isEmpty(role)) return false;
        return role.equals("ADMIN") || role.equals("CUSTOMER");
    }

    /* =====================
       CONFIRM PASSWORD
       ===================== */
    public static boolean isConfirmPassword(String pass, String confirm) {
        if (isEmpty(pass) || isEmpty(confirm)) return false;
        return pass.equals(confirm);
    }
}
