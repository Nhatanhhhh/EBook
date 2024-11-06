<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Old Book</title>
        <%@include file="all_component/allCss.jsp"%>
        <link rel="stylesheet" href="assets/style.css">
        <!-- Google Fonts Link For Icons  -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <link rel="stylesheet" href="custom_CSS/customStyle.css">

        <%
            // Pagination logic
            int currentPage = 1;
            int pageSize = 20; // Set the number of books per page
            if (request.getParameter("page") != null) {
                try {
                    currentPage = Integer.parseInt(request.getParameter("page"));
                    if (currentPage < 1) currentPage = 1;
                } catch (NumberFormatException e) {
                    currentPage = 1;
                }
            }

            // Fetch old books data with pagination
            BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list3 = dao3.getOldBooksByPage(currentPage, pageSize);
            int totalPages = dao3.getTotalOldBookPages(pageSize);
        %>

        <!-- Start Old Book -->
        <div class="container  mt-2">
            <h3 class="text-center" style="font-size: 40px; background: linear-gradient(to right, #9CECFB, #65C7F7, #0052D4); -webkit-background-clip: text;
                color: transparent;"><i class="fa-solid fa-lightbulb"></i> Old Book</h3>
            <div class="row">
                <%
                    for (BookDtls b : list3) {
                %>
                <div class="col-md-3 min-width pt-5">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%= b.getPhoto() %>" class="img-fluid" style="max-height: 100%; object-fit: contain;">
                            <p><%= b.getBookName() %></p>
                            <p><%= b.getAuthor() %></p>
                            <p>Categories: <%= b.getBookCategory() %></p>
                            <div class="row flex-wrap text-center card-custom">
                                <a href="view_books.jsp?bid=<%= b.getBookID() %>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-dollar-sign"></i> <%= b.getPrice() %></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <!-- End Old Book -->

        <!-- Pagination Section -->
        <nav aria-label="Page navigation example" class="pt-5 pb-3">
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

        <!-- ChatBOT -->
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

        <%@include file="all_component/footer.jsp" %>
        <script src="assets/script.js" defer></script>
    </body>
</html>
