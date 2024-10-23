<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="homeadmin" value="active" scope="request" />
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Home</title>
        <%@include file="allCss.jsp" %>
        <style>
            .custom-content{
                padding: 171px 0px;
            }
            .card{
                border: hidden;
            }

            a:hover {
                text-decoration: none;
            }

            .custom-box {
                box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
                border-radius: 12px;
                background: #fff;
                overflow: hidden;
                transition: all 0.25s ease 0s;
            }

            .custom-box:hover{
                transform: scale(1.1);
                cursor: pointer;
            }

            .custom-box-1{
                background: linear-gradient(to right, #005C97, #363795);
                color: #FFF;
            }

            .custom-box-1:hover{
                background: linear-gradient(to right, #005C97, #363795);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .custom-box-2{
                background: linear-gradient(to right, #E53935, #E35D5B);
                color: #FFF;
            }

            .custom-box-2:hover{
                background: linear-gradient(to right, #E53935, #E35D5B);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .custom-box-3{
                background: linear-gradient(to right, #BA8B02, #181818);
                color: #FFF;
            }

            .custom-box-3:hover{
                background: linear-gradient(to right, #BA8B02, #181818);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .custom-box-4{
                background: linear-gradient(to right, #525252, #3D72B4);
                color: #FFF;
            }

            .custom-box-4:hover{
                background: linear-gradient(to right, #525252, #3D72B4);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .bg-custom{
                background: linear-gradient(to right, #4568DC, #B06AB3) !important;
            }

            .navbar .nav-item:hover .nav-link{
                background-color: white;
                color: #303F9F;
                border-radius: 8px;
            }

            .search-header{
                display: flex;
                justify-content: center;
            }

            .search-header i{
                display: none;
            }

            @media (max-width: 1280px){
                .container-fuild .row {
                    flex-wrap: nowrap;
                }
                .search-custom {
                    width: 70%;
                }
                .btn-custom {
                    padding: 0.5rem 1rem;
                }
            }

            @media (max-width: 1008px){
                .search-header i{
                    display: block;
                }

                .search-text{
                    display: none;
                }

                .col-md-3 {
                    min-width: auto;
                }

                .search-custom {
                    width: 40%;
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

        <div class="container custom-content">
            <div class="row">
                <div class="col-md-3">
                    <a href="add_books.jsp">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-1">
                                <div class="box-content">
                                    <i class="fa-regular fa-square-plus fa-2x"></i><br>
                                    <h4>Add Books</h4>
                                    -----------
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="all_books.jsp">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-2">
                                <div class="box-content">
                                    <i class="fa-solid fa-book-open fa-2x"></i><br>
                                    <h4>All Books</h4>
                                    -----------
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="orders.jsp">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-3">
                                <div class="box-content">
                                    <i class="fa-solid fa-boxes-stacked fa-2x"></i><br>
                                    <h4>Orders</h4>
                                    -----------
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a data-toggle="modal" data-target="#exampleModalCenter">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-4">
                                <div class="box-content">
                                    <i class="fa-solid fa-right-from-bracket fa-2x"></i><br>
                                    <h4>Logout</h4>
                                    -----------
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <!-- Modal -->
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
                            <h4>Do you want logout</h4>
                            <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal">Close</button>
                            <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
                        </div>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>
        <!-- End Modal -->

        <%@include file="footer.jsp" %>
    </body>
</html>
