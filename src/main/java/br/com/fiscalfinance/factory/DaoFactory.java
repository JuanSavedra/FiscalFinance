package br.com.fiscalfinance.factory;

import br.com.fiscalfinance.dao.AccountDao;
import br.com.fiscalfinance.dao.SavingDao;
import br.com.fiscalfinance.dao.TransactionDao;

import java.sql.SQLException;

public class DaoFactory {
    public static AccountDao getAccountDao() throws SQLException {
        return new AccountDao();
    }

    public static TransactionDao getTransactionDao() throws SQLException {
        return new TransactionDao();
    }

    public static SavingDao getSavingDao() throws SQLException {
        return new SavingDao();
    }
}
