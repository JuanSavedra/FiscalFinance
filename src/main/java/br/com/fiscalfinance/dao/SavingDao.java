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
    public double getTotalDeposits() throws SQLException {
        String sql = "SELECT SUM(sld_poupanca) as total FROM t_poupanca";
        double total = 0.0;

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            try(ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    total = rs.getDouble("total");
                }
            }
        }

        return total;
    }

    public void register(Saving saving) throws SQLException {
        String sql = "INSERT INTO t_poupanca (desc_poupanca, " +
                "sld_poupanca, criado_em, f_cnt_id_conta) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setString(1, saving.getDescription());
            stm.setDouble(2, saving.getValue());
            stm.setString(3, saving.getCreatedAt());
            stm.setLong(4, saving.getForeignKeyAccount());
            stm.executeUpdate();
        }
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

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setLong(1, id);

            try(ResultSet rs = stm.executeQuery()) {
                if (!rs.next())
                    throw new EntityNotFoundException("Depósito não encontrado.");

                return parseSaving(rs);
            }
        }
    }

    public List<Saving> listing() throws SQLException {
        List<Saving> deposits = new ArrayList<>();
        String sql = "SELECT * FROM t_poupanca ORDER BY id_poupanca ASC";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            try(ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    deposits.add(parseSaving(rs));
                }
            }
        }

        return deposits;
    }

    public void edit(Saving saving) throws SQLException {
        String sql = "UPDATE t_poupanca SET desc_poupanca = ?, " +
                "sld_poupanca = ? WHERE id_poupanca = ?";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setString(1, saving.getDescription());
            stm.setDouble(2, saving.getValue());
            stm.setLong(3, saving.getId());
            stm.executeUpdate();
        }
    }

    public void remove(long id) throws SQLException, EntityNotFoundException {
        String sql = "DELETE FROM t_poupanca WHERE id_poupanca = ?";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setLong(1, id);

            int line = stm.executeUpdate();
            if (line == 0) {
                throw new EntityNotFoundException("Depósito não encontrado para ser removido.");
            }
        }
    }
}
