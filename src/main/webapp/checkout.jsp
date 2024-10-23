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
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp"%>
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
                                            <a href="remove_book?bid=<%=c.getBid()%>" class="btn btn-sm btn-danger">Remove</a>
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
                            <form>
                                <h3 class="text-center text-success">Your Details for Order</h3>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputName">Name</label>
                                        <input type="text" class="form-control" id="inputName" value="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail">Email</label>
                                        <input type="email" class="form-control" id="inputEmail" value="">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPhonu">Phone Number</label>
                                        <input type="number" class="form-control" id="inputPhonu" placeholder="Enter your Phone Number" value="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Enter your Address" value="">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputLandmark">Landmark</label>
                                        <input type="text" class="form-control" id="inputLandmark" placeholder="Enter your Landmark">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">City</label>
                                        <input type="text" class="form-control" id="inputCity" placeholder="Enter your City">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputLandmark">State</label>
                                        <input type="text" class="form-control" id="inputLandmark" placeholder="Enter your Landmark">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputCity">Pin Code</label>
                                        <input type="text" class="form-control" id="inputCity" placeholder="Enter your City">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Payment Type</label>
                                    <select class="form-control">
                                        <option>---Select---</option>
                                        <option>Cash On Delivery</option>
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
    </body>
</html>
