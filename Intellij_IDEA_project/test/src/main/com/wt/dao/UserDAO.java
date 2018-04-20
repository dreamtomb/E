package wt.dao;

import java.sql.*;

import wt.entity.*;
import wt.database.DataBaseConnection;

public class UserDAO {
    //验证身份
    public User check(String id, String kind) throws Exception {
        User user = new User();
        String sql = "SELECT * FROM user WHERE id='" + id + "'and kind='" + kind + "';";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                user.setId(rs.getString(1));
                user.setName(rs.getString(2));
                user.setCode(rs.getString(3));
                user.setKind(rs.getString(4));
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或查无此人.");
        } finally {
            dbc.close();
        }
        return user;
    }

    public void InsertUser(String id, String name, String code, String kind) throws Exception {
        String sql = "INSERT INTO user(id,name,code,kind) VALUES('" + id + "','" + name + "','" + code + "','" + kind + "');";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或查无此人.");
        } finally {
            dbc.close();
        }
    }

    public void DeletebyID(String id) throws Exception {
        String sql = "DELETE FROM user WHERE id='" + id + "';";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或查无此人.");
        } finally {
            dbc.close();
        }
    }

    public void UpdatebyID(String id, String name, String kind, String code) throws Exception {
        String sql = "UPDATE user set name='" + name + "',kind='" + kind + "',code='" + code + "' WHERE id='" + id + "';";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或查无此人.");
        } finally {
            dbc.close();
        }
    }

    public void Changecode(String id, String code) throws Exception {
        String sql = "UPDATE user set code='" + code + "' WHERE id='" + id + "';";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或查无此人.");
        } finally {
            dbc.close();
        }
    }
}
