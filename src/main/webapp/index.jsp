<%@page import="java.sql.Connection"%>
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
        <title>EBook: Index</title>
        <%@include file="all_component/allCss.jsp"%>
        <link rel="stylesheet" href="assets/style.css">
        <!-- Google Fonts Link For Icons  -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
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
        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger">
                ${failedMsg}
            </div>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>
        <!-- start slide -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block back-img" src="img/book2.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="gradient-text">Explore Our E-Book Collection</h5>
                        <p class="gradient-text">Thousands of e-books from various genres at your fingertips.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block back-img" src="img/book.webp" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="gradient-text">Discover New Arrivals</h5>
                        <p class="gradient-text">Stay updated with the latest books added to our collection.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block back-img" src="img/library.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="gradient-text">Join Our Reading Community</h5>
                        <p class="gradient-text">Connect with other book lovers and exchange book reviews.</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <!-- end slide -->

        <!-- home section starts  -->
        <section class="home pl-5" id="home">
            <div class="row pl-5">
                <div class="col-md-5">
                    <div class="swiper books-slider">
                        <div class="swiper-wrapper">
                            <a href="view_books.jsp?bid=8" class="swiper-slide"><img src="book/AI.jpg" alt=""></a>
                            <a href="view_books.jsp?bid=3" class="swiper-slide"><img src="book/Unity.jpg" alt=""></a>
                            <a href="view_books.jsp?bid=2" class="swiper-slide"><img src="book/CleanCode.jpg" alt=""></a>
                            <a href="view_books.jsp?bid=6" class="swiper-slide"><img src="book/DockerInAction.jpg" alt=""></a>
                            <a href="view_books.jsp?bid=7" class="swiper-slide"><img src="book/JavaProgramming.jpg" alt=""></a>
                            <a href="view_books.jsp?bid=9" class="swiper-slide"><img src="book/Python.jpg" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="content">
                        <h3>Exclusive New Arrivals</h3>
                        <p>We are excited to announce our exclusive collection of the latest books carefully curated just for you. Explore handpicked titles that cater to your unique interests and stay ahead with the most trending reads.</p>
                        <a href="all_new_book.jsp" class="btn btn-custom-one">Explore Now</a>
                    </div>
                </div>
                <img src="img/stand.png" alt="stand" style="width: 40rem; margin-bottom: 40px; margin-top: -95px; margin-left: -40px"/>
            </div>
        </section>

        <!-- home section end  -->

        <!-- Start Recent Book -->

        <div class="container mt-2">
            <h3 class="text-center" style="font-size: 40px ; background: linear-gradient(to right, #67B26F, #4CA2CD); -webkit-background-clip: text;
                color: transparent;"><i class="fa-regular fa-star"></i> Recent Book</h3>
            <div class="row">

                <%
                BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
                List<BookDtls> list1 = dao1.getRecentBooks();
                for(BookDtls b : list1){
                %>
                <div class="col-md-3 min-width">
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
            <div class="text-center mt-4">
                <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>

        <!-- End Recent Book -->

        <hr>

        <!-- Start New Book -->

        <div class="container">
            <h3 class="text-center" style="font-size: 40px ; background: linear-gradient(to right, red, yellow); -webkit-background-clip: text;
                color: transparent;"><i class="fa-solid fa-fire mt-2"></i> New Book</h3>
            <div class="row">
                <%
                BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
                List<BookDtls> list2 = dao2.getNewBooks();
                for(BookDtls b : list2){
                %>
                <div class="col-md-3 min-width">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhoto()%>" class="img-fluid" style="max-height: 100%; object-fit: contain;">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
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
                                <a href="view_books.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm  ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                }
                %>

            </div>
            <div class="text-center mt-4">
                <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>

        <!-- End New Book -->

        <hr>

        <!-- Start Old Book -->

        <div class="container">
            <h3 class="text-center" style="font-size: 40px ; background: linear-gradient(to right, #9CECFB, #65C7F7, #0052D4); -webkit-background-clip: text;
                color: transparent;"><i class="fa-solid fa-lightbulb"></i> Old Book</h3>
            <div class="row">

                <%
                BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
                List<BookDtls> list3 = dao3.getOldBooks();
                for(BookDtls b : list3){
                %>
                <div class="col-md-3 min-width">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhoto()%>" class="img-fluid" style="max-height: 100%; object-fit: contain;">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Categories: <%=b.getBookCategory()%></p>
                            <div class="row flex-wrap text-center card-custom">
                                <a href="view_books.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm ml-2">View Details</a>
                                <a href="" class="btn btn-danger btn-sm  ml-1"><i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                }
                %>


            </div>
            <div class="text-center mt-4">
                <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>

        <!-- End Old Book -->

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

        <%@include file="all_component/footer.jsp"%>

        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script src="assets/script.js" defer></script>
        <script src="custom_CSS/customScript.js"></script>
    </body>
</html>
