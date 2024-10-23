/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Nhat_Anh
 */
public class GitHubUser implements InterfaceUser {

    private String gitHubID;
    private int userID;
    private String authToken;
    private String GHEmail;
    private String GHName;
    private String password;
    private String Phno;
    private String Address;
    private String Landmark;
    private String City;
    private String State;
    private String Pincode;

    public GitHubUser() {
    }

    public GitHubUser(String gitHubID, Integer userID, String authToken, String GHEmail, String GHName, String password, String Phno, String Address, String Landmark, String City, String State, String Pincode) {
        this.gitHubID = gitHubID;
        this.userID = userID;
        this.authToken = authToken;
        this.GHEmail = GHEmail;
        this.GHName = GHName;
        this.password = password;
        this.Phno = Phno;
        this.Address = Address;
        this.Landmark = Landmark;
        this.City = City;
        this.State = State;
        this.Pincode = Pincode;
    }

    public String getGithubID() {
        return gitHubID;
    }

    public void setGithubID(String githubID) {
        this.gitHubID = githubID;
    }

    @Override
    public int getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getAuthToken() {
        return authToken;
    }

    public void setAuthToken(String authToken) {
        this.authToken = authToken;
    }

    public String getGHEmail() {
        return GHEmail;
    }

    public void setGHEmail(String GHEmail) {
        this.GHEmail = GHEmail;
    }

    public String getGHName() {
        return GHName;
    }

    public void setGHName(String GHName) {
        this.GHName = GHName;
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
        return GHName;
    }

    @Override
    public String getEmail() {
        return GHEmail;
    }

    @Override
    public String toString() {
        return "GitHubUser{" + "gitHubID=" + gitHubID + ", userID=" + userID + ", authToken=" + authToken + ", GHEmail=" + GHEmail + ", GHName=" + GHName + ", password=" + password + ", Phno=" + Phno + ", Address=" + Address + ", Landmark=" + Landmark + ", City=" + City + ", State=" + State + ", Pincode=" + Pincode + '}';
    }

}
