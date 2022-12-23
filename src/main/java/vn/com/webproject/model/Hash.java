package vn.com.webproject.model;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Hash {
    MessageDigest messageDigest;

    public String hashText(String data) {
        try {
            this.messageDigest = MessageDigest.getInstance("SHA-1");
        } catch (Exception e) {

        }
        byte[] bytes = this.messageDigest.digest(data.getBytes());
        BigInteger bigInteger = new BigInteger(1, bytes);
        return bigInteger.toString(16);
    }
}
