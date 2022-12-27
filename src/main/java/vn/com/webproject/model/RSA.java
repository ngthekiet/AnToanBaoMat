package vn.com.webproject.model;

import javax.crypto.Cipher;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class RSA {
    private PrivateKey privateKey;
    private PublicKey publicKey;
    private KeyPair keyPair;

    private static RSA instance;

    public RSA() {
        createKey();
    }

    public static RSA getInstance() {
        if (instance == null) {
            instance = new RSA();
        }
        return instance;
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

    public byte[] encrypt(String text, PrivateKey privateKey) {
        if (text == null) return null;
        byte[] data = text.getBytes();
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.ENCRYPT_MODE, privateKey);
            byte[] bytes = cipher.doFinal(data);
            return bytes;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public String decrypt(byte[] data, PublicKey publicKey) {
        if (data == null) return null;
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.DECRYPT_MODE, publicKey);
            byte[] bytes = cipher.doFinal(data);
            return new String(bytes);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public PrivateKey getPrivateKey() {
        return privateKey;
    }

    public PublicKey getPublicKey() {
        return publicKey;
    }

    public KeyPair getKeyPair() {
        return keyPair;
    }

    public PublicKey stringToPublicKey(String data) {
        byte[] arrayData = Base64.getDecoder().decode(data);
        try {
            PublicKey publicKey = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(arrayData));
            return publicKey;
        } catch (Exception e) {
            return null;
        }
    }

    public PrivateKey stringToPrivateKey(String data) {
        byte[] arrayData = Base64.getDecoder().decode(data);
        try {
            PrivateKey privateKey = KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(arrayData));
            return privateKey;
        } catch (Exception e) {
            return null;
        }
    }

}
