<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="editbook" value="active" scope="request" />
<%@page isELIgnored="false"%>
<%@ page import="java.util.List, com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Edit Books</title>
        <%@include file="allCss.jsp" %>
        <style>
            .bg-custom{
                background: linear-gradient(to right, #4568DC, #B06AB3) !important;
            }

            a:hover {
                text-decoration: none;
            }

            .container{
                padding: 41.5px 0px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            input[type="file"] {
                cursor: pointer;
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
    <body style="background-color: #F0F2F2;">

        <div class="container-fluid bg-custom" style="height: 10px;">
        </div>

        <div class="container-fluid p-3 bg-light">
            <div class="row">
                <div class="col-md-6 col-lg-6 custom-col">
                    <a href="home.jsp" class="text-success custom-link no-decoration">
                        <h3>
                            <i class="fa-solid fa-book"></i> Ebooks
                        </h3>
                    </a>
                </div>

                <div class="col-md-6 col-lg-6 d-flex justify-content-end custom-col">
                    <c:if test="${not empty userObj}">
                        <a class="btn btn-success btn-custom text-white mr-2">
                            <i class="fa-regular fa-circle-user"></i>
                            <span class="search-text"> ${userObj.name}</span>
                        </a>
                        <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white btn-custom">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <span class="search-text"> Logout</span>
                        </a>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Logout Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1"
             role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <h4>Do you want to logout?</h4>
                            <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal">Close</button>
                            <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
                        </div>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>
        <!-- End Logout Modal -->

        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <a class="navbar-brand" href="home.jsp"><i class="fa-solid fa-landmark"></i></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" 
                    data-target="#navbarSupportedContent" 
                    aria-controls="navbarSupportedContent" aria-expanded="false" 
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <c:if test="${empty userObj}">
            <c:redirect url="../login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.userType != 'admin'}">
            <c:redirect url="../index.jsp"/>
        </c:if>

        <c:if test="${not empty succMsg}">
            <h5 class="text-center text-success">${succMsg}</h5>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <h5 class="text-center text-danger">${failedMsg}</h5>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>
        <div class="container body-custom">
            <div class="row">
                <div class="col-lg-4 offset-lg-4">
                    <div class="card form-custom">
                        <div class="card-body">
                            <h4 class="text-center">Edit Books</h4>


                            <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn()); 
                            BookDtls b = dao.getBookByID(id);
                            %>

                            <form action="../edit_books" method="post">
                                <input type="hidden" name="id" value="<%=b.getBookID()%>" />
                                <div class="form-group">
                                    <label for="bookname">Book Name*</label>
                                    <input name="bname" type="text" class="form-control" id="bookname" required placeholder="Enter Your Book Name" value="<%=b.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="authorname">Author Name*</label>
                                    <input name="author" type="text" class="form-control" id="authorname" required placeholder="Enter Author Name" value="<%=b.getAuthor()%>">
                                </div>
                                <div class="form-group">
                                    <label for="price">Price*</label>
                                    <input name="price" type="number" class="form-control" id="price" required placeholder="Enter Price" value="<%=b.getPrice()%>">
                                </div>

                                <div class="form-group">
                                    <label for="inputstatus">Book Status</label>
                                    <select id="inputstatus" required name="status" class="form-control">
                                        <option value="" selected disabled>--select--</option>
                                        <% if("Active".equals(b.getStatus())){%>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%}else{%>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-info pt-2">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="footer.jsp" %>
    </body>
</html>
