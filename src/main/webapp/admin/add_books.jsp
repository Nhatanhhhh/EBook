<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="addbook" value="active" scope="request" />
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
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


            @media (max-width: 1280px){
                .container-fuild .row {
                    flex-wrap: nowrap;
                }

                .btn-custom {
                    padding: 0.5rem 1rem;
                }
            }

            @media (max-width: 1008px){
                .search-text{
                    display: none;
                }

                .col-md-6 {
                    min-width: auto;
                }
            }
        </style>
    </head>
    <body style="background-color: #F0F2F2;">
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="../login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.userType != 'admin'}">
            <c:redirect url="../index.jsp"/>
        </c:if>
        <div class="container p-4">
            <div class="row">
                <div class="col-lg-4 offset-lg-4">
                    <div class="card form-custom">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>

                            <form action="../add_books" method="post"
                                  enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="bookname">Book Name*</label>
                                    <input name="bname" type="text" class="form-control" id="bookname" required placeholder="Enter Your Book Name">
                                </div>
                                <div class="form-group">
                                    <label for="authorname">Author Name*</label>
                                    <input name="author" type="text" class="form-control" id="authorname" required placeholder="Enter Author Name">
                                </div>
                                <div class="form-group">
                                    <label for="price">Price*</label>
                                    <input name="price" type="number" class="form-control" id="price" required placeholder="Enter Price">
                                </div>
                                <div class="form-group">
                                    <label for="inputcategories">Book Categories</label>
                                    <select id="inputcategories" required name="categories" class="form-control">
                                        <option value="" selected disabled>--select--</option>
                                        <option value="New">New Book</option>
                                        <option value="Old">Old Book</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputstatus">Book Status</label>
                                    <select id="inputstatus" required name="status" class="form-control">
                                        <option value="" selected disabled>--select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="fileUpload">Upload Photo</label>
                                    <input name="bimg" type="file" required="required" class="form-control-file" id="fileUpload">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-info pt-2">Add</button>
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
