package br.com.fiscalfinance.dao;

import br.com.fiscalfinance.exception.EntityNotFoundException;
import br.com.fiscalfinance.manager.ConnectionManager;
import br.com.fiscalfinance.model.Transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TransactionDao {
    public Map<String, Double> getTotalsByType() throws SQLException {
        Map<String, Double> totals = new HashMap<>();
        String sql = "SELECT tp_transacao, SUM(vl_transacao) as total FROM t_transacao GROUP BY tp_transacao";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            try (ResultSet result = stm.executeQuery()) {
                while (result.next()) {
                    String transactionType = result.getString("tp_transacao");
                    double totalValue = result.getDouble("total");
                    totals.put(transactionType, totalValue);
                }
            }
        }

        return totals;
    }

    public void register(Transaction transaction) throws SQLException {
        String sql = "INSERT INTO t_transacao (nm_transacao, " +
                "tp_transacao, vl_transacao, desc_transacao, criado_em, f_cnt_id_conta) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setString(1, transaction.getName());
            stm.setString(2, transaction.getType());
            stm.setDouble(3, transaction.getValue());
            stm.setString(4, transaction.getDescription());
            stm.setString(5, transaction.getCreatedAt());
            stm.setLong(6, transaction.getForeignKeyAccount());
            stm.executeUpdate();
        }
    }

    public Transaction parseTransaction(ResultSet result) throws SQLException {
        long id = result.getLong("id_transacao");
        String transactionName = result.getString("nm_transacao");
        String transactionType = result.getString("tp_transacao");
        double transactionValue = result.getDouble("vl_transacao");
        String transactionDescription = result.getString("desc_transacao");
        String createdAt = result.getString("criado_em");
        long foreignKeyAccount = result.getLong("f_cnt_id_conta");

        return new Transaction(id, transactionName, transactionType, transactionValue, transactionDescription,
                createdAt, foreignKeyAccount);
    }

    public Transaction search(long id) throws SQLException, EntityNotFoundException {
        String sql = "SELECT * FROM t_transacao WHERE id_transacao = ?";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setLong(1, id);
            try (ResultSet rs = stm.executeQuery()) {
                if (!rs.next())
                    throw new EntityNotFoundException("Transação não encontrada.");

                return parseTransaction(rs);
            }
        }
    }

    public List<Transaction> listing() throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM t_transacao ORDER BY id_transacao ASC";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            try(ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    transactions.add(parseTransaction(rs));
                }
            }
        }

        return transactions;
    }

    public void edit(Transaction transaction) throws SQLException {
        String sql = "UPDATE t_transacao SET nm_transacao = ?, " +
                "tp_transacao = ?, vl_transacao = ?, desc_transacao = ? WHERE id_transacao = ?";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setString(1, transaction.getName());
            stm.setString(2, transaction.getType());
            stm.setDouble(3, transaction.getValue());
            stm.setString(4, transaction.getDescription());
            stm.setLong(5, transaction.getId());
            stm.executeUpdate();
        }
    }

    public void remove(long id) throws SQLException, EntityNotFoundException {
        String sql = "DELETE FROM t_transacao WHERE id_transacao = ?";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setLong(1, id);
            int line = stm.executeUpdate();

            if (line == 0) {
                throw new EntityNotFoundException("Transação não encontrada para ser removido.");
            }
        }
    }
}
