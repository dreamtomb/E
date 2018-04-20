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
import com.shuangyulin.dao.CollegeInfoDAO;
import com.shuangyulin.domain.CollegeInfo;
import com.shuangyulin.test.TestUtil;

public class CollegeInfoAction extends ActionSupport {

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

    private String collegeNumber;
    public void setCollegeNumber(String collegeNumber) {
        this.collegeNumber = collegeNumber;
    }
    public String getCollegeNumber() {
        return collegeNumber;
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
    CollegeInfoDAO collegeInfoDAO = new CollegeInfoDAO();

    /*待操作的CollegeInfo对象*/
    private CollegeInfo collegeInfo;
    public void setCollegeInfo(CollegeInfo collegeInfo) {
        this.collegeInfo = collegeInfo;
    }
    public CollegeInfo getCollegeInfo() {
        return this.collegeInfo;
    }

    /*跳转到添加CollegeInfo视图*/
    public String AddView() {
        ActionContext ctx = ActionContext.getContext();
        return "add_view";
    }

    /*添加CollegeInfo信息*/
    @SuppressWarnings("deprecation")
    public String AddCollegeInfo() {
        ActionContext ctx = ActionContext.getContext();
        /*验证学院编号是否已经存在*/
        String collegeNumber = collegeInfo.getCollegeNumber();
        CollegeInfo db_collegeInfo = collegeInfoDAO.GetCollegeInfoByCollegeNumber(collegeNumber);
        if(null != db_collegeInfo) {
            ctx.put("error",  java.net.URLEncoder.encode("该学院编号已经存在!"));
            return "error";
        }
        try {
            collegeInfoDAO.AddCollegeInfo(collegeInfo);
            ctx.put("message",  java.net.URLEncoder.encode("CollegeInfo添加成功!"));
            return "add_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("CollegeInfo添加失败!"));
            return "error";
        }
    }

    /*查询CollegeInfo信息*/
    public String QueryCollegeInfo() {
        if(currentPage == 0) currentPage = 1;
        List<CollegeInfo> collegeInfoList = collegeInfoDAO.QueryCollegeInfoInfo(currentPage);
        /*计算总的页数和总的记录数*/
        collegeInfoDAO.CalculateTotalPageAndRecordNumber();
        /*获取到总的页码数目*/
        totalPage = collegeInfoDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = collegeInfoDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("collegeInfoList",  collegeInfoList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        return "query_view";
    }

    /*前台查询CollegeInfo信息*/
    public String FrontQueryCollegeInfo() {
        if(currentPage == 0) currentPage = 1;
        List<CollegeInfo> collegeInfoList = collegeInfoDAO.QueryCollegeInfoInfo(currentPage);
        /*计算总的页数和总的记录数*/
        collegeInfoDAO.CalculateTotalPageAndRecordNumber();
        /*获取到总的页码数目*/
        totalPage = collegeInfoDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = collegeInfoDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("collegeInfoList",  collegeInfoList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        return "front_query_view";
    }

    /*查询要修改的CollegeInfo信息*/
    public String ModifyCollegeInfoQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键collegeNumber获取CollegeInfo对象*/
        CollegeInfo collegeInfo = collegeInfoDAO.GetCollegeInfoByCollegeNumber(collegeNumber);

        ctx.put("collegeInfo",  collegeInfo);
        return "modify_view";
    }

    /*查询要修改的CollegeInfo信息*/
    public String FrontShowCollegeInfoQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键collegeNumber获取CollegeInfo对象*/
        CollegeInfo collegeInfo = collegeInfoDAO.GetCollegeInfoByCollegeNumber(collegeNumber);

        ctx.put("collegeInfo",  collegeInfo);
        return "front_show_view";
    }

    /*更新修改CollegeInfo信息*/
    public String ModifyCollegeInfo() {
        ActionContext ctx = ActionContext.getContext();
        try {
            collegeInfoDAO.UpdateCollegeInfo(collegeInfo);
            ctx.put("message",  java.net.URLEncoder.encode("CollegeInfo信息更新成功!"));
            return "modify_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("CollegeInfo信息更新失败!"));
            return "error";
       }
   }

    /*删除CollegeInfo信息*/
    public String DeleteCollegeInfo() {
        ActionContext ctx = ActionContext.getContext();
        try { 
            collegeInfoDAO.DeleteCollegeInfo(collegeNumber);
            ctx.put("message",  java.net.URLEncoder.encode("CollegeInfo删除成功!"));
            return "delete_success";
        } catch (Exception e) { 
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("CollegeInfo删除失败!"));
            return "error";
        }
    }

}
