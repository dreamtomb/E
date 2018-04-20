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
import com.shuangyulin.dao.SpecialFieldInfoDAO;
import com.shuangyulin.domain.SpecialFieldInfo;
import com.shuangyulin.dao.CollegeInfoDAO;
import com.shuangyulin.domain.CollegeInfo;
import com.shuangyulin.test.TestUtil;

public class SpecialFieldInfoAction extends ActionSupport {

    /*界面层需要查询的属性: 专业编号*/
    private String specialFieldNumber;
    public void setSpecialFieldNumber(String specialFieldNumber) {
        this.specialFieldNumber = specialFieldNumber;
    }
    public String getSpecialFieldNumber() {
        return this.specialFieldNumber;
    }

    /*界面层需要查询的属性: 专业名称*/
    private String specialFieldName;
    public void setSpecialFieldName(String specialFieldName) {
        this.specialFieldName = specialFieldName;
    }
    public String getSpecialFieldName() {
        return this.specialFieldName;
    }

    /*界面层需要查询的属性: 所在学院*/
    private CollegeInfo specialCollegeNumber;
    public void setSpecialCollegeNumber(CollegeInfo specialCollegeNumber) {
        this.specialCollegeNumber = specialCollegeNumber;
    }
    public CollegeInfo getSpecialCollegeNumber() {
        return this.specialCollegeNumber;
    }

