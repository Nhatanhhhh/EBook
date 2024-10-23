<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Books</title>
        <%@include file="allCss.jsp" %>
        <style>
            .bg-custom{
                background: linear-gradient(to right, #4568DC, #B06AB3) !important;
            }

            a:hover {
                text-decoration: none;
            }

            .navbar .nav-item:hover .nav-link{
                background-color: white;
                color: #303F9F;
                border-radius: 8px;
            }

            .bg-custom-1{
                background: linear-gradient(to right, #136A8A, #267871);
                color: #fff;
            }

            @media (max-width: 1280px){
                .container-fuild .row {
                    flex-wrap: nowrap;
                }
                .btn-custom {
                    padding: 0.5rem 1rem;
                }
            }

            @media (max-width: 1008px){
                .col-md-6 {
                    min-width: auto;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="../login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.userType != 'admin'}">
            <c:redirect url="../index.jsp"/>
        </c:if>
        <h3 class="text-center" style="font-weight: bold; font-style: italic;">Hello Admin</h3>

        <c:if test="${not empty succMsg}">
            <h5 class="text-center text-success">${succMsg}</h5>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <h5 class="text-center text-danger">${failedMsg}</h5>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>

        <table class="table table-striped">
            <thead class="bg-custom-1">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Categories</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list  = dao.getAllBooks();
                    for(BookDtls b : list){
                %>
                <tr>
                    <td><%=b.getBookID()%></td>
                    <td><img src="../book/<%=b.getPhoto()%>" style="width: 50px; height: 50px" /></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getBookCategory()%></td>
                    <td><%=b.getStatus()%></td>
                    <td>
                        <!-- Button Edit with Modal -->
                        <a href="" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#editModal<%=b.getBookID()%>">
                            <i class="fa-solid fa-pen-to-square"></i> Edit</a>

                        <!-- Button Delete with Modal -->
                        <a href="" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal<%=b.getBookID()%>">
                            <i class="fa-regular fa-trash-can"></i> Delete</a>

                        <!-- Modal Edit -->
                        <div class="modal fade" id="editModal<%=b.getBookID()%>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%=b.getBookID()%>" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel<%=b.getBookID()%>">Confirm Edit</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to edit the book "<%=b.getBookName()%>"?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <a href="edit_books.jsp?id=<%=b.getBookID()%>" class="btn btn-primary">Edit</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Delete -->
                        <div class="modal fade" id="deleteModal<%=b.getBookID()%>" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel<%=b.getBookID()%>" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel<%=b.getBookID()%>">Confirm Deletion</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to delete the book "<%=b.getBookName()%>"? This action cannot be undone.
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <a href="../delete?id=<%=b.getBookID()%>" class="btn btn-danger">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>


    </body>
</html>
