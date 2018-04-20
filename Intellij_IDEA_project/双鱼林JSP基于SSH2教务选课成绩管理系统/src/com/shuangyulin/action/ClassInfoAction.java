package com.shuangyulin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;
import org.apache.struts2.ServletActionContext;
import java.util.List;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shuangyulin.dao.ClassInfoDAO;
import com.shuangyulin.domain.ClassInfo;
import com.shuangyulin.dao.SpecialFieldInfoDAO;
import com.shuangyulin.domain.SpecialFieldInfo;
import com.shuangyulin.test.TestUtil;

public class ClassInfoAction extends ActionSupport {

    /*界面层需要查询的属性: 班级编号*/
    private String classNumber;
    public void setClassNumber(String classNumber) {
        this.classNumber = classNumber;
    }
    public String getClassNumber() {
        return this.classNumber;
    }

    /*界面层需要查询的属性: 班级名称*/
    private String className;
    public void setClassName(String className) {
        this.className = className;
    }
    public String getClassName() {
        return this.className;
    }

    /*界面层需要查询的属性: 所属专业*/
    private SpecialFieldInfo classSpecialFieldNumber;
    public void setClassSpecialFieldNumber(SpecialFieldInfo classSpecialFieldNumber) {
        this.classSpecialFieldNumber = classSpecialFieldNumber;
    }
    public SpecialFieldInfo getClassSpecialFieldNumber() {
        return this.classSpecialFieldNumber;
    }

    /*界面层需要查询的属性: 成立日期*/
    private String classBirthDate;
    public void setClassBirthDate(String classBirthDate) {
        this.classBirthDate = classBirthDate;
    }
    public String getClassBirthDate() {
        return this.classBirthDate;
    }

    /*当前第几页*/
    private int currentPage;
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getCurrentPage() {
        return currentPage;
    }

    /*一共多少页*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*当前查询的总记录数目*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }

    /*业务层对象*/
    ClassInfoDAO classInfoDAO = new ClassInfoDAO();

