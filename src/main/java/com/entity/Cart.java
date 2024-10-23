/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Nhat_Anh
 */
public class Cart {

    private int cid;
    private int bid;
    private int userid;
    private String bookName;
    private String author;
    private double price;
    private double totalPrice;

    public Cart() {
    }

    public Cart(int cid, int bid, int userid, String bookName, String author, double price, double totalPrice) {
        this.cid = cid;
        this.bid = bid;
        this.userid = userid;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Cart{" + "cid=" + cid + ", bid=" + bid + ", userid=" + userid + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", totalPrice=" + totalPrice + '}';
    }

}
