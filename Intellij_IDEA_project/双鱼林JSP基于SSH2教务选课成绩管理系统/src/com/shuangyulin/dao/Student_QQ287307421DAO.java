package com.shuangyulin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.mysql.jdbc.Statement;
import com.shuangyulin.utils.HibernateUtil;

import com.shuangyulin.domain.ClassInfo;
import com.shuangyulin.domain.Student_QQ287307421;

public class Student_QQ287307421DAO {

    /*每页显示记录数目*/
    private final int PAGE_SIZE = 10;

    /*保存查询后总的页数*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }

    /*添加图书信息*/
    public void AddStudent_QQ287307421(Student_QQ287307421 student_QQ287307421) throws Exception {
        Session s = null;
        Transaction tx = null;
        try { 
            s = HibernateUtil.getSession();
            tx = s.beginTransaction(); 
            s.save(student_QQ287307421);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*查询Student_QQ287307421信息*/
    public ArrayList<Student_QQ287307421> QueryStudent_QQ287307421Info(String studentNumber,String studentName,ClassInfo studentClassNumber,String studentBirthday,int currentPage) { 
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From Student_QQ287307421 student_QQ287307421 where 1=1";
            if(!studentNumber.equals("")) hql = hql + " and student_QQ287307421.studentNumber like '%" + studentNumber + "%'";
            if(!studentName.equals("")) hql = hql + " and student_QQ287307421.studentName like '%" + studentName + "%'";
            if(null != studentClassNumber && !studentClassNumber.getClassNumber().equals("")) hql += " and student_QQ287307421.studentClassNumber.classNumber='" + studentClassNumber.getClassNumber() + "'";
            if(!studentBirthday.equals("")) hql = hql + " and student_QQ287307421.studentBirthday like '%" + studentBirthday + "%'";
            Query q = s.createQuery(hql);
            /*计算当前显示页码的开始记录*/
            int startIndex = (currentPage-1) * this.PAGE_SIZE;
            q.setFirstResult(startIndex);
            q.setMaxResults(this.PAGE_SIZE);
            List student_QQ287307421List = q.list();
            return (ArrayList<Student_QQ287307421>) student_QQ287307421List;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*函数功能：查询所有的Student_QQ287307421记录*/
    public ArrayList<Student_QQ287307421> QueryAllStudent_QQ287307421Info() {
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From Student_QQ287307421";
            Query q = s.createQuery(hql);
            List student_QQ287307421List = q.list();
            return (ArrayList<Student_QQ287307421>) student_QQ287307421List;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*计算总的页数和记录数*/
    public void CalculateTotalPageAndRecordNumber(String studentNumber,String studentName,ClassInfo studentClassNumber,String studentBirthday) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            String hql = "From Student_QQ287307421 student_QQ287307421 where 1=1";
            if(!studentNumber.equals("")) hql = hql + " and student_QQ287307421.studentNumber like '%" + studentNumber + "%'";
            if(!studentName.equals("")) hql = hql + " and student_QQ287307421.studentName like '%" + studentName + "%'";
            if(null != studentClassNumber && !studentClassNumber.getClassNumber().equals("")) hql += " and student_QQ287307421.studentClassNumber.classNumber='" + studentClassNumber.getClassNumber() + "'";
            if(!studentBirthday.equals("")) hql = hql + " and student_QQ287307421.studentBirthday like '%" + studentBirthday + "%'";
            Query q = s.createQuery(hql);
            List student_QQ287307421List = q.list();
            recordNumber = student_QQ287307421List.size();
            int mod = recordNumber % this.PAGE_SIZE;
            totalPage = recordNumber / this.PAGE_SIZE;
            if(mod != 0) totalPage++;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*根据主键获取对象*/
    public Student_QQ287307421 GetStudent_QQ287307421ByStudentNumber(String studentNumber) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            Student_QQ287307421 student_QQ287307421 = (Student_QQ287307421)s.get(Student_QQ287307421.class, studentNumber);
            return student_QQ287307421;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*更新Student_QQ287307421信息*/
    public void UpdateStudent_QQ287307421(Student_QQ287307421 student_QQ287307421) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            s.update(student_QQ287307421);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
            	  tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*删除Student_QQ287307421信息*/
    public void DeleteStudent_QQ287307421 (String studentNumber) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            Object student_QQ287307421 = s.get(Student_QQ287307421.class, studentNumber);
            s.delete(student_QQ287307421);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
            	  tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

}
