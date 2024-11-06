/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user.servlet;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.BookOrder;
import com.entity.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author Nhat_Anh
 */
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Assuming `id` is retrieved as `userID` from the request
            int userID = Integer.parseInt(request.getParameter("id")); // Change parameter name if necessary

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String address = request.getParameter("address");
            String landmark = request.getParameter("landmark");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String paymentType = request.getParameter("payment");

            String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

            HttpSession session = request.getSession();

            CartDAOImpl cartDao = new CartDAOImpl(DBConnect.getConn());
            List<Cart> blist = cartDao.getBookByUser(userID);
            if (blist.isEmpty()) {
                session.setAttribute("failedMsg", "Add Item");
                response.sendRedirect("checkout.jsp");
            } else {
                BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DBConnect.getConn());

                ArrayList<BookOrder> orderList = new ArrayList<>();
                Random r = new Random();
                BookOrder o = null;

                for (Cart c : blist) {
                    o = new BookOrder();
                    o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
                    o.setUserName(name);
                    o.setEmail(email);
                    o.setPhno(phno);
                    o.setFulladd(fullAdd);
                    o.setBookName(c.getBookName());
                    o.setAuthor(c.getAuthor());
                    o.setPrice(c.getPrice() + "");
                    o.setPaymentType(paymentType);
                    o.setCartId(c.getCid());
                    o.setId(userID); // Set the UserID here

                    orderList.add(o);
                }

                if ("noselect".equals(paymentType)) {
                    session.setAttribute("failedMsg", "Choose Payment Method");
                    response.sendRedirect("checkout.jsp");
                } else {
                    boolean f = dao2.saveOrder(orderList);
                    if (f) {
                        System.out.println("Order placed successfully");
                    } else {
                        System.out.println("Order placement failed");
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
