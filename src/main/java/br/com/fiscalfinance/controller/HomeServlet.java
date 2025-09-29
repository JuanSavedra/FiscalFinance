package br.com.fiscalfinance.controller;

import br.com.fiscalfinance.dao.SavingDao;
import br.com.fiscalfinance.dao.TransactionDao;
import br.com.fiscalfinance.factory.DaoFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            TransactionDao transactionDao = DaoFactory.getTransactionDao();
            SavingDao savingDao = DaoFactory.getSavingDao();
            Map<String, Double> transactionTotals = transactionDao.getTotalsByType();

            double totalEntries = transactionTotals.getOrDefault("Entrada", 0.0);
            double totalExits = transactionTotals.getOrDefault("Saída", 0.0);
            double totalSavings = savingDao.getTotalDeposits();

            req.setAttribute("totalEntries", totalEntries);
            req.setAttribute("totalExits", totalExits);
            req.setAttribute("totalSavings", totalSavings);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Erro ao carregar os dados do dashboard.");
        }

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
