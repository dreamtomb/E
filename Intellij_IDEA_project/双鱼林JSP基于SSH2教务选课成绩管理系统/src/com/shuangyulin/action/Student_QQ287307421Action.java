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
import com.shuangyulin.dao.Student_QQ287307421DAO;
import com.shuangyulin.domain.Student_QQ287307421;
import com.shuangyulin.dao.ClassInfoDAO;
import com.shuangyulin.domain.ClassInfo;
import com.shuangyulin.test.TestUtil;

public class Student_QQ287307421Action extends ActionSupport {

/*图片字段studentPhoto参数接收*/
	 private File studentPhotoFile;
	 private String studentPhotoFileFileName;
	 private String studentPhotoFileContentType;
	 public File getStudentPhotoFile() {
		return studentPhotoFile;
	}
	public void setStudentPhotoFile(File studentPhotoFile) {
		this.studentPhotoFile = studentPhotoFile;
	}
	public String getStudentPhotoFileFileName() {
		return studentPhotoFileFileName;
	}
	public void setStudentPhotoFileFileName(String studentPhotoFileFileName) {
		this.studentPhotoFileFileName = studentPhotoFileFileName;
	}
	public String getStudentPhotoFileContentType() {
		return studentPhotoFileContentType;
	}
	public void setStudentPhotoFileContentType(String studentPhotoFileContentType) {
		this.studentPhotoFileContentType = studentPhotoFileContentType;
	}
    /*界面层需要查询的属性: 学号*/
    private String studentNumber;
    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }
    public String getStudentNumber() {
        return this.studentNumber;
    }

    /*界面层需要查询的属性: 姓名*/
    private String studentName;
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    public String getStudentName() {
        return this.studentName;
    }

    /*界面层需要查询的属性: 所在班级*/
    private ClassInfo studentClassNumber;
    public void setStudentClassNumber(ClassInfo studentClassNumber) {
        this.studentClassNumber = studentClassNumber;
    }
    public ClassInfo getStudentClassNumber() {
        return this.studentClassNumber;
    }

    /*界面层需要查询的属性: 出生日期*/
    private String studentBirthday;
    public void setStudentBirthday(String studentBirthday) {
        this.studentBirthday = studentBirthday;
    }
    public String getStudentBirthday() {
        return this.studentBirthday;
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
    Student_QQ287307421DAO student_QQ287307421DAO = new Student_QQ287307421DAO();

    /*待操作的Student_QQ287307421对象*/
    private Student_QQ287307421 student_QQ287307421;
    public void setStudent_QQ287307421(Student_QQ287307421 student_QQ287307421) {
        this.student_QQ287307421 = student_QQ287307421;
    }
    public Student_QQ287307421 getStudent_QQ287307421() {
        return this.student_QQ287307421;
    }

    /*跳转到添加Student_QQ287307421视图*/
    public String AddView() {
        ActionContext ctx = ActionContext.getContext();
        /*查询所有的ClassInfo信息*/
        ClassInfoDAO classInfoDAO = new ClassInfoDAO();
        List<ClassInfo> classInfoList = classInfoDAO.QueryAllClassInfoInfo();
        ctx.put("classInfoList", classInfoList);
        return "add_view";
    }

    /*添加Student_QQ287307421信息*/
    @SuppressWarnings("deprecation")
    public String AddStudent_QQ287307421() {
        ActionContext ctx = ActionContext.getContext();
        /*验证学号是否已经存在*/
        String studentNumber = student_QQ287307421.getStudentNumber();
        Student_QQ287307421 db_student_QQ287307421 = student_QQ287307421DAO.GetStudent_QQ287307421ByStudentNumber(studentNumber);
        if(null != db_student_QQ287307421) {
            ctx.put("error",  java.net.URLEncoder.encode("该学号已经存在!"));
            return "error";
        }
        try {
            if(true) {
            ClassInfoDAO classInfoDAO = new ClassInfoDAO();
            ClassInfo studentClassNumber = classInfoDAO.GetClassInfoByClassNumber(student_QQ287307421.getStudentClassNumber().getClassNumber());
            student_QQ287307421.setStudentClassNumber(studentClassNumber);
            }
            String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
            /*处理图片上传*/
            String studentPhotoFileName = ""; 
       	 	if(studentPhotoFile != null) {
       	 		InputStream is = new FileInputStream(studentPhotoFile);
       			String fileContentType = this.getStudentPhotoFileContentType();
       			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
       				studentPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
       			else if(fileContentType.equals("image/gif"))
       				studentPhotoFileName = UUID.randomUUID().toString() +  ".gif";
       			else {
       				ctx.put("error",  java.net.URLEncoder.encode("上传图片格式不正确!"));
       				return "error";
       			}
       			File file = new File(path, studentPhotoFileName);
       			OutputStream os = new FileOutputStream(file);
       			byte[] b = new byte[1024];
       			int bs = 0;
       			while ((bs = is.read(b)) > 0) {
       				os.write(b, 0, bs);
       			}
       			is.close();
       			os.close();
       	 	}
            if(studentPhotoFile != null)
            	student_QQ287307421.setStudentPhoto("upload/" + studentPhotoFileName);
            else
            	student_QQ287307421.setStudentPhoto("upload/NoImage.jpg");
            student_QQ287307421DAO.AddStudent_QQ287307421(student_QQ287307421);
            ctx.put("message",  java.net.URLEncoder.encode("Student_QQ287307421添加成功!"));
            return "add_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("Student_QQ287307421添加失败!"));
            return "error";
        }
    }

    /*查询Student_QQ287307421信息*/
    public String QueryStudent_QQ287307421() {
        if(currentPage == 0) currentPage = 1;
        if(studentNumber == null) studentNumber = "";
        if(studentName == null) studentName = "";
        if(studentBirthday == null) studentBirthday = "";
        List<Student_QQ287307421> student_QQ287307421List = student_QQ287307421DAO.QueryStudent_QQ287307421Info(studentNumber, studentName, studentClassNumber, studentBirthday, currentPage);
        /*计算总的页数和总的记录数*/
        student_QQ287307421DAO.CalculateTotalPageAndRecordNumber(studentNumber, studentName, studentClassNumber, studentBirthday);
        /*获取到总的页码数目*/
        totalPage = student_QQ287307421DAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = student_QQ287307421DAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("student_QQ287307421List",  student_QQ287307421List);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("studentNumber", studentNumber);
        ctx.put("studentName", studentName);
        ctx.put("studentClassNumber", studentClassNumber);
        ClassInfoDAO classInfoDAO = new ClassInfoDAO();
        List<ClassInfo> classInfoList = classInfoDAO.QueryAllClassInfoInfo();
        ctx.put("classInfoList", classInfoList);
        ctx.put("studentBirthday", studentBirthday);
        return "query_view";
    }

    /*前台查询Student_QQ287307421信息*/
    public String FrontQueryStudent_QQ287307421() {
        if(currentPage == 0) currentPage = 1;
        if(studentNumber == null) studentNumber = "";
        if(studentName == null) studentName = "";
        if(studentBirthday == null) studentBirthday = "";
        List<Student_QQ287307421> student_QQ287307421List = student_QQ287307421DAO.QueryStudent_QQ287307421Info(studentNumber, studentName, studentClassNumber, studentBirthday, currentPage);
        /*计算总的页数和总的记录数*/
        student_QQ287307421DAO.CalculateTotalPageAndRecordNumber(studentNumber, studentName, studentClassNumber, studentBirthday);
        /*获取到总的页码数目*/
        totalPage = student_QQ287307421DAO.getTotalPage();
        /*当前查询条件下总记录数*/
        recordNumber = student_QQ287307421DAO.getRecordNumber();
        ActionContext ctx = ActionContext.getContext();
        ctx.put("student_QQ287307421List",  student_QQ287307421List);
        ctx.put("totalPage", totalPage);
        ctx.put("recordNumber", recordNumber);
        ctx.put("currentPage", currentPage);
        ctx.put("studentNumber", studentNumber);
        ctx.put("studentName", studentName);
        ctx.put("studentClassNumber", studentClassNumber);
        ClassInfoDAO classInfoDAO = new ClassInfoDAO();
        List<ClassInfo> classInfoList = classInfoDAO.QueryAllClassInfoInfo();
        ctx.put("classInfoList", classInfoList);
        ctx.put("studentBirthday", studentBirthday);
        return "front_query_view";
    }

    /*查询要修改的Student_QQ287307421信息*/
    public String ModifyStudent_QQ287307421Query() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键studentNumber获取Student_QQ287307421对象*/
        Student_QQ287307421 student_QQ287307421 = student_QQ287307421DAO.GetStudent_QQ287307421ByStudentNumber(studentNumber);

        ClassInfoDAO classInfoDAO = new ClassInfoDAO();
        List<ClassInfo> classInfoList = classInfoDAO.QueryAllClassInfoInfo();
        ctx.put("classInfoList", classInfoList);
        ctx.put("student_QQ287307421",  student_QQ287307421);
        return "modify_view";
    }

    /*查询要修改的Student_QQ287307421信息*/
    public String FrontShowStudent_QQ287307421Query() {
        ActionContext ctx = ActionContext.getContext();
        /*根据主键studentNumber获取Student_QQ287307421对象*/
        Student_QQ287307421 student_QQ287307421 = student_QQ287307421DAO.GetStudent_QQ287307421ByStudentNumber(studentNumber);

        ClassInfoDAO classInfoDAO = new ClassInfoDAO();
        List<ClassInfo> classInfoList = classInfoDAO.QueryAllClassInfoInfo();
        ctx.put("classInfoList", classInfoList);
        ctx.put("student_QQ287307421",  student_QQ287307421);
        return "front_show_view";
    }

    /*更新修改Student_QQ287307421信息*/
    public String ModifyStudent_QQ287307421() {
        ActionContext ctx = ActionContext.getContext();
        try {
            if(true) {
            ClassInfoDAO classInfoDAO = new ClassInfoDAO();
            ClassInfo studentClassNumber = classInfoDAO.GetClassInfoByClassNumber(student_QQ287307421.getStudentClassNumber().getClassNumber());
            student_QQ287307421.setStudentClassNumber(studentClassNumber);
            }
            String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
            /*处理图片上传*/
            String studentPhotoFileName = ""; 
       	 	if(studentPhotoFile != null) {
       	 		InputStream is = new FileInputStream(studentPhotoFile);
       			String fileContentType = this.getStudentPhotoFileContentType();
       			if(fileContentType.equals("image/jpeg") || fileContentType.equals("image/pjpeg"))
       				studentPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
       			else if(fileContentType.equals("image/gif"))
       				studentPhotoFileName = UUID.randomUUID().toString() +  ".gif";
       			else {
       				ctx.put("error",  java.net.URLEncoder.encode("上传图片格式不正确!"));
       				return "error";
       			}
       			File file = new File(path, studentPhotoFileName);
       			OutputStream os = new FileOutputStream(file);
       			byte[] b = new byte[1024];
       			int bs = 0;
       			while ((bs = is.read(b)) > 0) {
       				os.write(b, 0, bs);
       			}
       			is.close();
       			os.close();
            student_QQ287307421.setStudentPhoto("upload/" + studentPhotoFileName);
       	 	}
            student_QQ287307421DAO.UpdateStudent_QQ287307421(student_QQ287307421);
            ctx.put("message",  java.net.URLEncoder.encode("Student_QQ287307421信息更新成功!"));
            return "modify_success";
        } catch (Exception e) {
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("Student_QQ287307421信息更新失败!"));
            return "error";
       }
   }

    /*删除Student_QQ287307421信息*/
    public String DeleteStudent_QQ287307421() {
        ActionContext ctx = ActionContext.getContext();
        try { 
            student_QQ287307421DAO.DeleteStudent_QQ287307421(studentNumber);
            ctx.put("message",  java.net.URLEncoder.encode("Student_QQ287307421删除成功!"));
            return "delete_success";
        } catch (Exception e) { 
            e.printStackTrace();
            ctx.put("error",  java.net.URLEncoder.encode("Student_QQ287307421删除失败!"));
            return "error";
        }
    }

}
