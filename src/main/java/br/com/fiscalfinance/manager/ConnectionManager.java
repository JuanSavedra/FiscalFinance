package br.com.fiscalfinance.manager;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {
    private static ConnectionManager connectionManager;

    public ConnectionManager() {

    }

    public static ConnectionManager getConnectionManager() {
        if (connectionManager == null) {
            connectionManager = new ConnectionManager();
        }

        return connectionManager;
    }

    public Connection getConnection() {
        Connection connection = null;

        String URL = "[url da oracle]";
        String USER = "[usuario]";
        String PASSWORD = "[senha]";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}
