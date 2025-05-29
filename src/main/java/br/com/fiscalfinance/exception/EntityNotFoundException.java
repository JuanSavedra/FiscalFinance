package br.com.fiscalfinance.exception;

public class EntityNotFoundException extends Exception {
    public EntityNotFoundException() {}

    public EntityNotFoundException(String message) { super(message); }
}
