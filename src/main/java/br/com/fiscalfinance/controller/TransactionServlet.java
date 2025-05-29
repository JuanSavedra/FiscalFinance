package br.com.fiscalfinance.controller;

import br.com.fiscalfinance.dao.TransactionDao;
import br.com.fiscalfinance.exception.EntityNotFoundException;
import br.com.fiscalfinance.factory.DaoFactory;
import br.com.fiscalfinance.model.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/transactions")
public class TransactionServlet extends HttpServlet {
    private TransactionDao dao;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "register":
                registerTransaction(req, resp);
                break;
            case "edit":
                editTransaction(req, resp);
            case "delete":
                deleteTransaction(req, resp);
                break;
        }
    }

    private void deleteTransaction(HttpServletRequest req, HttpServletResponse resp) {
        try {
            dao = DaoFactory.getTransactionDao();

            long id = Long.parseLong(req.getParameter("IdDelete"));
            dao.remove(id);
            req.setAttribute("message", "Transação deletada com sucesso!");
        } catch (SQLException | EntityNotFoundException error) {
            System.err.println(error.getMessage());
            req.setAttribute("message", "Erro ao deletar!");
        }

        try {
            listingTransactions(req, resp);
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void registerTransaction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            dao = DaoFactory.getTransactionDao();
            String name = req.getParameter("Nome");
            String type = req.getParameter("Tipo");
            double value = Double.parseDouble(req.getParameter("Valor"));
            String description = req.getParameter("Descrição");
            String createdAt =  DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDateTime.now());
            int foreignAccountId = 1;

            Transaction transaction = new Transaction(name, type, value, description, createdAt, foreignAccountId);

            dao.register(transaction);
            dao.closeConnection();
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        }

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    private void editTransaction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            dao = DaoFactory.getTransactionDao();
            long id = Long.parseLong(req.getParameter("Id"));
            String name = req.getParameter("Nome");
            String type = req.getParameter("Tipo");
            double value = Double.parseDouble(req.getParameter("Valor"));
            String description = req.getParameter("Descrição");

            Transaction transaction = new Transaction(id, name, type, value, description);

            dao.edit(transaction);
            dao.closeConnection();
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        }

        try {
            listingTransactions(req, resp);
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action  = req.getParameter("action");

            switch (action) {
                case "listing":
                    listingTransactions(req, resp);
                    break;
                case "open-edit-form":
                    openEditForm(req, resp);
                    break;
            }
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        } catch (EntityNotFoundException error) {
            throw new RuntimeException(error);
        }
    }

    private void openEditForm(HttpServletRequest req, HttpServletResponse resp) throws SQLException, EntityNotFoundException, ServletException, IOException {
        dao = DaoFactory.getTransactionDao();
        long id = Long.parseLong(req.getParameter("id"));
        Transaction transaction = dao.search(id);
        req.setAttribute("transaction", transaction);
        req.getRequestDispatcher("editar-transacao.jsp").forward(req, resp);
    }

    private void listingTransactions(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        dao = DaoFactory.getTransactionDao();
        List<Transaction> transactions = dao.listing();
        req.setAttribute("transactionsList", transactions);
        dao.closeConnection();
        req.getRequestDispatcher("transacoes.jsp").forward(req, resp);
    }
}
