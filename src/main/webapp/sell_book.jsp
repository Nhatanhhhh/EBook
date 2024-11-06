<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Book Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <!-- Google Fonts Link For Icons  -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="assets/style.css"/>
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
    <body>
        <%@include file="all_component/navbar.jsp" %>

        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp">
            </c:redirect>
        </c:if>

        <div class="container p-4">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card form-custom">
                        <div class="card-body">
                            <h4 class="text-center">Sell Books</h4>
                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>

                            <form action="sellbook" method="POST"
                                  enctype="multipart/form-data">
                                <input type="hidden" value="${userObj.email}" name="user"/>
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
                                    <label for="fileUpload">Upload Photo</label>
                                    <input name="bimg" type="file" required="required" class="form-control-file" id="fileUpload">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-info pt-2">Sell</button>
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
        <%@include file="all_component/footer.jsp" %>
        <script src="assets/script.js" defer></script>
    </body>
</html>
