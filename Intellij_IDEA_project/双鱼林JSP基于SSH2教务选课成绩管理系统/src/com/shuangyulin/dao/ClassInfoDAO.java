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

import com.shuangyulin.domain.SpecialFieldInfo;
import com.shuangyulin.domain.ClassInfo;

public class ClassInfoDAO {

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
    public void AddClassInfo(ClassInfo classInfo) throws Exception {
        Session s = null;
        Transaction tx = null;
        try { 
            s = HibernateUtil.getSession();
            tx = s.beginTransaction(); 
            s.save(classInfo);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*查询ClassInfo信息*/
    public ArrayList<ClassInfo> QueryClassInfoInfo(String classNumber,String className,SpecialFieldInfo classSpecialFieldNumber,String classBirthDate,int currentPage) { 
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From ClassInfo classInfo where 1=1";
            if(!classNumber.equals("")) hql = hql + " and classInfo.classNumber like '%" + classNumber + "%'";
            if(!className.equals("")) hql = hql + " and classInfo.className like '%" + className + "%'";
            if(null != classSpecialFieldNumber && !classSpecialFieldNumber.getSpecialFieldNumber().equals("")) hql += " and classInfo.classSpecialFieldNumber.specialFieldNumber='" + classSpecialFieldNumber.getSpecialFieldNumber() + "'";
            if(!classBirthDate.equals("")) hql = hql + " and classInfo.classBirthDate like '%" + classBirthDate + "%'";
            Query q = s.createQuery(hql);
            /*计算当前显示页码的开始记录*/
            int startIndex = (currentPage-1) * this.PAGE_SIZE;
            q.setFirstResult(startIndex);
            q.setMaxResults(this.PAGE_SIZE);
            List classInfoList = q.list();
            return (ArrayList<ClassInfo>) classInfoList;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*函数功能：查询所有的ClassInfo记录*/
    public ArrayList<ClassInfo> QueryAllClassInfoInfo() {
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From ClassInfo";
            Query q = s.createQuery(hql);
            List classInfoList = q.list();
            return (ArrayList<ClassInfo>) classInfoList;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*计算总的页数和记录数*/
    public void CalculateTotalPageAndRecordNumber(String classNumber,String className,SpecialFieldInfo classSpecialFieldNumber,String classBirthDate) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            String hql = "From ClassInfo classInfo where 1=1";
            if(!classNumber.equals("")) hql = hql + " and classInfo.classNumber like '%" + classNumber + "%'";
            if(!className.equals("")) hql = hql + " and classInfo.className like '%" + className + "%'";
            if(null != classSpecialFieldNumber && !classSpecialFieldNumber.getSpecialFieldNumber().equals("")) hql += " and classInfo.classSpecialFieldNumber.specialFieldNumber='" + classSpecialFieldNumber.getSpecialFieldNumber() + "'";
            if(!classBirthDate.equals("")) hql = hql + " and classInfo.classBirthDate like '%" + classBirthDate + "%'";
            Query q = s.createQuery(hql);
            List classInfoList = q.list();
            recordNumber = classInfoList.size();
            int mod = recordNumber % this.PAGE_SIZE;
            totalPage = recordNumber / this.PAGE_SIZE;
            if(mod != 0) totalPage++;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*根据主键获取对象*/
    public ClassInfo GetClassInfoByClassNumber(String classNumber) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            ClassInfo classInfo = (ClassInfo)s.get(ClassInfo.class, classNumber);
            return classInfo;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*更新ClassInfo信息*/
    public void UpdateClassInfo(ClassInfo classInfo) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            s.update(classInfo);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
            	  tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*删除ClassInfo信息*/
    public void DeleteClassInfo (String classNumber) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            Object classInfo = s.get(ClassInfo.class, classNumber);
            s.delete(classInfo);
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
