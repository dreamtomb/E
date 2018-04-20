package wt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wt.entity.*;
import wt.dao.*;

public class LoginCheckServlet extends HttpServlet {

    public LoginCheckServlet() {
        super();
    }

    public void destroy() {
        super.destroy();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String kind = request.getParameter("kind");
        UserDAO udao = new UserDAO();
        User user = null;
        try {
            user = udao.check(id, kind);
            if (user.getId().equals(id)) {
                HttpSession session;
                session = request.getSession(true);
                session.setAttribute("id", user.getId());
                session.setAttribute("na", user.getName());
                session.setAttribute("pa", user.getCode());
                session.setAttribute("kind", user.getKind());
                if (kind.equals("admin")) {
                    if (password.equals(user.getCode())) {
                        response.sendRedirect("view/AdminMainFrame.jsp");
                    } else {
                        response.setHeader("refresh", "2;URL=view/login.jsp");
                        out.print("<font size=5 color=red>密码错误!</font>");
                    }
                } else if (kind.equals("student")) {
                    if (password.equals(user.getCode())) {
                        response.sendRedirect("view/StudentMainFrame.jsp");
                    } else {
                        response.setHeader("refresh", "2;URL=view/login.jsp");
                        out.print("<font size=5 color=red>密码错误!</font>");
                    }
                } else if (kind.equals("teacher")) {
                    if (password.equals(user.getCode())) {
                        response.sendRedirect("view/TeacherMainFrame.jsp");
                    } else {
                        response.setHeader("refresh", "2;URL=view/login.jsp");
                        out.print("<font size=5 color=red>密码错误!</font>");
                    }
                }
            }
        } catch (Exception e) {
            out.print("<font size=5 color=red>没有这个用户!</font>");
            response.setHeader("refresh", "2;URL=view/login.jsp");
        }
        out.flush();
        out.close();
    }
}
