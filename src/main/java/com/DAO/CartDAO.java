package com.DAO;

import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

/**
 *
 * @author Nhat_Anh
 */
public interface CartDAO {
    
    public boolean addCart(Cart c);
    
    public List<Cart> getBookByUser(int userID);
    
}
