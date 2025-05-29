package br.com.fiscalfinance.dao;

import br.com.fiscalfinance.exception.EntityNotFoundException;
import br.com.fiscalfinance.manager.ConnectionManager;
import br.com.fiscalfinance.model.Saving;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SavingDao {
    private Connection connection;

    public SavingDao() throws SQLException {
        connection = ConnectionManager.getConnectionManager().getConnection();
    }

    public void register(Saving saving) throws SQLException {
        String sql = "INSERT INTO t_poupanca (desc_poupanca, " +
                "sld_poupanca, criado_em, f_cnt_id_conta) " +
                "VALUES (?, ?, ?, ?)";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, saving.getDescription());
        stm.setDouble(2, saving.getValue());
        stm.setString(3, saving.getCreatedAt());
        stm.setLong(4, saving.getForeignKeyAccount());
        stm.executeUpdate();
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }

    public Saving parseSaving(ResultSet result) throws SQLException {
        long id = result.getLong("id_poupanca");
        String savingDescription = result.getString("desc_poupanca");
        double savingValue = result.getDouble("sld_poupanca");
        String createdAt = result.getString("criado_em");
        long foreignKeyAccount = result.getLong("f_cnt_id_conta");

        return new Saving(id, savingDescription, savingValue, createdAt,
                foreignKeyAccount);
    }

    public Saving search(long id) throws SQLException, EntityNotFoundException {
        String sql = "SELECT * FROM t_poupanca WHERE id_poupanca = ?";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setLong(1, id);
        ResultSet result = stm.executeQuery();

        if (!result.next())
            throw new EntityNotFoundException("Depósito não encontrado.");

        return parseSaving(result);
    }

    public List<Saving> listing() throws SQLException {
        String sql = "SELECT * FROM t_poupanca ORDER BY id_poupanca ASC";

        PreparedStatement stm = connection.prepareStatement(sql);
        ResultSet result = stm.executeQuery();
        List<Saving> deposits = new ArrayList<>();

        while (result.next()) {
            deposits.add(parseSaving(result));
        }

        return deposits;
    }

    public void edit(Saving saving) throws SQLException {
        String sql = "UPDATE t_poupanca SET desc_poupanca = ?, " +
                "sld_poupanca = ? WHERE id_poupanca = ?";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, saving.getDescription());
        stm.setDouble(2, saving.getValue());
        stm.setLong(3, saving.getId());
        stm.executeUpdate();
    }

    public void remove(long id) throws SQLException, EntityNotFoundException {
        String sql = "DELETE FROM t_poupanca WHERE id_poupanca = ?";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setLong(1, id);

        int line = stm.executeUpdate();
        if (line == 0) {
            throw new EntityNotFoundException("Depósito não encontrado para ser removido.");
        }
    }
}
