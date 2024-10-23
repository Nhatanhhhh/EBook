<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="home" value="active" scope="request" />
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: Register</title>
        <%@include file="all_component/allCss.jsp"%>
        <style>
            .form-custom {
                box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px,
                    rgba(0, 0, 0, 0.12) 0px -12px 30px,
                    rgba(0, 0, 0, 0.12) 0px 4px 6px,
                    rgba(0, 0, 0, 0.17) 0px 12px 13px,
                    rgba(0, 0, 0, 0.09) 0px -3px 5px;
                border-radius: 20px;
            }

            input[type="number"]::-webkit-outer-spin-button,
            input[type="number"]::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            input[type="number"] {
                -moz-appearance: textfield;
            }

            .form-control:focus {
                outline: none;
                box-shadow: none;
                border: 1px solid #ccc;
            }

            .search-header i{
                display: none;
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
    <body style="background-color: #F0F1F2">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container" style="padding: 60px 0px">
            <div class="row">
                <div class="col-lg-4 offset-lg-4">
                    <div class="card form-custom">
                        <div class="card-body">
                            <h4 class="text-center pb-2" style="font-size: 32px">Registration Page</h4>

                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>

                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="exampleInputFullName">Enter Full Name</label>
                                    <input type="text" class="form-control" id="exampleInputFullName" aria-describedby="nameHelp" required placeholder="Enter your name" name="fname">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required placeholder="Enter your email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPhoneNumber">Phone No</label>
                                    <input type="number" class="form-control" id="exampleInputPhoneNumber" aria-describedby="phoneHelp" required placeholder="Enter your phone number" name="phno">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" required placeholder="Enter your Password" name="password">
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label>
                                </div>
                                <div class="text-center">
                                    <div class="row" style="justify-content: center;">
                                        <div style="padding: 20px;">
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/EBook/logingoogle&response_type=code&client_id=61561031673-edhlvi9mtemq9muhu53krdhkkch1olct.apps.googleusercontent.com&approval_prompt=force" style="font-size: 28px;" class="text-danger">
                                                <i class="fa-brands fa-google"></i>
                                            </a>
                                        </div>
                                        <div style="padding: 20px;">
                                            <a href="https://github.com/login/oauth/authorize?client_id=Ov23lidWaFrdURIwGaPb&redirect_uri=http://localhost:9999/EBook/logingithub&scope=user:email" style="font-size: 28px;" class="text-dark">
                                                <i class="fa-brands fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-info mt-3">Create Account</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all_component/footer.jsp"%>
    </body>
</html>
