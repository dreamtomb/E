package wt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import wt.dao.CourseDAO;

public class CourseServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
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

    public void doAdd(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String cno = request.getParameter("cno");
        String cname = request.getParameter("cname");
        String scredit = request.getParameter("credit");
        double credit = Double.parseDouble(scredit);
        CourseDAO cdao = new CourseDAO();
        try {
            cdao.InsertCourse(cno, cname, credit);
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

    public void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String cno = request.getParameter("cno");
        CourseDAO cdao = new CourseDAO();
        try {
            cdao.DeletebyID(cno);
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/t.png ><font size=6 color=red>删除成功</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/f.png ><font size=6 color=red>删除失败/font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        }
        out.flush();
        out.close();
    }

    public void doUpdate(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String cno = request.getParameter("cno");
        String cname = request.getParameter("cname");
        String scredit = request.getParameter("credit");
        double credit = Double.parseDouble(scredit);
        CourseDAO cdao = new CourseDAO();
        try {
            cdao.UpdatebyID(cno, cname, credit);
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/t.png ><font size=6 color=red>更新成功</font> ");
            out.println("  </BODY>");
        } catch (Exception e) {
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/f.png ><font size=6 color=red>更新失败</font> ");
            out.println("  </BODY>");
        }
        out.flush();
        out.close();
    }
}