    /*待操作的ClassInfo对象*/
    private ClassInfo classInfo;
    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }
    public ClassInfo getClassInfo() {
        return this.classInfo;
    }

    /*跳转到添加ClassInfo视图*/
    public String AddView() {
        ActionContext ctx = ActionContext.getContext();
        /*查询所有的SpecialFieldInfo信息*/
        SpecialFieldInfoDAO specialFieldInfoDAO = new SpecialFieldInfoDAO();
        List<SpecialFieldInfo> specialFieldInfoList = specialFieldInfoDAO.QueryAllSpecialFieldInfoInfo();
        ctx.put("specialFieldInfoList", specialFieldInfoList);
        return "add_view";
    }

    /*添加ClassInfo信息*/
    @SuppressWarnings("deprecation")
    public String AddClassInfo() {
        ActionContext ctx = ActionContext.getContext();
        /*验证班级编号是否已经存在*/
        String classNumber = classInfo.getClassNumber();
        ClassInfo db_classInfo = classInfoDAO.GetClassInfoByClassNumber(classNumber);
        if(null != db_classInfo) {
            ctx.put("error",  java.net.URLEncoder.encode("该班级编号已经存在!"));
            return "error";
        }
        try {
            if(true) {
            SpecialFieldInfoDAO specialFieldInfoDAO = new SpecialFieldInfoDAO();
            SpecialFieldInfo classSpecialFieldNumber = specialFieldInfoDAO.GetSpecialFieldInfoBySpecialFieldNumber(classInfo.getClassSpecialFieldNumber().getSpecialFieldNumber());
            classInfo.setClassSpecialFieldNumber(classSpecialFieldNumber);
            }
            classInfoDAO.AddClassInfo(classInfo);
            ctx.put("message",  java.net.URLEncoder.encode("ClassInfo添加成功!"));
            return "add_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("ClassInfo添加失败!"));
            return "error";
        }
    }

    /*查询ClassInfo信息*/
    public String QueryClassInfo() {
        if(currentPage == 0) currentPage = 1;
        if(classNumber == null) classNumber = "";
        if(className == null) className = "";
        if(classBirthDate == null) classBirthDate = "";
        List<ClassInfo> classInfoList = classInfoDAO.QueryClassInfoInfo(classNumber, className, classSpecialFieldNumber, classBirthDate, currentPage);
        /*计算总的页数和总的记录数*/
        classInfoDAO.CalculateTotalPageAndRecordNumber(classNumber, className, classSpecialFieldNumber, classBirthDate);
        /*获取到总的页码数目*/
        totalPage = classInfoDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = classInfoDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("classInfoList",  classInfoList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("classNumber", classNumber);
        ctx.put("className", className);
        ctx.put("classSpecialFieldNumber", classSpecialFieldNumber);
        SpecialFieldInfoDAO specialFieldInfoDAO = new SpecialFieldInfoDAO();
        List<SpecialFieldInfo> specialFieldInfoList = specialFieldInfoDAO.QueryAllSpecialFieldInfoInfo();
        ctx.put("specialFieldInfoList", specialFieldInfoList);
        ctx.put("classBirthDate", classBirthDate);
        return "query_view";
    }

    /*前台查询ClassInfo信息*/
    public String FrontQueryClassInfo() {
        if(currentPage == 0) currentPage = 1;
        if(classNumber == null) classNumber = "";
        if(className == null) className = "";
        if(classBirthDate == null) classBirthDate = "";
        List<ClassInfo> classInfoList = classInfoDAO.QueryClassInfoInfo(classNumber, className, classSpecialFieldNumber, classBirthDate, currentPage);
        /*计算总的页数和总的记录数*/
        classInfoDAO.CalculateTotalPageAndRecordNumber(classNumber, className, classSpecialFieldNumber, classBirthDate);
        /*获取到总的页码数目*/
        totalPage = classInfoDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = classInfoDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("classInfoList",  classInfoList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("classNumber", classNumber);
        ctx.put("className", className);
        ctx.put("classSpecialFieldNumber", classSpecialFieldNumber);
        SpecialFieldInfoDAO specialFieldInfoDAO = new SpecialFieldInfoDAO();
        List<SpecialFieldInfo> specialFieldInfoList = specialFieldInfoDAO.QueryAllSpecialFieldInfoInfo();
        ctx.put("specialFieldInfoList", specialFieldInfoList);
        ctx.put("classBirthDate", classBirthDate);
        return "front_query_view";
    }

    /*查询要修改的ClassInfo信息*/
    public String ModifyClassInfoQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键classNumber获取ClassInfo对象*/
        ClassInfo classInfo = classInfoDAO.GetClassInfoByClassNumber(classNumber);

        SpecialFieldInfoDAO specialFieldInfoDAO = new SpecialFieldInfoDAO();
        List<SpecialFieldInfo> specialFieldInfoList = specialFieldInfoDAO.QueryAllSpecialFieldInfoInfo();
        ctx.put("specialFieldInfoList", specialFieldInfoList);
        ctx.put("classInfo",  classInfo);
        return "modify_view";
    }

    /*查询要修改的ClassInfo信息*/
    public String FrontShowClassInfoQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键classNumber获取ClassInfo对象*/
        ClassInfo classInfo = classInfoDAO.GetClassInfoByClassNumber(classNumber);

        SpecialFieldInfoDAO specialFieldInfoDAO = new SpecialFieldInfoDAO();
        List<SpecialFieldInfo> specialFieldInfoList = specialFieldInfoDAO.QueryAllSpecialFieldInfoInfo();
        ctx.put("specialFieldInfoList", specialFieldInfoList);
        ctx.put("classInfo",  classInfo);
        return "front_show_view";
    }

    /*更新修改ClassInfo信息*/
    public String ModifyClassInfo() {
        ActionContext ctx = ActionContext.getContext();
        try {
            if(true) {
            SpecialFieldInfoDAO specialFieldInfoDAO = new SpecialFieldInfoDAO();
            SpecialFieldInfo classSpecialFieldNumber = specialFieldInfoDAO.GetSpecialFieldInfoBySpecialFieldNumber(classInfo.getClassSpecialFieldNumber().getSpecialFieldNumber());
            classInfo.setClassSpecialFieldNumber(classSpecialFieldNumber);
            }
            classInfoDAO.UpdateClassInfo(classInfo);
            ctx.put("message",  java.net.URLEncoder.encode("ClassInfo信息更新成功!"));
            return "modify_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("ClassInfo信息更新失败!"));
            return "error";
       }
   }

    /*删除ClassInfo信息*/
    public String DeleteClassInfo() {
        ActionContext ctx = ActionContext.getContext();
        try { 
            classInfoDAO.DeleteClassInfo(classNumber);
            ctx.put("message",  java.net.URLEncoder.encode("ClassInfo删除成功!"));
            return "delete_success";
        } catch (Exception e) { 
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("ClassInfo删除失败!"));
            return "error";
        }
    }

}
