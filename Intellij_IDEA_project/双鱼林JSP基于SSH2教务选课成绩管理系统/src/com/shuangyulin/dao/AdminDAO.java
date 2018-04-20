package com.shuangyulin.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shuangyulin.domain.Admin;
import com.shuangyulin.utils.HibernateUtil;

public class AdminDAO {
	/*保存业务逻辑错误信息字段*/
	private String errMessage;
	public String getErrMessage() { return this.errMessage; }
	
	/*验证用户登录*/
	public boolean CheckLogin(Admin admin) { 
		Session s = null;
		try {
			s = HibernateUtil.getSession();
			Admin db_admin = (Admin)s.get(Admin.class, admin.getUsername());
			if(db_admin == null) { 
				this.errMessage = " 账号不存在 ";
				System.out.print(this.errMessage);
				return false;
			} else if( !db_admin.getPassword().equals(admin.getPassword())) {
				this.errMessage = " 密码不正确! ";
				System.out.print(this.errMessage);
				return false;
			}
		} finally {
			HibernateUtil.closeSession();
		} 
		return true;
	}
	

	/*修改用户登录密码*/
	public static void ChangePassword(String username, String newPassword) {
		Session s = null;
		Transaction tx = null;
		try {
			s = HibernateUtil.getSession();
			tx = s.beginTransaction();
			Admin db_admin = (Admin)s.get(Admin.class, username);
			db_admin.setPassword(newPassword);
			s.save(db_admin);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}  finally {
			HibernateUtil.closeSession();
		}  
	}
	
	/*根据用户名获取管理员对象*/
	public static Admin GetAdmin(String username) {
		Session s = null;
		Admin db_admin = null;
		try {
			s = HibernateUtil.getSession();
			db_admin = (Admin)s.get(Admin.class, username); 
		} finally {
			HibernateUtil.closeSession();
		} 
		return db_admin;
	}
}
