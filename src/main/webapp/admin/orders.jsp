<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Orders</title>
        <%@include file="allCss.jsp" %>
        <style>
            .bg-custom-1{
                background: linear-gradient(to right, #6441A5, #2A0845);
                color: #fff;
            }

            a:hover {
                text-decoration: none;
            }

            .bg-custom{
                background: linear-gradient(to right, #4568DC, #B06AB3) !important;
            }

            .navbar .nav-item:hover .nav-link{
                background-color: white;
                color: #303F9F;
                border-radius: 8px;
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
        <h3 class="text-center" style="font-weight: bold; font-style: italic;">Hello Admin</h3>

        <c:if test="${sessionScope.userType != 'admin'}">
            <c:redirect url="../index.jsp"/>
        </c:if>
        <table class="table table-striped">
            <thead class="bg-custom-1">
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment type</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
            </tbody>
        </table>


    </body>
</html>
