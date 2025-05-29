package br.com.fiscalfinance.controller;

import br.com.fiscalfinance.dao.SavingDao;
import br.com.fiscalfinance.exception.EntityNotFoundException;
import br.com.fiscalfinance.factory.DaoFactory;
import br.com.fiscalfinance.model.Saving;
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

@WebServlet("/deposits")
public class SavingServlet extends HttpServlet {
    private SavingDao dao;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "register":
                registerDeposit(req, resp);
                break;
            case "edit":
                editDeposit(req, resp);
                break;
        }
    }

    private void registerDeposit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            dao = DaoFactory.getSavingDao();

            String description = req.getParameter("Descrição");
            double value = Double.parseDouble(req.getParameter("Valor"));
            String createdAt = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDateTime.now());
            int foreignAccountId = 1;

            Saving saving = new Saving(description, value, createdAt, foreignAccountId);

            dao.register(saving);
            dao.closeConnection();
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        }

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    private void editDeposit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            dao = DaoFactory.getSavingDao();

            long id = Long.parseLong(req.getParameter("Id"));
            String description = req.getParameter("Descrição");
            double value = Double.parseDouble(req.getParameter("Valor"));

            Saving saving = new Saving(id, description, value);

            dao.edit(saving);
            dao.closeConnection();
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        }

        try {
            listingDeposits(req, resp);
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");

            switch (action) {
                case "listing":
                    listingDeposits(req, resp);
                    break;
                case "open-edit-form":
                    openEditForm(req, resp);
                    break;
            }
        } catch (SQLException error) {
            System.err.println(error.getMessage());
        } catch (EntityNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void openEditForm(HttpServletRequest req, HttpServletResponse resp) throws SQLException, EntityNotFoundException, ServletException, IOException {
        dao = DaoFactory.getSavingDao();
        long id = Long.parseLong(req.getParameter("id"));
        Saving saving = dao.search(id);
        req.setAttribute("deposit", saving);
        req.getRequestDispatcher("editar-poupanca.jsp").forward(req, resp);
    }

    private void listingDeposits(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        dao = DaoFactory.getSavingDao();
        List<Saving> savings = dao.listing();
        req.setAttribute("depositsList", savings);
        dao.closeConnection();
        req.getRequestDispatcher("poupanca.jsp").forward(req, resp);
    }
}
