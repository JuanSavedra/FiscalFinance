package br.com.fiscalfinance.dao;

import br.com.fiscalfinance.exception.EntityNotFoundException;
import br.com.fiscalfinance.manager.ConnectionManager;
import br.com.fiscalfinance.model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDao {
    public boolean validateAccount(Account account) throws SQLException {
        String sql = "SELECT * FROM t_conta WHERE email_conta = ? AND hs_senha_conta = ?";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setString(1, account.getEmail());
            stm.setString(2, account.getPassword());

            try (ResultSet rs = stm.executeQuery()) {
                return rs.next();
            }
        }
    }

    public void register(Account account) throws SQLException {
        String sql = "INSERT INTO t_conta (nm_conta, email_conta, hs_senha_conta) " +
                "VALUES (?, ?, ?)";

        try (Connection conn = ConnectionManager.getConnectionManager().getConnection();
             PreparedStatement stm = conn.prepareStatement(sql))
        {
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getEmail());
            stm.setString(3, account.getPassword());
            stm.executeUpdate();
        }
    }
}
