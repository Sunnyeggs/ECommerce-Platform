package servlets;

import java.sql.Timestamp;

public class Transaction {
    private int transactionId;
    private int itemId;
    private String title;
    private int buyerId;
    private int sellerId;
    private double salePrice;
    private Timestamp transactionDate;

    // Constructor
    public Transaction(int transactionId, int itemId, String title, int buyerId, int sellerId, double salePrice, Timestamp transactionDate) {
        this.transactionId = transactionId;
        this.itemId = itemId;
        this.title = title;
        this.buyerId = buyerId;
        this.sellerId = sellerId;
        this.salePrice = salePrice;
        this.transactionDate = transactionDate;
    }

    // Getters and Setters
    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public Timestamp getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Timestamp transactionDate) {
        this.transactionDate = transactionDate;
    }
}
