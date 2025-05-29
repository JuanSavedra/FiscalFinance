package br.com.fiscalfinance.model;

public class Transaction {
    private long id;
    private String name;
    private String type;
    private String description;
    private double value;
    private String createdAt;
    private long foreignKeyAccount;

    public Transaction(long id, String name, String type, double value, String description, String createdAt,
                       long foreignKeyAccount) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.value = value;
        this.description = description;
        this.createdAt = createdAt;
        this.foreignKeyAccount = foreignKeyAccount;
    }

    public Transaction(long id, String name, String type, double value, String description) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.value = value;
        this.description = description;
    }

    public Transaction(String name, String type, double value, String description, String createdAt,
                       long foreignKeyAccount) {
        this.name = name;
        this.type = type;
        this.value = value;
        this.description = description;
        this.createdAt = createdAt;
        this.foreignKeyAccount = foreignKeyAccount;
    }


    public Transaction() {}

    public Long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
