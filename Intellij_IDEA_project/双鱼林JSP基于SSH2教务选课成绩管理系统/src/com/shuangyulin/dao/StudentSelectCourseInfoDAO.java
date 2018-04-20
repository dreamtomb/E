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

import com.shuangyulin.domain.Student_QQ287307421;
import com.shuangyulin.domain.CourseInfo_QQ254540457;
import com.shuangyulin.domain.StudentSelectCourseInfo;

public class StudentSelectCourseInfoDAO {

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
    public void AddStudentSelectCourseInfo(StudentSelectCourseInfo studentSelectCourseInfo) throws Exception {
        Session s = null;
        Transaction tx = null;
        try { 
            s = HibernateUtil.getSession();
            tx = s.beginTransaction(); 
            s.save(studentSelectCourseInfo);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*查询StudentSelectCourseInfo信息*/
    public ArrayList<StudentSelectCourseInfo> QueryStudentSelectCourseInfoInfo(Student_QQ287307421 studentNumber,CourseInfo_QQ254540457 courseNumber,int currentPage) { 
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From StudentSelectCourseInfo studentSelectCourseInfo where 1=1";
            if(null != studentNumber && !studentNumber.getStudentNumber().equals("")) hql += " and studentSelectCourseInfo.studentNumber.studentNumber='" + studentNumber.getStudentNumber() + "'";
            if(null != courseNumber && !courseNumber.getCourseNumber().equals("")) hql += " and studentSelectCourseInfo.courseNumber.courseNumber='" + courseNumber.getCourseNumber() + "'";
            Query q = s.createQuery(hql);
            /*计算当前显示页码的开始记录*/
            int startIndex = (currentPage-1) * this.PAGE_SIZE;
            q.setFirstResult(startIndex);
            q.setMaxResults(this.PAGE_SIZE);
            List studentSelectCourseInfoList = q.list();
            return (ArrayList<StudentSelectCourseInfo>) studentSelectCourseInfoList;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*函数功能：查询所有的StudentSelectCourseInfo记录*/
    public ArrayList<StudentSelectCourseInfo> QueryAllStudentSelectCourseInfoInfo() {
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From StudentSelectCourseInfo";
            Query q = s.createQuery(hql);
            List studentSelectCourseInfoList = q.list();
            return (ArrayList<StudentSelectCourseInfo>) studentSelectCourseInfoList;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*计算总的页数和记录数*/
    public void CalculateTotalPageAndRecordNumber(Student_QQ287307421 studentNumber,CourseInfo_QQ254540457 courseNumber) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            String hql = "From StudentSelectCourseInfo studentSelectCourseInfo where 1=1";
            if(null != studentNumber && !studentNumber.getStudentNumber().equals("")) hql += " and studentSelectCourseInfo.studentNumber.studentNumber='" + studentNumber.getStudentNumber() + "'";
            if(null != courseNumber && !courseNumber.getCourseNumber().equals("")) hql += " and studentSelectCourseInfo.courseNumber.courseNumber='" + courseNumber.getCourseNumber() + "'";
            Query q = s.createQuery(hql);
            List studentSelectCourseInfoList = q.list();
            recordNumber = studentSelectCourseInfoList.size();
            int mod = recordNumber % this.PAGE_SIZE;
            totalPage = recordNumber / this.PAGE_SIZE;
            if(mod != 0) totalPage++;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*根据主键获取对象*/
    public StudentSelectCourseInfo GetStudentSelectCourseInfoBySelectId(int selectId) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            StudentSelectCourseInfo studentSelectCourseInfo = (StudentSelectCourseInfo)s.get(StudentSelectCourseInfo.class, selectId);
            return studentSelectCourseInfo;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*更新StudentSelectCourseInfo信息*/
    public void UpdateStudentSelectCourseInfo(StudentSelectCourseInfo studentSelectCourseInfo) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            s.update(studentSelectCourseInfo);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
            	  tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*删除StudentSelectCourseInfo信息*/
    public void DeleteStudentSelectCourseInfo (int selectId) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            Object studentSelectCourseInfo = s.get(StudentSelectCourseInfo.class, selectId);
            s.delete(studentSelectCourseInfo);
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
