/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Nhat_Anh
 */
public class BookOrder {

    private int id;
    private String orderId;
    private String userName;
    private String email;
    private String phno;
    private String fulladd;
    private String paymentType;
    private String bookName;
    private String author;
    private String price;
    private int cartId;

    public BookOrder() {
    }

    public BookOrder(int id, String orderId, String userName, String email, String phno, String fulladd, String paymentType, String bookName, String author, String price) {
        this.id = id;
        this.orderId = orderId;
        this.userName = userName;
        this.email = email;
        this.phno = phno;
        this.fulladd = fulladd;
        this.paymentType = paymentType;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getFulladd() {
        return fulladd;
    }

    public void setFulladd(String fulladd) {
        this.fulladd = fulladd;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getBookName() {
        return bookName;
    }

    @Override
    public String toString() {
        return "BookOrder{" + "id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email + ", phno=" + phno + ", fulladd=" + fulladd + ", paymentType=" + paymentType + ", bookName=" + bookName + ", author=" + author + ", price=" + price + '}';
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

}
