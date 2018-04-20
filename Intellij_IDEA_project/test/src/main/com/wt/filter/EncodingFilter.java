package wt.filter;

import java.io.*;
import javax.servlet.*;

public class EncodingFilter implements Filter {
    //容器初始化filter
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    //每次调用资源时都会调用这个方法
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
        } catch (Exception e) {
        }
        chain.doFilter(request, response);
    }

    //容器卸载filter实例
    public void destroy() {
    }
}
