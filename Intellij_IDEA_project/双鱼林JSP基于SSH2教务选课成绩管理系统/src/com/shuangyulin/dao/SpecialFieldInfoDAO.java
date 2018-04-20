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

import com.shuangyulin.domain.CollegeInfo;
import com.shuangyulin.domain.SpecialFieldInfo;

public class SpecialFieldInfoDAO {

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
    public void AddSpecialFieldInfo(SpecialFieldInfo specialFieldInfo) throws Exception {
        Session s = null;
        Transaction tx = null;
        try { 
            s = HibernateUtil.getSession();
            tx = s.beginTransaction(); 
            s.save(specialFieldInfo);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*查询SpecialFieldInfo信息*/
    public ArrayList<SpecialFieldInfo> QuerySpecialFieldInfoInfo(String specialFieldNumber,String specialFieldName,CollegeInfo specialCollegeNumber,String specialBirthDate,int currentPage) { 
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From SpecialFieldInfo specialFieldInfo where 1=1";
            if(!specialFieldNumber.equals("")) hql = hql + " and specialFieldInfo.specialFieldNumber like '%" + specialFieldNumber + "%'";
            if(!specialFieldName.equals("")) hql = hql + " and specialFieldInfo.specialFieldName like '%" + specialFieldName + "%'";
            if(null != specialCollegeNumber && !specialCollegeNumber.getCollegeNumber().equals("")) hql += " and specialFieldInfo.specialCollegeNumber.collegeNumber='" + specialCollegeNumber.getCollegeNumber() + "'";
            if(!specialBirthDate.equals("")) hql = hql + " and specialFieldInfo.specialBirthDate like '%" + specialBirthDate + "%'";
            Query q = s.createQuery(hql);
            /*计算当前显示页码的开始记录*/
            int startIndex = (currentPage-1) * this.PAGE_SIZE;
            q.setFirstResult(startIndex);
            q.setMaxResults(this.PAGE_SIZE);
            List specialFieldInfoList = q.list();
            return (ArrayList<SpecialFieldInfo>) specialFieldInfoList;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*函数功能：查询所有的SpecialFieldInfo记录*/
    public ArrayList<SpecialFieldInfo> QueryAllSpecialFieldInfoInfo() {
        Session s = null; 
        try {
            s = HibernateUtil.getSession();
            String hql = "From SpecialFieldInfo";
            Query q = s.createQuery(hql);
            List specialFieldInfoList = q.list();
            return (ArrayList<SpecialFieldInfo>) specialFieldInfoList;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*计算总的页数和记录数*/
    public void CalculateTotalPageAndRecordNumber(String specialFieldNumber,String specialFieldName,CollegeInfo specialCollegeNumber,String specialBirthDate) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            String hql = "From SpecialFieldInfo specialFieldInfo where 1=1";
            if(!specialFieldNumber.equals("")) hql = hql + " and specialFieldInfo.specialFieldNumber like '%" + specialFieldNumber + "%'";
            if(!specialFieldName.equals("")) hql = hql + " and specialFieldInfo.specialFieldName like '%" + specialFieldName + "%'";
            if(null != specialCollegeNumber && !specialCollegeNumber.getCollegeNumber().equals("")) hql += " and specialFieldInfo.specialCollegeNumber.collegeNumber='" + specialCollegeNumber.getCollegeNumber() + "'";
            if(!specialBirthDate.equals("")) hql = hql + " and specialFieldInfo.specialBirthDate like '%" + specialBirthDate + "%'";
            Query q = s.createQuery(hql);
            List specialFieldInfoList = q.list();
            recordNumber = specialFieldInfoList.size();
            int mod = recordNumber % this.PAGE_SIZE;
            totalPage = recordNumber / this.PAGE_SIZE;
            if(mod != 0) totalPage++;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*根据主键获取对象*/
    public SpecialFieldInfo GetSpecialFieldInfoBySpecialFieldNumber(String specialFieldNumber) {
        Session s = null;
        try {
            s = HibernateUtil.getSession();
            SpecialFieldInfo specialFieldInfo = (SpecialFieldInfo)s.get(SpecialFieldInfo.class, specialFieldNumber);
            return specialFieldInfo;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*更新SpecialFieldInfo信息*/
    public void UpdateSpecialFieldInfo(SpecialFieldInfo specialFieldInfo) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            s.update(specialFieldInfo);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
            	  tx.rollback();
            throw e;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    /*删除SpecialFieldInfo信息*/
    public void DeleteSpecialFieldInfo (String specialFieldNumber) throws Exception {
        Session s = null;
        Transaction tx = null;
        try {
            s = HibernateUtil.getSession();
            tx = s.beginTransaction();
            Object specialFieldInfo = s.get(SpecialFieldInfo.class, specialFieldNumber);
            s.delete(specialFieldInfo);
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
