/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nhat_Anh
 */
public class DBConnect {

    private static Connection conn; 
    
    public static Connection getConn() {
        if (conn == null) { 
            try {
                String user = "nhatanh";  
                String pass = "123";     
                String url = "jdbc:sqlserver://localhost:1433;databaseName=EbookApp;encrypt=false";  

                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(url, user, pass);  

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return conn;
    }
}
