<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.GoogleUser"%>
<%@page import="com.entity.GitHubUser"%>
<%@page import="com.entity.InterfaceUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Book</title>
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

        <% 
        int bid = Integer.parseInt(request.getParameter("bid"));
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        BookDtls b = dao.getBookByID(bid);

        %>

        <div class="container mt-5" style="background: white; box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;">
            <div class="row">
                <div class="col-md-6 text-center p-5 border">
                    <img src="book/<%=b.getPhoto()%>" style="height: 220px; width: 180px"/><br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName()%></span></h4>
                    <h4>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
                    <h4>Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border">
                    <h2><%=b.getBookName()%></h2>

                    <%
                    if("Old".equals(b.getBookCategory())){
                    %>
                    <h5 class="text-secondary">Contact To Seller</h5>
                    <h5 class="text-secondary"><i class="fa-regular fa-envelope"></i> Email: <%=b.getUserEmail()%></h5>
                    <%
                    }
                    %>

                    <div class="row pt-5">
                        <div class="col-md-4 text-secondary text-center p-2">
                            <i class="fa-regular fa-credit-card fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-secondary text-center p-2">
                            <i class="fa-solid fa-right-left fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-secondary text-center p-2">
                            <i class="fa-solid fa-cart-flatbed fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>
                    </div>

                    <% 
                    if("Old".equals(b.getBookCategory())){
                    %>
                    <div class="text-center pt-5">
                        <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-plus"></i> Continue Shopping</a>
                        <a href="" class="btn btn-danger"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                    </div>
                    <%
                    }else{
                    %>
                    <div class="text-center pt-5">
                        <%
                                if(us == null){
                        %>
                        <a href="login.jsp" class="btn btn-info"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                        <%
                        }else{
                        %>
                        <a href="cart?bid=<%=b.getBookID()%>&&userid=<%=us.getUserID()%>" class="btn btn-info"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                        <%
                        }
                        %>
                        <a href="" class="btn btn-danger"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>

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
