package org.moandor.se2;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Application {
    private DatabaseManager mDatabaseManager;

    private Application() {
        try (Reader reader = new InputStreamReader(new FileInputStream(
                System.getenv("PATH_PROPERTIES")))) {
            Properties properties = new Properties();
            properties.load(reader);
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    properties.getProperty("database_url"),
                    properties.getProperty("database_username"),
                    properties.getProperty("database_password"));
            mDatabaseManager = new DatabaseManager(connection);
        } catch (IOException | ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public DatabaseManager getDatabaseManager() {
        return mDatabaseManager;
    }

    private static Application sInstance = new Application();

    public static Application getInstance() {
        return sInstance;
    }
}
