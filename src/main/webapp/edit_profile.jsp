<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>Edit Page</title>
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
        <script>
            function validateForm() {
                var password = document.getElementById("exampleInputPassword1").value;
                var confirmPassword = document.getElementById("exampleInputConfirmPassword").value;

                if (password !== confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }

                if (!termsCheckbox) {
                    alert("You must agree to the terms and conditions.");
                    return false;
                }

                return true;
            }
        </script>
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
                    <div class="card">
                        <div class="card-body form-custom">
                            <h4 class="text-center">Edit Profile</h4>

                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>

                            <form action="update_profile" method="POST" onsubmit="return validateForm()">
                                <input type="hidden" value="${userObj.userID}" name="id" />
                                <div class="form-group">
                                    <label for="exampleInputFullName">Enter Full Name</label>
                                    <input type="text" class="form-control" id="exampleInputFullName" value="${userObj.name}" name="fname">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" value="${userObj.email}" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPhoneNumber">Phone No</label>
                                    <input type="number" class="form-control" id="exampleInputPhoneNumber" value="${userObj.phno}" required  name="phno">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" required placeholder="Change your Password" name="password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputConfirmPassword">Confirm Password</label>
                                    <input type="password" class="form-control" id="exampleInputConfirmPassword" required placeholder="Confirm your Password">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-info mt-3" style="padding-left: 120px; padding-right: 120px;">Update</button>
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
