package wt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wt.dao.MassageDAO;
import wt.dao.StudentDAO;
import wt.entity.Student;

public class MessageServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if ("new".equalsIgnoreCase(action)) {
            doAdd(request, response);
        }
        if ("delete".equalsIgnoreCase(action)) {
            doDelete(request, response);
        }
        if ("update".equalsIgnoreCase(action)) {
            doUpdate(request, response);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String content = request.getParameter("content");
        String date = new Date(System.currentTimeMillis()).toString();
        String name = null;
        MassageDAO msgdao = new MassageDAO();
        StudentDAO sdao = new StudentDAO();
        Student stu = new Student();
        try {
            if (id.equals("1")) {
                msgdao.InsertMassage(id, "admin", content, date);
            } else {
                name = sdao.SelectBySid(id);
                msgdao.InsertMassage(id, name, content, date);
            }
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/t.png ><font size=6 color=red>插入成功</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        } catch (Exception e) {
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/f.png ><font size=6 color=red>插入失败</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        }
        out.flush();
        out.close();
    }

    public void doUpdate(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
    }

    public void doDelete(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String rmid = request.getParameter("mid");
        int mid = Integer.parseInt(rmid);
        MassageDAO msgdao = new MassageDAO();
        try {
            msgdao.DeletebyMid(mid);
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/t.png ><font size=6 color=red>删除成功</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        } catch (Exception e) {
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/f.png ><font size=6 color=red>删除失败</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        }
        out.flush();
        out.close();
    }
}
