package com.example.stock.entity;

import jakarta.persistence.*;

@Entity
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private double totalPrice;
    private double totalPriceWithGst;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public double getTotalPriceWithGst() { return totalPriceWithGst; }
    public void setTotalPriceWithGst(double totalPriceWithGst) { this.totalPriceWithGst = totalPriceWithGst; }
}
