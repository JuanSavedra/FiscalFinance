package br.com.fiscalfinance.controller;

import br.com.fiscalfinance.dao.AccountDao;
import br.com.fiscalfinance.factory.DaoFactory;
import br.com.fiscalfinance.model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private AccountDao dao;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            dao = DaoFactory.getAccountDao();

            String username = req.getParameter("UsuarioRegistro");
            String name = req.getParameter("EmailRegistro");
            String password = req.getParameter("SenhaRegistro");

            Account account = new Account(username, name, password);

            dao.register(account);
            dao.closeConnection();
        } catch (SQLException error) {
            System.err.println(error);
        }

        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }
}
