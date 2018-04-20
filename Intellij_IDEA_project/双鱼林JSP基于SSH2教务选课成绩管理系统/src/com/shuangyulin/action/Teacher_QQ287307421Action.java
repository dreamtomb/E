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
import com.shuangyulin.dao.Teacher_QQ287307421DAO;
import com.shuangyulin.domain.Teacher_QQ287307421;
import com.shuangyulin.test.TestUtil;

public class Teacher_QQ287307421Action extends ActionSupport {

/*图片字段teacherPhoto参数接收*/
	 private File teacherPhotoFile;
	 private String teacherPhotoFileFileName;
	 private String teacherPhotoFileContentType;
	 public File getTeacherPhotoFile() {
		return teacherPhotoFile;
	}
	public void setTeacherPhotoFile(File teacherPhotoFile) {
		this.teacherPhotoFile = teacherPhotoFile;
	}
	public String getTeacherPhotoFileFileName() {
		return teacherPhotoFileFileName;
	}
	public void setTeacherPhotoFileFileName(String teacherPhotoFileFileName) {
		this.teacherPhotoFileFileName = teacherPhotoFileFileName;
	}
	public String getTeacherPhotoFileContentType() {
		return teacherPhotoFileContentType;
	}
	public void setTeacherPhotoFileContentType(String teacherPhotoFileContentType) {
		this.teacherPhotoFileContentType = teacherPhotoFileContentType;
	}
    /*界面层需要查询的属性: 教师编号*/
    private String teacherNumber;
    public void setTeacherNumber(String teacherNumber) {
        this.teacherNumber = teacherNumber;
    }
    public String getTeacherNumber() {
        return this.teacherNumber;
    }

    /*界面层需要查询的属性: 教师姓名*/
    private String teacherName;
    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
    public String getTeacherName() {
        return this.teacherName;
    }

    /*界面层需要查询的属性: 出生日期*/
    private String teacherBirthday;
    public void setTeacherBirthday(String teacherBirthday) {
        this.teacherBirthday = teacherBirthday;
    }
    public String getTeacherBirthday() {
        return this.teacherBirthday;
    }

    /*界面层需要查询的属性: 入职日期*/
    private String teacherArriveDate;
    public void setTeacherArriveDate(String teacherArriveDate) {
        this.teacherArriveDate = teacherArriveDate;
    }
    public String getTeacherArriveDate() {
        return this.teacherArriveDate;
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
    Teacher_QQ287307421DAO teacher_QQ287307421DAO = new Teacher_QQ287307421DAO();

    /*待操作的Teacher_QQ287307421对象*/
    private Teacher_QQ287307421 teacher_QQ287307421;
    public void setTeacher_QQ287307421(Teacher_QQ287307421 teacher_QQ287307421) {
        this.teacher_QQ287307421 = teacher_QQ287307421;
    }
    public Teacher_QQ287307421 getTeacher_QQ287307421() {
        return this.teacher_QQ287307421;
    }

    /*跳转到添加Teacher_QQ287307421视图*/
    public String AddView() {
        ActionContext ctx = ActionContext.getContext();
        return "add_view";
    }

    /*添加Teacher_QQ287307421信息*/
    @SuppressWarnings("deprecation")
    public String AddTeacher_QQ287307421() {
        ActionContext ctx = ActionContext.getContext();
        /*验证教师编号是否已经存在*/
        String teacherNumber = teacher_QQ287307421.getTeacherNumber();
        Teacher_QQ287307421 db_teacher_QQ287307421 = teacher_QQ287307421DAO.GetTeacher_QQ287307421ByTeacherNumber(teacherNumber);
        if(null != db_teacher_QQ287307421) {
            ctx.put("error",  java.net.URLEncoder.encode("该教师编号已经存在!"));
            return "error";
        }
        try {
            String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
            /*处理图片上传*/
            String teacherPhotoFileName = ""; 
       	 	if(teacherPhotoFile != null) {
       	 		InputStream is = new FileInputStream(teacherPhotoFile);
       			String fileContentType = this.getTeacherPhotoFileContentType();
       			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
       				teacherPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
       			else if(fileContentType.equals("image/gif"))
       				teacherPhotoFileName = UUID.randomUUID().toString() +  ".gif";
       			else {
       				ctx.put("error",  java.net.URLEncoder.encode("上传图片格式不正确!"));
       				return "error";
       			}
       			File file = new File(path, teacherPhotoFileName);
       			OutputStream os = new FileOutputStream(file);
       			byte[] b = new byte[1024];
       			int bs = 0;
       			while ((bs = is.read(b)) > 0) {
       				os.write(b, 0, bs);
       			}
       			is.close();
       			os.close();
       	 	}
            if(teacherPhotoFile != null)
            	teacher_QQ287307421.setTeacherPhoto("upload/" + teacherPhotoFileName);
            else
            	teacher_QQ287307421.setTeacherPhoto("upload/NoImage.jpg");
            teacher_QQ287307421DAO.AddTeacher_QQ287307421(teacher_QQ287307421);
            ctx.put("message",  java.net.URLEncoder.encode("Teacher_QQ287307421添加成功!"));
            return "add_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("Teacher_QQ287307421添加失败!"));
            return "error";
        }
    }

    /*查询Teacher_QQ287307421信息*/
    public String QueryTeacher_QQ287307421() {
        if(currentPage == 0) currentPage = 1;
        if(teacherNumber == null) teacherNumber = "";
        if(teacherName == null) teacherName = "";
        if(teacherBirthday == null) teacherBirthday = "";
        if(teacherArriveDate == null) teacherArriveDate = "";
        List<Teacher_QQ287307421> teacher_QQ287307421List = teacher_QQ287307421DAO.QueryTeacher_QQ287307421Info(teacherNumber, teacherName, teacherBirthday, teacherArriveDate, currentPage);
        /*计算总的页数和总的记录数*/
        teacher_QQ287307421DAO.CalculateTotalPageAndRecordNumber(teacherNumber, teacherName, teacherBirthday, teacherArriveDate);
        /*获取到总的页码数目*/
        totalPage = teacher_QQ287307421DAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = teacher_QQ287307421DAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("teacher_QQ287307421List",  teacher_QQ287307421List);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("teacherNumber", teacherNumber);
        ctx.put("teacherName", teacherName);
        ctx.put("teacherBirthday", teacherBirthday);
        ctx.put("teacherArriveDate", teacherArriveDate);
        return "query_view";
    }

    /*前台查询Teacher_QQ287307421信息*/
    public String FrontQueryTeacher_QQ287307421() {
        if(currentPage == 0) currentPage = 1;
        if(teacherNumber == null) teacherNumber = "";
        if(teacherName == null) teacherName = "";
        if(teacherBirthday == null) teacherBirthday = "";
        if(teacherArriveDate == null) teacherArriveDate = "";
        List<Teacher_QQ287307421> teacher_QQ287307421List = teacher_QQ287307421DAO.QueryTeacher_QQ287307421Info(teacherNumber, teacherName, teacherBirthday, teacherArriveDate, currentPage);
        /*计算总的页数和总的记录数*/
        teacher_QQ287307421DAO.CalculateTotalPageAndRecordNumber(teacherNumber, teacherName, teacherBirthday, teacherArriveDate);
        /*获取到总的页码数目*/
        totalPage = teacher_QQ287307421DAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = teacher_QQ287307421DAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("teacher_QQ287307421List",  teacher_QQ287307421List);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("teacherNumber", teacherNumber);
        ctx.put("teacherName", teacherName);
        ctx.put("teacherBirthday", teacherBirthday);
        ctx.put("teacherArriveDate", teacherArriveDate);
        return "front_query_view";
    }

    /*查询要修改的Teacher_QQ287307421信息*/
    public String ModifyTeacher_QQ287307421Query() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键teacherNumber获取Teacher_QQ287307421对象*/
        Teacher_QQ287307421 teacher_QQ287307421 = teacher_QQ287307421DAO.GetTeacher_QQ287307421ByTeacherNumber(teacherNumber);

        ctx.put("teacher_QQ287307421",  teacher_QQ287307421);
        return "modify_view";
    }

