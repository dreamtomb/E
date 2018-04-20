package wt.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConnection {
    private static String DBDRIVER = "com.mysql.jdbc.Driver";
    private static String DBURL = "jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";
    private static String DBUSER = "root";
    private static String DBPASSWORD = "123";
    private static Connection conn = null;

    //	链接数据库
    public Connection getConnection() {
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
        } catch (Exception e) {
            System.out.println("链接数据库失败：" + e.getMessage());
        }
        return conn;
    }

    //断开连接
    public void close() {
        try {
            this.conn.close();
        } catch (Exception e) {
        }
    }
}
