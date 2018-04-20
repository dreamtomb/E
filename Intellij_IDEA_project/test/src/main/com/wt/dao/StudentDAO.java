package wt.dao;

import java.sql.*;
import java.util.Vector;

import wt.entity.*;
import wt.database.DataBaseConnection;

public class StudentDAO {
    //根据学号，姓名，专业，班级，密码添加学生
    public void InsertStudent(String sid, String sname, String smajor, String sclass, String scode) throws Exception {
        String sql = "INSERT INTO student(sid,sname,smajor,sclass,scode) VALUES('" + sid + "','" + sname + "','" + smajor + "','" + sclass + "','" + scode + "');";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或添加失败");
        } finally {
            dbc.close();
        }
    }

    //根据学号删除学生
    public void DeletebyID(String sid) throws Exception {
        String sql = "DELETE FROM student WHERE sid='" + sid + "';";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或删除学生失败");
        } finally {
            dbc.close();
        }
    }

    //根据学号，班级，专业查询学生
    public Vector Select(String sid, String sclass, String smajor) throws Exception {
        Vector all = new Vector();
        String sql1 = "SELECT * FROM student WHERE";
        String sql = null;
        if (sid != "") {
            sql = sql1 + " sid LIKE '%" + sid + "%'";
            if (sclass != "") {
                sql = sql + " and sclass LIKE '%" + sclass + "%'";
            }
            if (smajor != "") {
                sql = sql + " and smajor LIKE '%" + smajor + "%'";
            }
        } else {
            if (sclass != "") {
                sql = sql1 + " sclass LIKE '%" + sclass + "%'";
                if (smajor != "") {
                    sql = sql + " and smajor LIKE '%" + smajor + "%'";
                }
            } else {
                if (smajor != "") {
                    sql = sql1 + " smajor LIKE '%" + smajor + "%'";
                } else {
                    sql = "SELECT * FROM student";
                }
            }
        }
        sql = sql + " ORDER BY egrade DESC;";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Student stu = new Student();
                stu.setSid(rs.getString("sid"));
                stu.setSname(rs.getString("sname"));
                stu.setSmajor(rs.getString("smajor"));
                stu.setSclass(rs.getString("sclass"));
                stu.setTcredit(rs.getDouble("tcredit"));
                stu.setAcredit(rs.getDouble("acredit"));
                stu.setEgrade(rs.getDouble("egrade"));
                stu.setMajorpm(rs.getInt("majorpm"));
                stu.setClasspm(rs.getInt("classpm"));
                stu.setScode(rs.getString("scode"));
                all.addElement(stu);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或查询失败");
        } finally {
            dbc.close();
        }
        return all;
    }

    //根据学号查询学生
    public String SelectBySid(String sid) throws Exception {
        String sname = null;
        String sql = "select sname from student where sid='" + sid + "';";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                sname = rs.getString("sname");
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            // TODO: handle exception
            throw new Exception("数据库链接失败或查询失败");
        } finally {
            dbc.close();
        }
        return sname;
    }

    //根据学号，姓名，专业，班级，密码修改学生信息
    public void UpdatebyID(String sid, String sname, String smajor, String sclass, String scode) throws Exception {
        String sql = "UPDATE student set sname='" + sname + "',smajor='" + smajor + "',sclass='" + sclass + "',scode='" + scode + "'  WHERE sid='" + sid + "';";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或修改失败");
        } finally {
            dbc.close();
        }
    }

    //根据学号和密码，来修改密码
    public void Changecode(String sid, String scode) throws Exception {
        String sql = "UPDATE student set scode='" + scode + "'  WHERE sid='" + sid + "';";
        Statement stmt = null;
        DataBaseConnection dbc = null;
        dbc = new DataBaseConnection();
        try {
            stmt = dbc.getConnection().createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("数据库链接失败或修改密码失败");
        } finally {
            dbc.close();
        }
    }

}
