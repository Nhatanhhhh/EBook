package com.entity;

public class GoogleUser implements InterfaceUser{

    private String googleID;
    private int userID;
    private String authToken;
    private String GGEmail;
    private String GGName;
    private String password;
    private String Phno;
    private String Address;
    private String Landmark;
    private String City;
    private String State;
    private String Pincode;

    public GoogleUser() {
    }

    public GoogleUser(String googleID, Integer userID, String authToken, String GGEmail, String GGName, String password, String Phno, String Address, String Landmark, String City, String State, String Pincode) {
        this.googleID = googleID;
        this.userID = userID;
        this.authToken = authToken;
        this.GGEmail = GGEmail;
        this.GGName = GGName;
        this.password = password;
        this.Phno = Phno;
        this.Address = Address;
        this.Landmark = Landmark;
        this.City = City;
        this.State = State;
        this.Pincode = Pincode;
    }

    public String getGoogleID() {
        return googleID;
    }

    public void setGoogleID(String googleID) {
        this.googleID = googleID;
    }

    @Override
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getAuthToken() {
        return authToken;
    }

    public void setAuthToken(String authToken) {
        this.authToken = authToken;
    }

    public String getGGEmail() {
        return GGEmail;
    }

    public void setGGEmail(String GGEmail) {
        this.GGEmail = GGEmail;
    }

    public String getGGName() {
        return GGName;
    }

    public void setGGName(String GGName) {
        this.GGName = GGName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
    public String getName() {
        return GGName;
    }

    @Override
    public String getEmail() {
        return GGEmail;
    }

    @Override
    public String toString() {
        return "GoogleUser{" + "googleID=" + googleID + ", userID=" + userID + ", authToken=" + authToken + ", GGEmail=" + GGEmail + ", GGName=" + GGName + ", password=" + password + ", Phno=" + Phno + ", Address=" + Address + ", Landmark=" + Landmark + ", City=" + City + ", State=" + State + ", Pincode=" + Pincode + '}';
    }

}
