package br.com.fiscalfinance.dao;

import br.com.fiscalfinance.exception.EntityNotFoundException;
import br.com.fiscalfinance.manager.ConnectionManager;
import br.com.fiscalfinance.model.Transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionDao {
    private Connection connection;

    public TransactionDao() throws SQLException {
        connection = ConnectionManager.getConnectionManager().getConnection();
    }

    public void register(Transaction transaction) throws SQLException {
        String sql = "INSERT INTO t_transacao (nm_transacao, " +
                "tp_transacao, vl_transacao, desc_transacao, criado_em, f_cnt_id_conta) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, transaction.getName());
        stm.setString(2, transaction.getType());
        stm.setDouble(3, transaction.getValue());
        stm.setString(4, transaction.getDescription());
        stm.setString(5, transaction.getCreatedAt());
        stm.setLong(6, transaction.getForeignKeyAccount());
        stm.executeUpdate();
    }

    public void closeConnection() throws SQLException {
        connection.close();
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

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setLong(1, id);
        ResultSet result = stm.executeQuery();

        if (!result.next())
            throw new EntityNotFoundException("Transação não encontrada.");

        return parseTransaction(result);
    }

    public List<Transaction> listing() throws SQLException {
        String sql = "SELECT * FROM t_transacao ORDER BY id_transacao ASC";

        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet result = stm.executeQuery();
        List<Transaction> transactions = new ArrayList<>();

        while (result.next()) {
            transactions.add(parseTransaction(result));
        }

        return transactions;
    }

    public void edit(Transaction transaction) throws SQLException {
        String sql = "UPDATE t_transacao SET nm_transacao = ?, " +
                "tp_transacao = ?, vl_transacao = ?, desc_transacao = ? WHERE id_transacao = ?";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, transaction.getName());
        stm.setString(2, transaction.getType());
        stm.setDouble(3, transaction.getValue());
        stm.setString(4, transaction.getDescription());
        stm.setLong(5, transaction.getId());
        stm.executeUpdate();
    }

    public void remove(long id) throws SQLException, EntityNotFoundException {
        String sql = "DELETE FROM t_transacao WHERE id_transacao = ?";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setLong(1, id);
    }
}
