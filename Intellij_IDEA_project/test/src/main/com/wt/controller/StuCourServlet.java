package wt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wt.dao.CourseDAO;
import wt.dao.StuCourDAO;
import wt.dao.TeaCourDAO;
import wt.entity.Course;
import wt.entity.StuCour;

public class StuCourServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if ("new".equalsIgnoreCase(action)) {
            doAdd(request, response);
        }
        if ("delete".equalsIgnoreCase(action)) {
            doDelete(request, response);
        }
        if ("scoresub".equalsIgnoreCase(action)) {
            doSubScore(request, response);
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
        String sid = request.getParameter("sid");
        String cno = request.getParameter("cno");
        String rcteachno = request.getParameter("cteachno");
        int cteachno = Integer.parseInt(rcteachno);
        double credit = 0;
        CourseDAO cdao = new CourseDAO();
        TeaCourDAO tcdao = new TeaCourDAO();
        StuCourDAO scdao = new StuCourDAO();
        Vector vct1 = null;
        String tid = null;
        String ctime = null;
        boolean cancho = false;
        try {
            System.out.println("%%%%%%%%%%%");
            vct1 = cdao.Select(cno, "", 0);
            tid = tcdao.SelectTid(cno, cteachno);
            ctime = tcdao.SelectCtime(cno, cteachno);
            cancho = scdao.Check(sid, ctime);
            System.out.println(cancho);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        if (vct1.size() != 0) {
            Course cou = (Course) vct1.elementAt(0);
            credit = cou.getCredit();
        }
        if (cancho == false) {
            try {
                scdao.Insert(sid, cno, tid, credit);
                tcdao.AddCsel(tid, cno);
            } catch (Exception e) {
            }
            response.sendRedirect("../view/StudentSubmitSelectedCourse.jsp");
        } else {
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/f.png ><font size=6 color=red>检查失败</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        }
        out.flush();
        out.close();
    }

    public void doDelete(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String sid = request.getParameter("sid");
        String rn = request.getParameter("n");
        int n = Integer.parseInt(rn);
        int fn = 0;
        int dn = 0;
        StuCourDAO scdao = new StuCourDAO();
        TeaCourDAO tcdao = new TeaCourDAO();
        for (int i = 0; i < n; i++) {
            String cno = request.getParameter("cno" + i + "");
            if (cno != null) {
                try {
                    Vector all = scdao.SelectCourse(sid);
                    String tid = null;
                    for (int j = 0; j < all.size(); j++) {
                        StuCour cou = (StuCour) all.elementAt(j);
                        if (cou.getCno().equals(cno)) {
                            tid = cou.getTid();
                        }
                    }
                    scdao.DeletebyID(sid, cno);
                    tcdao.DelCsel(tid, cno);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    out.println("<HTML>");
                    out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
                    out.println("  <BODY bgcolor=#8dd8f8>");
                    out.print("  <img src=image/f.png ><font size=6 color=red>删除失败<br></font> ");
                    out.println("  </BODY>");
                    out.println("</HTML>");
                    fn++;
                }
                dn++;
            }
        }
        if (dn == 0) {
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/f.png ><font size=6 color=red> dn=0</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        } else {
            if (fn == 0) {
                out.println("<HTML>");
                out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
                out.println("  <BODY bgcolor=#8dd8f8>");
                out.print("  <img src=image/t.png ><font size=6 color=red> fn=0</font> ");
                out.println("  </BODY>");
                out.println("</HTML>");
            }
        }
        out.flush();
        out.close();
    }

    public void doSubScore(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String rsn = request.getParameter("sn");
        int sn = Integer.parseInt(rsn);
        String tid = request.getParameter("tid");
        String cno = request.getParameter("cno");
        String submit = request.getParameter("submit");
        TeaCourDAO tcdao = new TeaCourDAO();
        int con = 0;
        for (int j = 0; j < sn; j++) {
            String sid = request.getParameter("sid" + j + "");
            String rpscore = request.getParameter("pscore" + j + "");
            String rlscore = request.getParameter("lscore" + j + "");
            double pscore = Double.parseDouble(rpscore);
            double lscore = Double.parseDouble(rlscore);
            StuCourDAO scdao = new StuCourDAO();
            try {
                scdao.UpdateScore(sid, cno, tid, pscore, lscore);
            } catch (Exception e) {
                out.println("<HTML>");
                out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
                out.println("  <BODY bgcolor=#8dd8f8>");
                out.print("  <img src=image/f.png ><font size=6 color=red>更新成功<br></font> ");
                out.println("  </BODY>");
                out.println("</HTML>");
                con = con++;
            }
        }
        if (con == 0) {
            try {
                if (submit.equals("最终提交")) {
                    tcdao.UpdateSub(tid, cno, "1");
                } else {
                    tcdao.UpdateSub(tid, cno, "2");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/t.png ><font size=6 color=red>执行sub</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        }
        out.flush();
        out.close();
    }


    public void init() throws ServletException {
    }

    public void destroy() {
        super.destroy();
    }

}
