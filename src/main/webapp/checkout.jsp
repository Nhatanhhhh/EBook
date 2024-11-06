<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.InterfaceUser"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut Page</title>
        <%@include file="all_component/allCss.jsp"%>
        <link rel="stylesheet" href="assets/style.css"/>
        <!-- Google Fonts Link For Icons  -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <style>
            input[type="number"]::-webkit-outer-spin-button,
            input[type="number"]::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            .form-custom {
                box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
                border-radius: 20px;
            }

            .form-control:focus {
                outline: none;
                box-shadow: none;
                border: 1px solid #ccc;
            }

            input[type="number"] {
                -moz-appearance: textfield;
            }

            .search-header i{
                display: none;
            }

            .section{
                padding: 50px 20px;
            }

            @media (max-width: 1008px){
                .search-header i{
                    display: block;
                }

                .search-text{
                    display: none;
                }
            }
        </style>
    </head>
    <body style="background-color: #F0F1F2;">
        <%@include file="all_component/navbar.jsp"%>

        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp">
            </c:redirect>
        </c:if>

        <c:if test="${not empty succMsg}">
            <div class="alert alert-success" role="alert">
                ${succMsg}
            </div>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger" role="alert">
                ${failedMsg}
            </div>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>

        <div class="container">
            <div class="row">
                <div class="col-md-6 section">
                    <div class="card bg-white form-custom">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Selected Item</h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        InterfaceUser us = (InterfaceUser)session.getAttribute("userObj");
                                        
                                        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                                        Double totalPrice = 0.00;
                                        List<Cart> cart = dao.getBookByUser(us.getUserID());
                                        for(Cart c : cart){
                                        totalPrice = c.getTotalPrice();
                                    %>
                                    <tr>
                                        <th scope="row"><%=c.getBookName()%></th>
                                        <td><%=c.getAuthor()%></td>
                                        <td><%=c.getPrice()%></td>
                                        <td>
                                            <a href="remove_book?cid=<%=c.getCid()%>&&bid=<%=c.getBid()%>&&uid=<%=c.getUserid()%>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %> 
                                    <tr>
                                        <td>Total Price</td>
                                        <td></td>
                                        <td></td>
                                        <td><%=totalPrice%></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 section">
                    <div class="card form-custom">
                        <div class="card-body">
                            <form action="order" method="POST">
                                <h3 class="text-center text-success">Your Details for Order</h3>

                                <input type="hidden" value="${userObj.userID}" name="id"/>
                                
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputName">Name</label>
                                        <input type="text" class="form-control" id="inputName" value="${userObj.name}" readonly name="name" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail">Email</label>
                                        <input type="email" class="form-control" id="inputEmail" value="${userObj.email}" readonly name="email" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPhonu">Phone Number</label>
                                        <input type="number" class="form-control" id="inputPhonu" placeholder="Enter your Phone Number" value="${userObj.phno}" readonly name="phno" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Enter your Address" value="" name="address" required>
                                    </div>
                                </div>


                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputLandmark">Landmark</label>
                                        <input type="text" class="form-control" id="inputLandmark" placeholder="Enter your Landmark" name="landmark" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">City</label>
                                        <input type="text" class="form-control" id="inputCity" placeholder="Enter your City" name="city" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">State</label>
                                        <input type="text" class="form-control" id="inputState" placeholder="Enter your State" name="state" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputZip">Pin Code</label>
                                        <input type="text" class="form-control" id="inputZip" placeholder="Enter your Zip code" name="pincode" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Payment Type</label>
                                    <select class="form-control" name="payment">
                                        <option value="noselect">---Select---</option>
                                        <option value="COD">Cash On Delivery</option>
                                    </select>
                                </div>

                                <div class="text-center p-3">
                                    <button class="btn btn-warning">Order Now</button>
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>

                            </form>
                        </div>
                    </div>
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
