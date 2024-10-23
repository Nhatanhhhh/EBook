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
        <!-- Google Fonts Link For Icons  -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    </head>
    <body>
        <%
            Object userObj = session.getAttribute("userObj");
            InterfaceUser us = null; 
        
            if (userObj instanceof User) {
                us = (User) userObj;
            } else if (userObj instanceof GoogleUser) {
                us = (GoogleUser) userObj;
            }else if (userObj instanceof GitHubUser) {
                us = (GitHubUser) userObj;
            }else if (userObj instanceof InterfaceUser) {
                us = (InterfaceUser) userObj;
            }
        %>

        <%@include file="all_component/navbar.jsp" %>
        <link rel="stylesheet" href="custom_CSS/customStyle.css">
        <!-- Start Recent Book -->

        <div class="container mt-2">
            <h3 class="text-center" style="font-size: 40px ; background: linear-gradient(to right, #67B26F, #4CA2CD); -webkit-background-clip: text;
                color: transparent;"><i class="fa-regular fa-star"></i> Recent Book</h3>
            <div class="row">

                <%
                BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
                List<BookDtls> list1 = dao1.getAllRecentBook();
                for(BookDtls b : list1){
                %>
                <div class="col-md-3 min-width pt-5">
                    <div class="card crd-ho ">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhoto()%>" class="img-fluid" style="max-height: 100%; object-fit: contain;">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>

                                <%
                                       if(b.getBookCategory().equals("Old"))
                                {%>
                                Categories: <%=b.getBookCategory()%></p>

                            <div class="row flex-wrap text-center card-custom">
                                <a href="view_books.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm  ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm  ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                            </div>
                            <%
                            }else{
                            %>
                            Categories: <%=b.getBookCategory()%></p>
                            <div class="row flex-wrap text-center card-custom">

                                <%
                                if(us == null){
                                %>
                                <a href="login.jsp" class="btn btn-danger btn-sm  ml-2"><i class="fa-solid fa-cart-plus fa-fw"></i> Add Cart</a>
                                <%
                                }else{
                                %>
                                <a href="cart?bid=<%=b.getBookID()%>&&userid=<%=us.getUserID()%>" class="btn btn-danger btn-sm  ml-2"><i class="fa-solid fa-cart-plus fa-fw"></i> Add Cart</a>
                                <%
                                }
                                %>
                                <a href="view_books.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm  ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm  ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                            </div>
                            <%
                            }
                            %>
                        </div>
                    </div>
                </div>
                <%
                }
                %>

            </div>
        </div>

        <!-- End Recent Book -->

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

        <!-- End ChatBOT -->
        <script src="assets/script.js" defer></script>
    </body>
</html>
