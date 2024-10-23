package com.entity;

/**
 *
 * @author Nhat_Anh
 */
public class BookDtls {

    private int bookID;
    private String bookName;
    private String author;
    private String price;
    private String bookCategory;
    private String status;
    private String photo;
    private String userEmail;

    public BookDtls() {
        super();
    }

    public BookDtls(String bookName, String author, String price, String bookCategory, String status, String photo, String userEmail) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.status = status;
        this.photo = photo;
        this.userEmail = userEmail;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String UserEmail) {
        this.userEmail = UserEmail;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    @Override
    public String toString() {
        return "BookDtls{" + "BookName=" + bookName + ", Author=" + author + ", Price=" + price + ", BookCategory=" + bookCategory + ", Status=" + status + ", Photo=" + photo + ", UserEmail=" + userEmail + '}';
    }

}
