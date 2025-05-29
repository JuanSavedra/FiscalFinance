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
    private AccountDao dao;
    private EmailBo bo;

    public AccountServlet() throws SQLException {
        dao = DaoFactory.getAccountDao();
        bo = new EmailBo();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("Email");
        String senha = request.getParameter("Senha");

        Account account = new Account(email, senha);

        try {
            if (dao.validateAccount(account)) {
                HttpSession session = request.getSession();
                session.setAttribute("account", email);
                request.getRequestDispatcher("index.jsp").forward(request, response);

                try {
                    String message = "Um login foi realizado na plataforma 'FiscalFinance' em " + LocalDateTime.now();
                    bo.sendEmail(email, "Login realizado.", message);
                } catch (EmailException error) {
                    error.printStackTrace();
                }
            } else {
                request.setAttribute("error", "Email e/ou senha inválidos.");
                request.getRequestDispatcher("home.jsp").forward(request, response);
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
