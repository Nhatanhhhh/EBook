package com.DAO;

import com.entity.BookDtls;
import java.util.List;

/**
 *
 * @author Nhat_Anh
 */
public interface BookDAO {
    
    public boolean addBooks(BookDtls b);
    
    public List<BookDtls> getAllBooks();
    
    public BookDtls getBookByID(int id);
    
    public boolean updateEditBooks(BookDtls b);
    
    public boolean deleteBooks(int id);
    
    public List<BookDtls> getNewBooks();
    
    public List<BookDtls> getRecentBooks();
    
    public List<BookDtls> getOldBooks();
    
    public List<BookDtls> getAllRecentBook();
    
    public List<BookDtls> getAllNewBook();
    
    public List<BookDtls> getAllOldBook();
}