    /*查询要修改的Teacher_QQ287307421信息*/
    public String FrontShowTeacher_QQ287307421Query() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键teacherNumber获取Teacher_QQ287307421对象*/
        Teacher_QQ287307421 teacher_QQ287307421 = teacher_QQ287307421DAO.GetTeacher_QQ287307421ByTeacherNumber(teacherNumber);

        ctx.put("teacher_QQ287307421",  teacher_QQ287307421);
        return "front_show_view";
    }

    /*更新修改Teacher_QQ287307421信息*/
    public String ModifyTeacher_QQ287307421() {
        ActionContext ctx = ActionContext.getContext();
        try {
            String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
            /*处理图片上传*/
            String teacherPhotoFileName = ""; 
       	 	if(teacherPhotoFile != null) {
       	 		InputStream is = new FileInputStream(teacherPhotoFile);
       			String fileContentType = this.getTeacherPhotoFileContentType();
       			if(fileContentType.equals("image/jpeg") || fileContentType.equals("image/pjpeg"))
       				teacherPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
       			else if(fileContentType.equals("image/gif"))
       				teacherPhotoFileName = UUID.randomUUID().toString() +  ".gif";
       			else {
       				ctx.put("error",  java.net.URLEncoder.encode("上传图片格式不正确!"));
       				return "error";
       			}
       			File file = new File(path, teacherPhotoFileName);
       			OutputStream os = new FileOutputStream(file);
       			byte[] b = new byte[1024];
       			int bs = 0;
       			while ((bs = is.read(b)) > 0) {
       				os.write(b, 0, bs);
       			}
       			is.close();
       			os.close();
            teacher_QQ287307421.setTeacherPhoto("upload/" + teacherPhotoFileName);
       	 	}
            teacher_QQ287307421DAO.UpdateTeacher_QQ287307421(teacher_QQ287307421);
            ctx.put("message",  java.net.URLEncoder.encode("Teacher_QQ287307421信息更新成功!"));
            return "modify_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("Teacher_QQ287307421信息更新失败!"));
            return "error";
       }
   }

    /*删除Teacher_QQ287307421信息*/
    public String DeleteTeacher_QQ287307421() {
        ActionContext ctx = ActionContext.getContext();
        try { 
            teacher_QQ287307421DAO.DeleteTeacher_QQ287307421(teacherNumber);
            ctx.put("message",  java.net.URLEncoder.encode("Teacher_QQ287307421删除成功!"));
            return "delete_success";
        } catch (Exception e) { 
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("Teacher_QQ287307421删除失败!"));
            return "error";
        }
    }

}