    /*界面层需要查询的属性: 成立日期*/
    private String specialBirthDate;
    public void setSpecialBirthDate(String specialBirthDate) {
        this.specialBirthDate = specialBirthDate;
    }
    public String getSpecialBirthDate() {
        return this.specialBirthDate;
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
    SpecialFieldInfoDAO specialFieldInfoDAO = new SpecialFieldInfoDAO();

    /*待操作的SpecialFieldInfo对象*/
    private SpecialFieldInfo specialFieldInfo;
    public void setSpecialFieldInfo(SpecialFieldInfo specialFieldInfo) {
        this.specialFieldInfo = specialFieldInfo;
    }
    public SpecialFieldInfo getSpecialFieldInfo() {
        return this.specialFieldInfo;
    }

    /*跳转到添加SpecialFieldInfo视图*/
    public String AddView() {
        ActionContext ctx = ActionContext.getContext();
        /*查询所有的CollegeInfo信息*/
        CollegeInfoDAO collegeInfoDAO = new CollegeInfoDAO();
        List<CollegeInfo> collegeInfoList = collegeInfoDAO.QueryAllCollegeInfoInfo();
        ctx.put("collegeInfoList", collegeInfoList);
        return "add_view";
    }

    /*添加SpecialFieldInfo信息*/
    @SuppressWarnings("deprecation")
    public String AddSpecialFieldInfo() {
        ActionContext ctx = ActionContext.getContext();
        /*验证专业编号是否已经存在*/
        String specialFieldNumber = specialFieldInfo.getSpecialFieldNumber();
        SpecialFieldInfo db_specialFieldInfo = specialFieldInfoDAO.GetSpecialFieldInfoBySpecialFieldNumber(specialFieldNumber);
        if(null != db_specialFieldInfo) {
            ctx.put("error",  java.net.URLEncoder.encode("该专业编号已经存在!"));
            return "error";
        }
        try {
            if(true) {
            CollegeInfoDAO collegeInfoDAO = new CollegeInfoDAO();
            CollegeInfo specialCollegeNumber = collegeInfoDAO.GetCollegeInfoByCollegeNumber(specialFieldInfo.getSpecialCollegeNumber().getCollegeNumber());
            specialFieldInfo.setSpecialCollegeNumber(specialCollegeNumber);
            }
            specialFieldInfoDAO.AddSpecialFieldInfo(specialFieldInfo);
            ctx.put("message",  java.net.URLEncoder.encode("SpecialFieldInfo添加成功!"));
            return "add_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("SpecialFieldInfo添加失败!"));
            return "error";
        }
    }

    /*查询SpecialFieldInfo信息*/
    public String QuerySpecialFieldInfo() {
        if(currentPage == 0) currentPage = 1;
        if(specialFieldNumber == null) specialFieldNumber = "";
        if(specialFieldName == null) specialFieldName = "";
        if(specialBirthDate == null) specialBirthDate = "";
        List<SpecialFieldInfo> specialFieldInfoList = specialFieldInfoDAO.QuerySpecialFieldInfoInfo(specialFieldNumber, specialFieldName, specialCollegeNumber, specialBirthDate, currentPage);
        /*计算总的页数和总的记录数*/
        specialFieldInfoDAO.CalculateTotalPageAndRecordNumber(specialFieldNumber, specialFieldName, specialCollegeNumber, specialBirthDate);
        /*获取到总的页码数目*/
        totalPage = specialFieldInfoDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = specialFieldInfoDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("specialFieldInfoList",  specialFieldInfoList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("specialFieldNumber", specialFieldNumber);
        ctx.put("specialFieldName", specialFieldName);
        ctx.put("specialCollegeNumber", specialCollegeNumber);
        CollegeInfoDAO collegeInfoDAO = new CollegeInfoDAO();
        List<CollegeInfo> collegeInfoList = collegeInfoDAO.QueryAllCollegeInfoInfo();
        ctx.put("collegeInfoList", collegeInfoList);
        ctx.put("specialBirthDate", specialBirthDate);
        return "query_view";
    }

    /*前台查询SpecialFieldInfo信息*/
    public String FrontQuerySpecialFieldInfo() {
        if(currentPage == 0) currentPage = 1;
        if(specialFieldNumber == null) specialFieldNumber = "";
        if(specialFieldName == null) specialFieldName = "";
        if(specialBirthDate == null) specialBirthDate = "";
        List<SpecialFieldInfo> specialFieldInfoList = specialFieldInfoDAO.QuerySpecialFieldInfoInfo(specialFieldNumber, specialFieldName, specialCollegeNumber, specialBirthDate, currentPage);
        /*计算总的页数和总的记录数*/
        specialFieldInfoDAO.CalculateTotalPageAndRecordNumber(specialFieldNumber, specialFieldName, specialCollegeNumber, specialBirthDate);
        /*获取到总的页码数目*/
        totalPage = specialFieldInfoDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = specialFieldInfoDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("specialFieldInfoList",  specialFieldInfoList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("specialFieldNumber", specialFieldNumber);
        ctx.put("specialFieldName", specialFieldName);
        ctx.put("specialCollegeNumber", specialCollegeNumber);
        CollegeInfoDAO collegeInfoDAO = new CollegeInfoDAO();
        List<CollegeInfo> collegeInfoList = collegeInfoDAO.QueryAllCollegeInfoInfo();
        ctx.put("collegeInfoList", collegeInfoList);
        ctx.put("specialBirthDate", specialBirthDate);
        return "front_query_view";
    }

    /*查询要修改的SpecialFieldInfo信息*/
    public String ModifySpecialFieldInfoQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键specialFieldNumber获取SpecialFieldInfo对象*/
        SpecialFieldInfo specialFieldInfo = specialFieldInfoDAO.GetSpecialFieldInfoBySpecialFieldNumber(specialFieldNumber);

        CollegeInfoDAO collegeInfoDAO = new CollegeInfoDAO();
        List<CollegeInfo> collegeInfoList = collegeInfoDAO.QueryAllCollegeInfoInfo();
        ctx.put("collegeInfoList", collegeInfoList);
        ctx.put("specialFieldInfo",  specialFieldInfo);
        return "modify_view";
    }

    /*查询要修改的SpecialFieldInfo信息*/
    public String FrontShowSpecialFieldInfoQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键specialFieldNumber获取SpecialFieldInfo对象*/
        SpecialFieldInfo specialFieldInfo = specialFieldInfoDAO.GetSpecialFieldInfoBySpecialFieldNumber(specialFieldNumber);

        CollegeInfoDAO collegeInfoDAO = new CollegeInfoDAO();
        List<CollegeInfo> collegeInfoList = collegeInfoDAO.QueryAllCollegeInfoInfo();
        ctx.put("collegeInfoList", collegeInfoList);
        ctx.put("specialFieldInfo",  specialFieldInfo);
        return "front_show_view";
    }

    /*更新修改SpecialFieldInfo信息*/
    public String ModifySpecialFieldInfo() {
        ActionContext ctx = ActionContext.getContext();
        try {
            if(true) {
            CollegeInfoDAO collegeInfoDAO = new CollegeInfoDAO();
            CollegeInfo specialCollegeNumber = collegeInfoDAO.GetCollegeInfoByCollegeNumber(specialFieldInfo.getSpecialCollegeNumber().getCollegeNumber());
            specialFieldInfo.setSpecialCollegeNumber(specialCollegeNumber);
            }
            specialFieldInfoDAO.UpdateSpecialFieldInfo(specialFieldInfo);
            ctx.put("message",  java.net.URLEncoder.encode("SpecialFieldInfo信息更新成功!"));
            return "modify_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("SpecialFieldInfo信息更新失败!"));
            return "error";
       }
   }

    /*删除SpecialFieldInfo信息*/
    public String DeleteSpecialFieldInfo() {
        ActionContext ctx = ActionContext.getContext();
        try { 
            specialFieldInfoDAO.DeleteSpecialFieldInfo(specialFieldNumber);
            ctx.put("message",  java.net.URLEncoder.encode("SpecialFieldInfo删除成功!"));
            return "delete_success";
        } catch (Exception e) { 
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("SpecialFieldInfo删除失败!"));
            return "error";
        }
    }

}
