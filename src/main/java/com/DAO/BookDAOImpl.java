package com.DAO;

import com.DB.DBConnect;
import com.entity.BookDtls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nhat_Anh
 */
public class BookDAOImpl implements BookDAO {

    private Connection conn;

    public BookDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean addBooks(BookDtls b) {
        boolean f = false;
        try {
            String sql = "INSERT INTO [dbo].[BookDTLS](BookName, Author, Price, BookCategory, Status, Photo, UserEmail) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhoto());
            ps.setString(7, b.getUserEmail());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<BookDtls> getAllBooks() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;

        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS]";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public BookDtls getBookByID(int id) {

        BookDtls b = null;

        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [BookID]=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean updateEditBooks(BookDtls b) {
        boolean f = false;

        try {
            String sql = "UPDATE [dbo].[BookDTLS] SET [BookName]=?,[Author]=?,[Price]=?,[Status]=? WHERE [BookID]=?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookID());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean deleteBooks(int id) {
        boolean f = false;
        try {
            String sql = "DELETE FROM [dbo].[BookDTLS] WHERE [BookID]=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<BookDtls> getNewBooks() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [BookCategory]=? AND [Status]=? ORDER BY [BookID] DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getRecentBooks() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [Status]=? ORDER BY [BookID] DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getOldBooks() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [BookCategory]=? AND [Status]=? ORDER BY [BookID] DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getAllRecentBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [Status]=? ORDER BY [BookID] DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getAllNewBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [BookCategory]=? AND [Status]=? ORDER BY [BookID] DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getAllOldBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [BookCategory]=? AND [Status]=? ORDER BY [BookID] DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<BookDtls> getNewBooksByPage(int page, int pageSize) {
        List<BookDtls> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [BookCategory] = ? AND [Status] = ? ORDER BY [BookID] DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ps.setInt(3, offset);
            ps.setInt(4, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDtls book = new BookDtls();
                book.setBookID(rs.getInt("BookID"));
                book.setBookName(rs.getString("BookName"));
                book.setAuthor(rs.getString("Author"));
                book.setPrice(rs.getString("Price"));
                book.setBookCategory(rs.getString("BookCategory"));
                book.setStatus(rs.getString("Status"));
                book.setPhoto(rs.getString("Photo"));
                book.setUserEmail(rs.getString("UserEmail"));
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalNewBookPages(int pageSize) {
        int totalPages = 0;
        String sql = "SELECT COUNT(*) FROM [dbo].[BookDTLS] WHERE [BookCategory] = ? AND [Status] = ?";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalBooks = rs.getInt(1);
                totalPages = (int) Math.ceil(totalBooks / (double) pageSize);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPages;
    }

    public List<BookDtls> getRecentBooksByPage(int page, int pageSize) {
        List<BookDtls> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [Status] = ? ORDER BY [BookID] DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "Active");
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDtls book = new BookDtls();
                book.setBookID(rs.getInt("BookID"));
                book.setBookName(rs.getString("BookName"));
                book.setAuthor(rs.getString("Author"));
                book.setPrice(rs.getString("Price"));
                book.setBookCategory(rs.getString("BookCategory"));
                book.setStatus(rs.getString("Status"));
                book.setPhoto(rs.getString("Photo"));
                book.setUserEmail(rs.getString("UserEmail"));
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalRecentBookPages(int pageSize) {
        int totalPages = 0;
        String sql = "SELECT COUNT(*) FROM [dbo].[BookDTLS] WHERE [Status] = ?";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalBooks = rs.getInt(1);
                totalPages = (int) Math.ceil(totalBooks / (double) pageSize);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPages;
    }

    public List<BookDtls> getOldBooksByPage(int page, int pageSize) {
        List<BookDtls> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [BookCategory] = ? AND [Status] = ? ORDER BY [BookID] DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ps.setInt(3, offset);
            ps.setInt(4, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDtls book = new BookDtls();
                book.setBookID(rs.getInt("BookID"));
                book.setBookName(rs.getString("BookName"));
                book.setAuthor(rs.getString("Author"));
                book.setPrice(rs.getString("Price"));
                book.setBookCategory(rs.getString("BookCategory"));
                book.setStatus(rs.getString("Status"));
                book.setPhoto(rs.getString("Photo"));
                book.setUserEmail(rs.getString("UserEmail"));
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getTotalOldBookPages(int pageSize) {
        int totalPages = 0;
        String sql = "SELECT COUNT(*) FROM [dbo].[BookDTLS] WHERE [BookCategory] = ? AND [Status] = ?";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalBooks = rs.getInt(1);
                totalPages = (int) Math.ceil(totalBooks / (double) pageSize);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPages;
    }

    @Override
    public List<BookDtls> getBookByOld(String email, String cate) {
        List<BookDtls> list = new ArrayList<>();
        BookDtls b = null;

        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE [BookCategory] = ? AND [UserEmail] = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cate);
            ps.setString(2, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUserEmail(rs.getString(8));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean oldBookDelete(String email, String cate, int id) {
        boolean f = false;
        try {
            String sql = "DELETE FROM [dbo].[BookDTLS] WHERE [BookCategory] = ? AND [UserEmail] = ? AND [BookID] = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cate);
            ps.setString(2, email);
            ps.setInt(3, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public List<BookDtls> getBooksByCategoryAndName(String category, String searchName, int offset, int noOfRecords) {
        List<BookDtls> list = new ArrayList<>();
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM [dbo].[BookDTLS] WHERE 1=1 ";

            if (category != null && !category.trim().isEmpty()) {
                if ("Old".equalsIgnoreCase(category)) {
                    sql += "AND BookCategory = 'Old' ";
                } else if ("New".equalsIgnoreCase(category)) {
                    sql += "AND BookCategory = 'New' ";
                } else if ("Recent".equalsIgnoreCase(category)) {
                    sql += "AND BookCategory = 'Recent' ";
                }
            }

            if (searchName != null && !searchName.trim().isEmpty()) {
                sql += "AND bookName LIKE ? ";
            }

            sql += "ORDER BY BookID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = conn.prepareStatement(sql);
            int index = 1;

            if (searchName != null && !searchName.trim().isEmpty()) {
                ps.setString(index++, "%" + searchName + "%");
            }

            ps.setInt(index++, offset);
            ps.setInt(index++, noOfRecords);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookID(rs.getInt("BookID"));
                b.setBookName(rs.getString("BookName"));
                b.setAuthor(rs.getString("Author"));
                b.setPrice(rs.getString("Price"));
                b.setBookCategory(rs.getString("BookCategory"));
                b.setStatus(rs.getString("Status"));
                b.setPhoto(rs.getString("Photo"));
                b.setUserEmail(rs.getString("UserEmail"));
                list.add(b);
            }

            String countSql = "SELECT COUNT(*) FROM [dbo].[BookDTLS] WHERE 1=1 ";
            if (category != null && !category.trim().isEmpty()) {
                if ("Old".equalsIgnoreCase(category)) {
                    countSql += "AND BookCategory = 'Old' ";
                } else if ("New".equalsIgnoreCase(category)) {
                    countSql += "AND BookCategory = 'New' ";
                } else if ("Recent".equalsIgnoreCase(category)) {
                    countSql += "AND BookCategory = 'Recent' ";
                }
            }
            if (searchName != null && !searchName.trim().isEmpty()) {
                countSql += "AND bookName LIKE ? ";
            }

            ps = conn.prepareStatement(countSql);
            index = 1;
            if (searchName != null && !searchName.trim().isEmpty()) {
                ps.setString(index++, "%" + searchName + "%");
            }

            rs = ps.executeQuery();
            if (rs.next()) {
                this.noOfRecords = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    private int noOfRecords;

    public int getNoOfRecords() {
        return noOfRecords;
    }
}
