package com.DAO;

import com.entity.BookOrder;
import java.util.List;

/**
 *
 * @author Nhat_Anh
 */
public interface BookOrderDAO {

    public int getOrderNo();
    
    public boolean saveOrder(List<BookOrder> blist);
    
    public List<BookOrder> getBook(String email);
}
