package br.com.fiscalfinance.model;

import br.com.fiscalfinance.util.EncryptionUtils;

public class Account {
    private long id;
    private String username;
    private String email;
    private String password;

    public Account(long id, String username, String email, String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        setPassword(password);
    }

    public Account(String username, String email, String password) {
        this.username = username;
        this.email = email;
        setPassword(password);
    }

    public Account(String email, String password) {
        this.email = email;
        setPassword(password);
    }

    public Account() {}

    public Long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        try {
            this.password = EncryptionUtils.encryption(password);
        } catch (Exception error) {
            error.printStackTrace();
        }
    }
}
