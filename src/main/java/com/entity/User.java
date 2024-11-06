/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Nhat_Anh
 */
public class User implements InterfaceUser {

    private int userID;
    private String Name;
    private String Email;
    private String Password;
    private String Phno;
    private String Address;
    private String Landmark;
    private String City;
    private String State;
    private String Pincode;

    public User() {
        super();

    }

    @Override
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    @Override
    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    @Override
    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    @Override
    public String getPhno() {
        return Phno;
    }

    public void setPhno(String Phno) {
        this.Phno = Phno;
    }

    @Override
    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getLandmark() {
        return Landmark;
    }

    public void setLandmark(String Landmark) {
        this.Landmark = Landmark;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getState() {
        return State;
    }

    public void setState(String State) {
        this.State = State;
    }

    public String getPincode() {
        return Pincode;
    }

    public void setPincode(String Pincode) {
        this.Pincode = Pincode;
    }

    @Override
    public String getZip() {
        return Pincode;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + userID + ", Name=" + Name + ", Email=" + Email + ", Password=" + Password + ", Phno=" + Phno + ", Address=" + Address + ", Landmark=" + Landmark + ", City=" + City + ", State=" + State + ", Pincode=" + Pincode + '}';
    }

}
