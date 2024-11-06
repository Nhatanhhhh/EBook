<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.GoogleUser"%>
<%@page import="com.entity.GitHubUser"%>
<%@page import="com.entity.InterfaceUser"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Recent Book</title>
        <%@include file="all_component/allCss.jsp"%>
        <link rel="stylesheet" href="assets/style.css">
        <!-- Google Fonts Link For Icons -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    </head>
    <body>
        <%
            // Get the logged-in user from the session
            Object userObj = session.getAttribute("userObj");
            InterfaceUser us = (userObj instanceof InterfaceUser) ? (InterfaceUser) userObj : null;

            // Pagination parameters
            int currentPage = 1;
            int pageSize = 5; // Number of books per page
            if (request.getParameter("page") != null) {
                try {
                    currentPage = Integer.parseInt(request.getParameter("page"));
                    if (currentPage < 1) currentPage = 1;
                } catch (NumberFormatException e) {
                    currentPage = 1;
                }
            }

            // Fetch recent books data for the current page
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> recentBooksList = dao.getRecentBooksByPage(currentPage, pageSize); // Assuming you have this method in DAO
            int totalPages = dao.getTotalRecentBookPages(pageSize); // Total number of pages for recent books
        %>

        <%@include file="all_component/navbar.jsp" %>
        <link rel="stylesheet" href="custom_CSS/customStyle.css">

        <!-- Start Recent Book -->
        <div class="container mt-2">
            <h3 class="text-center" style="font-size: 40px; background: linear-gradient(to right, #67B26F, #4CA2CD); -webkit-background-clip: text; color: transparent;">
                <i class="fa-regular fa-star"></i> Recent Book
            </h3>
            <div class="row">
                <%
                    for (BookDtls b : recentBooksList) {
                %>
                <div class="col-md-3 min-width pt-5">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%= b.getPhoto() %>" class="img-fluid" style="max-height: 100%; object-fit: contain;">
                            <p><%= b.getBookName() %></p>
                            <p><%= b.getAuthor() %></p>
                            <p>Categories: <%= b.getBookCategory() %></p>
                            <div class="row flex-wrap text-center card-custom">
                                <%
                                    if ("Old".equals(b.getBookCategory())) {
                                %>
                                <a href="view_books.jsp?bid=<%= b.getBookID() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%= b.getPrice() %></a>
                                <%
                                    } else {
                                        if (us == null) {
                                %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus fa-fw"></i> Add Cart</a>
                                <%
                                        } else {
                                %>
                                <a href="cart?bid=<%= b.getBookID() %>&userid=<%= us.getUserID() %>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus fa-fw"></i> Add Cart</a>
                                <%
                                        }
                                %>
                                <a href="view_books.jsp?bid=<%= b.getBookID() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%= b.getPrice() %></a>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <!-- End Recent Book -->

        <!-- Pagination Section -->
        <nav aria-label="Page navigation example" class="mt-4 mb-2">
            <ul class="pagination justify-content-center">
                <li class="page-item <%= (currentPage == 1) ? "disabled" : "" %>">
                    <a class="page-link" href="?page=<%= currentPage - 1 %>">Previous</a>
                </li>
                <%
                    for (int i = 1; i <= totalPages; i++) {
                %>
                <li class="page-item <%= (currentPage == i) ? "active" : "" %>">
                    <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                </li>
                <%
                    }
                %>
                <li class="page-item <%= (currentPage == totalPages) ? "disabled" : "" %>">
                    <a class="page-link" href="?page=<%= currentPage + 1 %>">Next</a>
                </li>
            </ul>
        </nav>

        <!-- Start ChatBOT -->
        <div>
            <button class="chatbot-toggler">
                <span class="material-symbols-outlined">mode_comment</span>
                <span class="material-symbols-outlined">close</span>
            </button>
            <div class="chatbot">
                <header>
                    <h2>ChatBOT for Book 📚</h2>
                    <span class="close-btn material-symbols-outlined">close</span>
                </header>
                <ul class="chatbox">
                    <li class="chat incoming">
                        <span class="material-symbols-outlined">smart_toy</span>
                        <p>Hi there 👋 <br>How can I help you today?</p>
                    </li>
                </ul>
                <div class="chat-input">
                    <textarea placeholder="Enter a message..." required></textarea>
                    <span id="send-btn" class="material-symbols-outlined">send</span>
                </div>
            </div>
        </div>
        <!-- End ChatBOT -->
        
        <%@include file="all_component/footer.jsp" %>
        <script src="assets/script.js" defer></script>
    </body>
</html>
