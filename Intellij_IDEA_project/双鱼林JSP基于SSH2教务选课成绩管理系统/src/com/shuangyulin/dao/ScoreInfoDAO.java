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
import com.shuangyulin.domain.ScoreInfo;

public class ScoreInfoDAO {

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
    public void AddScoreInfo(ScoreInfo scoreInfo) throws Exception {
        Session s = null;
        Transaction tx = null;
        try { 
            s = HibernateUtil.getSession();
            tx = s.beginTransaction(); 
            s.save(scoreInfo);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*查询ScoreInfo信息*/
    public ArrayList<ScoreInfo> QueryScoreInfoInfo(Student_QQ287307421 studentNumber,CourseInfo_QQ254540457 courseNumber,int currentPage) { 
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From ScoreInfo scoreInfo where 1=1";
            if(null != studentNumber && !studentNumber.getStudentNumber().equals("")) hql += " and scoreInfo.studentNumber.studentNumber='" + studentNumber.getStudentNumber() + "'";
            if(null != courseNumber && !courseNumber.getCourseNumber().equals("")) hql += " and scoreInfo.courseNumber.courseNumber='" + courseNumber.getCourseNumber() + "'";
            Query q = s.createQuery(hql);
            /*计算当前显示页码的开始记录*/
            int startIndex = (currentPage-1) * this.PAGE_SIZE;
            q.setFirstResult(startIndex);
            q.setMaxResults(this.PAGE_SIZE);
            List scoreInfoList = q.list();
            return (ArrayList<ScoreInfo>) scoreInfoList;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*函数功能：查询所有的ScoreInfo记录*/
    public ArrayList<ScoreInfo> QueryAllScoreInfoInfo() {
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From ScoreInfo";
            Query q = s.createQuery(hql);
            List scoreInfoList = q.list();
            return (ArrayList<ScoreInfo>) scoreInfoList;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*计算总的页数和记录数*/
    public void CalculateTotalPageAndRecordNumber(Student_QQ287307421 studentNumber,CourseInfo_QQ254540457 courseNumber) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            String hql = "From ScoreInfo scoreInfo where 1=1";
            if(null != studentNumber && !studentNumber.getStudentNumber().equals("")) hql += " and scoreInfo.studentNumber.studentNumber='" + studentNumber.getStudentNumber() + "'";
            if(null != courseNumber && !courseNumber.getCourseNumber().equals("")) hql += " and scoreInfo.courseNumber.courseNumber='" + courseNumber.getCourseNumber() + "'";
            Query q = s.createQuery(hql);
            List scoreInfoList = q.list();
            recordNumber = scoreInfoList.size();
            int mod = recordNumber % this.PAGE_SIZE;
            totalPage = recordNumber / this.PAGE_SIZE;
            if(mod != 0) totalPage++;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*根据主键获取对象*/
    public ScoreInfo GetScoreInfoByScoreId(int scoreId) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            ScoreInfo scoreInfo = (ScoreInfo)s.get(ScoreInfo.class, scoreId);
            return scoreInfo;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*更新ScoreInfo信息*/
    public void UpdateScoreInfo(ScoreInfo scoreInfo) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            s.update(scoreInfo);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
            	  tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*删除ScoreInfo信息*/
    public void DeleteScoreInfo (int scoreId) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            Object scoreInfo = s.get(ScoreInfo.class, scoreId);
            s.delete(scoreInfo);
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
