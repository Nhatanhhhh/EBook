/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet("/book-list")
public class BookController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private BookDAOImpl bookDAO;

    public void init() {
        bookDAO = new BookDAOImpl(DBConnect.getConn());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");
        String searchName = request.getParameter("searchName");
        String pageStr = request.getParameter("page");
        int page = 1;
        int recordsPerPage = 8;

        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        List<BookDtls> list = bookDAO.getBooksByCategoryAndName(category, searchName, (page - 1) * recordsPerPage, recordsPerPage);
        int noOfRecords = bookDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("bookList", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("category", category);
        request.setAttribute("searchName", searchName);

        RequestDispatcher dispatcher = request.getRequestDispatcher("book-list.jsp");
        dispatcher.forward(request, response);
    }

}
