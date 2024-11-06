package com.DAO;

import com.entity.BookDtls;
import java.util.ArrayList;
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

    public List<BookDtls> getNewBooksByPage(int page, int pageSize);

    public int getTotalNewBookPages(int pageSize);
    
    public List<BookDtls> getOldBooksByPage(int page, int pageSize);
    
    public int getTotalOldBookPages(int pageSize);
    
    public List<BookDtls> getRecentBooksByPage(int page, int pageSize) ;
    
    public int getTotalRecentBookPages(int pageSize);
    
    public List<BookDtls> getBookByOld(String email, String cate);
    
    public boolean oldBookDelete(String email, String cate, int id);
}
