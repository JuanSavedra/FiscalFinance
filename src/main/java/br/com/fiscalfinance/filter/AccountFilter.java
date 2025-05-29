package br.com.fiscalfinance.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class AccountFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpSession session = req.getSession();
        String url = req.getRequestURI();

        if (session.getAttribute("account") == null && !url.endsWith("login") && !url.contains("resources")
                && !url.contains("home") && !url.contains("register")) {
            req.getRequestDispatcher("home.jsp").forward(req, servletResponse);
        } else {
            filterChain.doFilter(req, servletResponse);
        }
    }
}
