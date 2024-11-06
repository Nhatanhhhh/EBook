/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.BookOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nhat_Anh
 */
public class BookOrderDAOImpl implements BookOrderDAO {

    private Connection conn;

    public BookOrderDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public int getOrderNo() {
        int i = 1;
        try {

            String sql = "SELECT * FROM [dbo].[BookOrder]";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public boolean saveOrder(List<BookOrder> blist) {
        boolean f = false;

        try {
            String sql = "INSERT INTO [dbo].[BookOrder]([OrderID], [UserID], [UserName], [UserEmail], [Address], [PhoneNo], [BookName], [Author], [Price], [Payment], [CartID]) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);

            for (BookOrder b : blist) {
                ps.setString(1, b.getOrderId());
                ps.setInt(2, b.getId());
                ps.setString(3, b.getUserName());
                ps.setString(4, b.getEmail());
                ps.setString(5, b.getFulladd());
                ps.setString(6, b.getPhno());
                ps.setString(7, b.getBookName());
                ps.setString(8, b.getAuthor());
                ps.setString(9, b.getPrice());
                ps.setString(10, b.getPaymentType());
                ps.setInt(11, b.getCartId());
                ps.addBatch();
            }

            ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);

        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
        }

        return f;
    }

    @Override
    public List<BookOrder> getBook(String email){
        List<BookOrder> list = new ArrayList<BookOrder>();
        BookOrder o = null;
        try {
            String sql = "SELECT * FROM [dbo].[BookOrder] WHERE [UserEmail] = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                o = new BookOrder();
                o.setId(0);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
