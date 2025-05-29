package br.com.fiscalfinance.model;

public class Saving {
    private long id;
    private String description;
    private double value;
    private String createdAt;
    private long foreignKeyAccount;

    public Saving(long id, String description, double value,
                  String createdAt, long foreignKeyAccount) {
        this.id = id;
        this.description = description;
        this.value = value;
        this.createdAt = createdAt;
        this.foreignKeyAccount = foreignKeyAccount;
    }

    public Saving(long id, String description, double value) {
        this.id = id;
        this.description = description;
        this.value = value;
    }

    public Saving(String description, double value,
                  String createdAt, long foreignKeyAccount) {
        this.description = description;
        this.value = value;
        this.createdAt = createdAt;
        this.foreignKeyAccount = foreignKeyAccount;
    }

    public Saving() {}

    public Long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public long getForeignKeyAccount() {
        return foreignKeyAccount;
    }

    public void setForeignKeyAccount(long foreignKeyAccount) {
        this.foreignKeyAccount = foreignKeyAccount;
    }
}
