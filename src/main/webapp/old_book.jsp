<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.InterfaceUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User: Old Book Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <link rel="stylesheet" href="assets/style.css"/>
        <!-- Google Fonts Link For Icons -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <c:if test="${not empty succMsg}">
            <p class="alert alert-success text-center">${succMsg}</p>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <p class="alert alert-success text-center">${failedMsg}</p>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>

        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp">
            </c:redirect>
        </c:if>
        <div class="container">
            <div class="p-4">
                <table class="table table-striped">
                    <thead class="table-success">
                        <tr>
                            <th scope="col">Book Name</th>
                            <th scope="col">Author</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="table-light">
                        <%
                            Object userObj = session.getAttribute("userObj");
                            InterfaceUser us = (userObj instanceof InterfaceUser) ? (InterfaceUser) userObj : null;
                            String email = us.getEmail();
                            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                            List<BookDtls> list = dao.getBookByOld(email, "Old");
                            for(BookDtls b : list){
                        %>

                        <tr>
                            <td><%=b.getBookName()%></td>
                            <td><%=b.getAuthor()%></td>
                            <td><%=b.getPrice()%></td>
                            <td><%=b.getBookCategory()%></td>
                            <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookID()%>" class="btn btn-sm btn-danger">Delete</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
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

        <%@include file="all_component/footer.jsp" %>
        <script src="assets/script.js" defer></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
