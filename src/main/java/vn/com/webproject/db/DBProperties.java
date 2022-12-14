package vn.com.webproject.db;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static Properties properties = new Properties();

    static {
        try {
            properties.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getDbHost() {
        return properties.get("db.host").toString();
    }

    public static String getDbPort() {
        return properties.get("db.port").toString();
    }

    public static String getUsername() {
        return properties.get("db.username").toString();
    }

    public static String getPassword() {
        return properties.get("db.password").toString();
    }

    public static String getDbOption() {
        return properties.get("db.options").toString();
    }

    public static String getDbName() {
        return properties.get("db.databaseName").toString();
    }
}
