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
import com.shuangyulin.dao.StudentSelectCourseInfoDAO;
import com.shuangyulin.domain.StudentSelectCourseInfo;
import com.shuangyulin.dao.Student_QQ287307421DAO;
import com.shuangyulin.domain.Student_QQ287307421;
import com.shuangyulin.dao.CourseInfo_QQ254540457DAO;
import com.shuangyulin.domain.CourseInfo_QQ254540457;
import com.shuangyulin.test.TestUtil;

public class StudentSelectCourseInfoAction extends ActionSupport {

    /*界面层需要查询的属性: 学生对象*/
    private Student_QQ287307421 studentNumber;
    public void setStudentNumber(Student_QQ287307421 studentNumber) {
        this.studentNumber = studentNumber;
    }
    public Student_QQ287307421 getStudentNumber() {
        return this.studentNumber;
    }

    /*界面层需要查询的属性: 课程对象*/
    private CourseInfo_QQ254540457 courseNumber;
    public void setCourseNumber(CourseInfo_QQ254540457 courseNumber) {
        this.courseNumber = courseNumber;
    }
    public CourseInfo_QQ254540457 getCourseNumber() {
        return this.courseNumber;
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

    private int selectId;
    public void setSelectId(int selectId) {
        this.selectId = selectId;
    }
    public int getSelectId() {
        return selectId;
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
    StudentSelectCourseInfoDAO studentSelectCourseInfoDAO = new StudentSelectCourseInfoDAO();

    /*待操作的StudentSelectCourseInfo对象*/
    private StudentSelectCourseInfo studentSelectCourseInfo;
    public void setStudentSelectCourseInfo(StudentSelectCourseInfo studentSelectCourseInfo) {
        this.studentSelectCourseInfo = studentSelectCourseInfo;
    }
    public StudentSelectCourseInfo getStudentSelectCourseInfo() {
        return this.studentSelectCourseInfo;
    }

    /*跳转到添加StudentSelectCourseInfo视图*/
    public String AddView() {
        ActionContext ctx = ActionContext.getContext();
        /*查询所有的Student_QQ287307421信息*/
        Student_QQ287307421DAO student_QQ287307421DAO = new Student_QQ287307421DAO();
        List<Student_QQ287307421> student_QQ287307421List = student_QQ287307421DAO.QueryAllStudent_QQ287307421Info();
        ctx.put("student_QQ287307421List", student_QQ287307421List);
        /*查询所有的CourseInfo_QQ254540457信息*/
        CourseInfo_QQ254540457DAO courseInfo_QQ254540457DAO = new CourseInfo_QQ254540457DAO();
        List<CourseInfo_QQ254540457> courseInfo_QQ254540457List = courseInfo_QQ254540457DAO.QueryAllCourseInfo_QQ254540457Info();
        ctx.put("courseInfo_QQ254540457List", courseInfo_QQ254540457List);
        return "add_view";
    }

    /*添加StudentSelectCourseInfo信息*/
    @SuppressWarnings("deprecation")
    public String AddStudentSelectCourseInfo() {
        ActionContext ctx = ActionContext.getContext();
        try {
            if(true) {
            Student_QQ287307421DAO student_QQ287307421DAO = new Student_QQ287307421DAO();
            Student_QQ287307421 studentNumber = student_QQ287307421DAO.GetStudent_QQ287307421ByStudentNumber(studentSelectCourseInfo.getStudentNumber().getStudentNumber());
            studentSelectCourseInfo.setStudentNumber(studentNumber);
            }
            if(true) {
            CourseInfo_QQ254540457DAO courseInfo_QQ254540457DAO = new CourseInfo_QQ254540457DAO();
            CourseInfo_QQ254540457 courseNumber = courseInfo_QQ254540457DAO.GetCourseInfo_QQ254540457ByCourseNumber(studentSelectCourseInfo.getCourseNumber().getCourseNumber());
            studentSelectCourseInfo.setCourseNumber(courseNumber);
            }
            studentSelectCourseInfoDAO.AddStudentSelectCourseInfo(studentSelectCourseInfo);
            ctx.put("message",  java.net.URLEncoder.encode("StudentSelectCourseInfo添加成功!"));
            return "add_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("StudentSelectCourseInfo添加失败!"));
            return "error";
        }
    }

    /*查询StudentSelectCourseInfo信息*/
    public String QueryStudentSelectCourseInfo() {
        if(currentPage == 0) currentPage = 1;
        List<StudentSelectCourseInfo> studentSelectCourseInfoList = studentSelectCourseInfoDAO.QueryStudentSelectCourseInfoInfo(studentNumber, courseNumber, currentPage);
        /*计算总的页数和总的记录数*/
        studentSelectCourseInfoDAO.CalculateTotalPageAndRecordNumber(studentNumber, courseNumber);
        /*获取到总的页码数目*/
        totalPage = studentSelectCourseInfoDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = studentSelectCourseInfoDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("studentSelectCourseInfoList",  studentSelectCourseInfoList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("studentNumber", studentNumber);
        Student_QQ287307421DAO student_QQ287307421DAO = new Student_QQ287307421DAO();
        List<Student_QQ287307421> student_QQ287307421List = student_QQ287307421DAO.QueryAllStudent_QQ287307421Info();
        ctx.put("student_QQ287307421List", student_QQ287307421List);
        ctx.put("courseNumber", courseNumber);
        CourseInfo_QQ254540457DAO courseInfo_QQ254540457DAO = new CourseInfo_QQ254540457DAO();
        List<CourseInfo_QQ254540457> courseInfo_QQ254540457List = courseInfo_QQ254540457DAO.QueryAllCourseInfo_QQ254540457Info();
        ctx.put("courseInfo_QQ254540457List", courseInfo_QQ254540457List);
        return "query_view";
    }

    /*前台查询StudentSelectCourseInfo信息*/
    public String FrontQueryStudentSelectCourseInfo() {
        if(currentPage == 0) currentPage = 1;
        List<StudentSelectCourseInfo> studentSelectCourseInfoList = studentSelectCourseInfoDAO.QueryStudentSelectCourseInfoInfo(studentNumber, courseNumber, currentPage);
        /*计算总的页数和总的记录数*/
        studentSelectCourseInfoDAO.CalculateTotalPageAndRecordNumber(studentNumber, courseNumber);
        /*获取到总的页码数目*/
        totalPage = studentSelectCourseInfoDAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = studentSelectCourseInfoDAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("studentSelectCourseInfoList",  studentSelectCourseInfoList);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("studentNumber", studentNumber);
        Student_QQ287307421DAO student_QQ287307421DAO = new Student_QQ287307421DAO();
        List<Student_QQ287307421> student_QQ287307421List = student_QQ287307421DAO.QueryAllStudent_QQ287307421Info();
        ctx.put("student_QQ287307421List", student_QQ287307421List);
        ctx.put("courseNumber", courseNumber);
        CourseInfo_QQ254540457DAO courseInfo_QQ254540457DAO = new CourseInfo_QQ254540457DAO();
        List<CourseInfo_QQ254540457> courseInfo_QQ254540457List = courseInfo_QQ254540457DAO.QueryAllCourseInfo_QQ254540457Info();
        ctx.put("courseInfo_QQ254540457List", courseInfo_QQ254540457List);
        return "front_query_view";
    }

    /*查询要修改的StudentSelectCourseInfo信息*/
    public String ModifyStudentSelectCourseInfoQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键selectId获取StudentSelectCourseInfo对象*/
        StudentSelectCourseInfo studentSelectCourseInfo = studentSelectCourseInfoDAO.GetStudentSelectCourseInfoBySelectId(selectId);

        Student_QQ287307421DAO student_QQ287307421DAO = new Student_QQ287307421DAO();
        List<Student_QQ287307421> student_QQ287307421List = student_QQ287307421DAO.QueryAllStudent_QQ287307421Info();
        ctx.put("student_QQ287307421List", student_QQ287307421List);
        CourseInfo_QQ254540457DAO courseInfo_QQ254540457DAO = new CourseInfo_QQ254540457DAO();
        List<CourseInfo_QQ254540457> courseInfo_QQ254540457List = courseInfo_QQ254540457DAO.QueryAllCourseInfo_QQ254540457Info();
        ctx.put("courseInfo_QQ254540457List", courseInfo_QQ254540457List);
        ctx.put("studentSelectCourseInfo",  studentSelectCourseInfo);
        return "modify_view";
    }

    /*查询要修改的StudentSelectCourseInfo信息*/
    public String FrontShowStudentSelectCourseInfoQuery() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键selectId获取StudentSelectCourseInfo对象*/
        StudentSelectCourseInfo studentSelectCourseInfo = studentSelectCourseInfoDAO.GetStudentSelectCourseInfoBySelectId(selectId);

        Student_QQ287307421DAO student_QQ287307421DAO = new Student_QQ287307421DAO();
        List<Student_QQ287307421> student_QQ287307421List = student_QQ287307421DAO.QueryAllStudent_QQ287307421Info();
        ctx.put("student_QQ287307421List", student_QQ287307421List);
        CourseInfo_QQ254540457DAO courseInfo_QQ254540457DAO = new CourseInfo_QQ254540457DAO();
        List<CourseInfo_QQ254540457> courseInfo_QQ254540457List = courseInfo_QQ254540457DAO.QueryAllCourseInfo_QQ254540457Info();
        ctx.put("courseInfo_QQ254540457List", courseInfo_QQ254540457List);
        ctx.put("studentSelectCourseInfo",  studentSelectCourseInfo);
        return "front_show_view";
    }

    /*更新修改StudentSelectCourseInfo信息*/
    public String ModifyStudentSelectCourseInfo() {
        ActionContext ctx = ActionContext.getContext();
        try {
            if(true) {
            Student_QQ287307421DAO student_QQ287307421DAO = new Student_QQ287307421DAO();
            Student_QQ287307421 studentNumber = student_QQ287307421DAO.GetStudent_QQ287307421ByStudentNumber(studentSelectCourseInfo.getStudentNumber().getStudentNumber());
            studentSelectCourseInfo.setStudentNumber(studentNumber);
            }
            if(true) {
            CourseInfo_QQ254540457DAO courseInfo_QQ254540457DAO = new CourseInfo_QQ254540457DAO();
            CourseInfo_QQ254540457 courseNumber = courseInfo_QQ254540457DAO.GetCourseInfo_QQ254540457ByCourseNumber(studentSelectCourseInfo.getCourseNumber().getCourseNumber());
            studentSelectCourseInfo.setCourseNumber(courseNumber);
            }
            studentSelectCourseInfoDAO.UpdateStudentSelectCourseInfo(studentSelectCourseInfo);
            ctx.put("message",  java.net.URLEncoder.encode("StudentSelectCourseInfo信息更新成功!"));
            return "modify_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("StudentSelectCourseInfo信息更新失败!"));
            return "error";
       }
   }

    /*删除StudentSelectCourseInfo信息*/
    public String DeleteStudentSelectCourseInfo() {
        ActionContext ctx = ActionContext.getContext();
        try { 
            studentSelectCourseInfoDAO.DeleteStudentSelectCourseInfo(selectId);
            ctx.put("message",  java.net.URLEncoder.encode("StudentSelectCourseInfo删除成功!"));
            return "delete_success";
        } catch (Exception e) { 
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("StudentSelectCourseInfo删除失败!"));
            return "error";
        }
    }

}
