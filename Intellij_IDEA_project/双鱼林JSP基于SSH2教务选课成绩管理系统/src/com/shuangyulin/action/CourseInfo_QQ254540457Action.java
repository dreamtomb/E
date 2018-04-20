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
import com.shuangyulin.dao.CourseInfo_QQ254540457DAO;
import com.shuangyulin.domain.CourseInfo_QQ254540457;
import com.shuangyulin.dao.Teacher_QQ287307421DAO;
import com.shuangyulin.domain.Teacher_QQ287307421;
import com.shuangyulin.test.TestUtil;

public class CourseInfo_QQ254540457Action extends ActionSupport {

    /*界面层需要查询的属性: 课程编号*/
    private String courseNumber;
    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber;
    }
    public String getCourseNumber() {
        return this.courseNumber;
    }

    /*界面层需要查询的属性: 课程名称*/
    private String courseName;
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    public String getCourseName() {
        return this.courseName;
    }

    /*界面层需要查询的属性: 上课老师*/
    private Teacher_QQ287307421 courseTeacher;
    public void setCourseTeacher(Teacher_QQ287307421 courseTeacher) {
        this.courseTeacher = courseTeacher;
    }
    public Teacher_QQ287307421 getCourseTeacher() {
        return this.courseTeacher;
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
    CourseInfo_QQ254540457DAO courseInfo_QQ254540457DAO = new CourseInfo_QQ254540457DAO();

    /*待操作的CourseInfo_QQ254540457对象*/
    private CourseInfo_QQ254540457 courseInfo_QQ254540457;
    public void setCourseInfo_QQ254540457(CourseInfo_QQ254540457 courseInfo_QQ254540457) {
        this.courseInfo_QQ254540457 = courseInfo_QQ254540457;
    }
    public CourseInfo_QQ254540457 getCourseInfo_QQ254540457() {
        return this.courseInfo_QQ254540457;
    }

    /*跳转到添加CourseInfo_QQ254540457视图*/
    public String AddView() {
        ActionContext ctx = ActionContext.getContext();
        /*查询所有的Teacher_QQ287307421信息*/
        Teacher_QQ287307421DAO teacher_QQ287307421DAO = new Teacher_QQ287307421DAO();
        List<Teacher_QQ287307421> teacher_QQ287307421List = teacher_QQ287307421DAO.QueryAllTeacher_QQ287307421Info();
        ctx.put("teacher_QQ287307421List", teacher_QQ287307421List);
        return "add_view";
    }

    /*添加CourseInfo_QQ254540457信息*/
    @SuppressWarnings("deprecation")
    public String AddCourseInfo_QQ254540457() {
        ActionContext ctx = ActionContext.getContext();
        /*验证课程编号是否已经存在*/
        String courseNumber = courseInfo_QQ254540457.getCourseNumber();
        CourseInfo_QQ254540457 db_courseInfo_QQ254540457 = courseInfo_QQ254540457DAO.GetCourseInfo_QQ254540457ByCourseNumber(courseNumber);
        if(null != db_courseInfo_QQ254540457) {
            ctx.put("error",  java.net.URLEncoder.encode("该课程编号已经存在!"));
            return "error";
        }
        try {
            if(true) {
            Teacher_QQ287307421DAO teacher_QQ287307421DAO = new Teacher_QQ287307421DAO();
            Teacher_QQ287307421 courseTeacher = teacher_QQ287307421DAO.GetTeacher_QQ287307421ByTeacherNumber(courseInfo_QQ254540457.getCourseTeacher().getTeacherNumber());
            courseInfo_QQ254540457.setCourseTeacher(courseTeacher);
            }
            courseInfo_QQ254540457DAO.AddCourseInfo_QQ254540457(courseInfo_QQ254540457);
            ctx.put("message",  java.net.URLEncoder.encode("CourseInfo_QQ254540457添加成功!"));
            return "add_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("CourseInfo_QQ254540457添加失败!"));
            return "error";
        }
    }

    /*查询CourseInfo_QQ254540457信息*/
    public String QueryCourseInfo_QQ254540457() {
        if(currentPage == 0) currentPage = 1;
        if(courseNumber == null) courseNumber = "";
        if(courseName == null) courseName = "";
        List<CourseInfo_QQ254540457> courseInfo_QQ254540457List = courseInfo_QQ254540457DAO.QueryCourseInfo_QQ254540457Info(courseNumber, courseName, courseTeacher, currentPage);
        /*计算总的页数和总的记录数*/
        courseInfo_QQ254540457DAO.CalculateTotalPageAndRecordNumber(courseNumber, courseName, courseTeacher);
        /*获取到总的页码数目*/
        totalPage = courseInfo_QQ254540457DAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = courseInfo_QQ254540457DAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("courseInfo_QQ254540457List",  courseInfo_QQ254540457List);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("courseNumber", courseNumber);
        ctx.put("courseName", courseName);
        ctx.put("courseTeacher", courseTeacher);
        Teacher_QQ287307421DAO teacher_QQ287307421DAO = new Teacher_QQ287307421DAO();
        List<Teacher_QQ287307421> teacher_QQ287307421List = teacher_QQ287307421DAO.QueryAllTeacher_QQ287307421Info();
        ctx.put("teacher_QQ287307421List", teacher_QQ287307421List);
        return "query_view";
    }

    /*前台查询CourseInfo_QQ254540457信息*/
    public String FrontQueryCourseInfo_QQ254540457() {
        if(currentPage == 0) currentPage = 1;
        if(courseNumber == null) courseNumber = "";
        if(courseName == null) courseName = "";
        List<CourseInfo_QQ254540457> courseInfo_QQ254540457List = courseInfo_QQ254540457DAO.QueryCourseInfo_QQ254540457Info(courseNumber, courseName, courseTeacher, currentPage);
        /*计算总的页数和总的记录数*/
        courseInfo_QQ254540457DAO.CalculateTotalPageAndRecordNumber(courseNumber, courseName, courseTeacher);
        /*获取到总的页码数目*/
        totalPage = courseInfo_QQ254540457DAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = courseInfo_QQ254540457DAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("courseInfo_QQ254540457List",  courseInfo_QQ254540457List);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("courseNumber", courseNumber);
        ctx.put("courseName", courseName);
        ctx.put("courseTeacher", courseTeacher);
        Teacher_QQ287307421DAO teacher_QQ287307421DAO = new Teacher_QQ287307421DAO();
        List<Teacher_QQ287307421> teacher_QQ287307421List = teacher_QQ287307421DAO.QueryAllTeacher_QQ287307421Info();
        ctx.put("teacher_QQ287307421List", teacher_QQ287307421List);
        return "front_query_view";
    }

    /*查询要修改的CourseInfo_QQ254540457信息*/
    public String ModifyCourseInfo_QQ254540457Query() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键courseNumber获取CourseInfo_QQ254540457对象*/
        CourseInfo_QQ254540457 courseInfo_QQ254540457 = courseInfo_QQ254540457DAO.GetCourseInfo_QQ254540457ByCourseNumber(courseNumber);

        Teacher_QQ287307421DAO teacher_QQ287307421DAO = new Teacher_QQ287307421DAO();
        List<Teacher_QQ287307421> teacher_QQ287307421List = teacher_QQ287307421DAO.QueryAllTeacher_QQ287307421Info();
        ctx.put("teacher_QQ287307421List", teacher_QQ287307421List);
        ctx.put("courseInfo_QQ254540457",  courseInfo_QQ254540457);
        return "modify_view";
    }

    /*查询要修改的CourseInfo_QQ254540457信息*/
    public String FrontShowCourseInfo_QQ254540457Query() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键courseNumber获取CourseInfo_QQ254540457对象*/
        CourseInfo_QQ254540457 courseInfo_QQ254540457 = courseInfo_QQ254540457DAO.GetCourseInfo_QQ254540457ByCourseNumber(courseNumber);

        Teacher_QQ287307421DAO teacher_QQ287307421DAO = new Teacher_QQ287307421DAO();
        List<Teacher_QQ287307421> teacher_QQ287307421List = teacher_QQ287307421DAO.QueryAllTeacher_QQ287307421Info();
        ctx.put("teacher_QQ287307421List", teacher_QQ287307421List);
        ctx.put("courseInfo_QQ254540457",  courseInfo_QQ254540457);
        return "front_show_view";
    }

    /*更新修改CourseInfo_QQ254540457信息*/
    public String ModifyCourseInfo_QQ254540457() {
        ActionContext ctx = ActionContext.getContext();
        try {
            if(true) {
            Teacher_QQ287307421DAO teacher_QQ287307421DAO = new Teacher_QQ287307421DAO();
            Teacher_QQ287307421 courseTeacher = teacher_QQ287307421DAO.GetTeacher_QQ287307421ByTeacherNumber(courseInfo_QQ254540457.getCourseTeacher().getTeacherNumber());
            courseInfo_QQ254540457.setCourseTeacher(courseTeacher);
            }
            courseInfo_QQ254540457DAO.UpdateCourseInfo_QQ254540457(courseInfo_QQ254540457);
            ctx.put("message",  java.net.URLEncoder.encode("CourseInfo_QQ254540457信息更新成功!"));
            return "modify_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("CourseInfo_QQ254540457信息更新失败!"));
            return "error";
       }
   }

    /*删除CourseInfo_QQ254540457信息*/
    public String DeleteCourseInfo_QQ254540457() {
        ActionContext ctx = ActionContext.getContext();
        try { 
            courseInfo_QQ254540457DAO.DeleteCourseInfo_QQ254540457(courseNumber);
            ctx.put("message",  java.net.URLEncoder.encode("CourseInfo_QQ254540457删除成功!"));
            return "delete_success";
        } catch (Exception e) { 
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("CourseInfo_QQ254540457删除失败!"));
            return "error";
        }
    }

}
