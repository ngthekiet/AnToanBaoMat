package vn.com.webproject.model;

import javax.crypto.Cipher;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;

public class RSA {
    PrivateKey privateKey;
    PublicKey publicKey;
    KeyPair keyPair;

    public RSA() {

    }

    public void createKey() {
        try {
            KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
            generator.initialize(2048);
            keyPair = generator.generateKeyPair();
            publicKey = keyPair.getPublic();
            privateKey = keyPair.getPrivate();
        } catch (Exception e) {
            System.out.println("Không thể tạo key");
        }
    }

    public byte[] encrypt(String text) {
        if (publicKey == null) createKey();
        if (text == null) return null;
        byte[] data = text.getBytes();
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);
            byte[] bytes = cipher.doFinal(data);
            return bytes;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public String decrypt(byte[] data) {
        if (privateKey == null) return null;
        if (data == null) return null;
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.DECRYPT_MODE, privateKey);
            byte[] bytes = cipher.doFinal(data);
            return new String(bytes);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        RSA rsa = new RSA();
        rsa.createKey();
        byte[] en = rsa.encrypt("Đây là con heo mập");
        String de = rsa.decrypt(en);
        System.out.println("En:\n" + en);
        System.out.println("De:\n" + de);
    }
}
