package br.com.fiscalfinance.controller;

import br.com.fiscalfinance.bo.EmailBo;
import br.com.fiscalfinance.dao.AccountDao;
import br.com.fiscalfinance.exception.EmailException;
import br.com.fiscalfinance.factory.DaoFactory;
import br.com.fiscalfinance.manager.ConnectionManager;
import br.com.fiscalfinance.model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

@WebServlet("/login")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    {
        String email = req.getParameter("Email");
        String senha = req.getParameter("Senha");

        Account account = new Account(email, senha);

        try {
            AccountDao dao = DaoFactory.getAccountDao();
            EmailBo bo = new EmailBo();

            if (dao.validateAccount(account)) {
                HttpSession session = req.getSession();
                session.setAttribute("account", email);
                resp.sendRedirect("home");

//                try {
//                    String message = "Um login foi realizado na plataforma 'FiscalFinance' em " + LocalDateTime.now();
//                    bo.sendEmail(email, "Login realizado.", message);
//                } catch (EmailException error) {
//                    error.printStackTrace();
//                }
            } else {
                req.setAttribute("error", "Email e/ou senha inválidos.");
                req.getRequestDispatcher("home.jsp").forward(req, resp);
            }
        } catch (SQLException error) {
            throw new RuntimeException(error);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}