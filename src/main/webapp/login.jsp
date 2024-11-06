<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="login" value="active" scope="request" />
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: Login</title>
        <%@include file="all_component/allCss.jsp"%>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <style>
            .form-custom {
                box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
                border-radius: 20px;
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

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins" sans-serif;
            }

            body {
                background: #E3F2FD;
            }

            .chatbot-toggler {
                position: fixed;
                right: 40px;
                bottom: 35px;
                height: 50px;
                width: 50px;
                color: #fff;
                border: none;
                display: flex;
                align-items: center;
                justify-content: center;
                outline: none;
                cursor: pointer;
                background: linear-gradient(to right, #4568DC, #B06AB3);
                border-radius: 50%;
                transition: all 0.2s ease;
            }

            .show-chatbot .chatbot-toggler {
                transform: rotate(90deg);
            }

            .chatbot-toggler span{
                position: absolute;
            }

            .show-chatbot .chatbot-toggler span:first-child,
            .chatbot-toggler span:last-child{
                opacity: 0;
            }

            .show-chatbot .chatbot-toggler span:last-child{
                opacity: 1;
            }

            .chatbot {
                position: fixed;
                right: 40px;
                bottom: 100px;
                width: 420px;
                transform: scale(0.5);
                opacity: 0;
                pointer-events: none;
                overflow: hidden;
                background: #fff;
                border-radius: 15px;
                transform-origin: bottom right;
                box-shadow: 0 0 128px 0 rgba(0, 0, 0, 0.1),
                    0 32px 64px -48px rgba(0, 0, 0, 0.5);
                transition: all 0.1s ease;
            }

            .show-chatbot .chatbot{
                transform: scale(1);
                opacity: 1;
                pointer-events: auto;
            }

            .chatbot header {
                background: linear-gradient(to right, #4568DC, #B06AB3);
                padding: 16px 0;
                text-align: center;
                position: relative;
            }

            .chatbot header h2 {
                color: #fff;
                font-size: 1.4rem;
            }

            .chatbot header span{
                position: absolute;
                right: 20px;
                top: 50%;
                color: #fff;
                cursor: pointer;
                display: none;
                transform: translateY(-50%);
            }

            .chatbot .chatbox {
                height: 510px;
                overflow-y: auto;
                padding: 30px 20px 100px;
            }

            .chatbox .chat {
                display: flex;
            }

            .chatbox .incoming span {
                height: 32px;
                width: 32px;
                color: #fff;
                align-self: flex-end;
                background: linear-gradient(to right, #4568DC, #B06AB3);
                text-align: center;
                line-height: 32px;
                border-radius: 4px;
                margin: 0 10px 7px 0;
            }

            .chatbox .outgoing {
                margin: 20px 0;
                justify-content: flex-end;
            }

            .chatbox .chat p {
                color: #fff;
                max-width: 75%;
                white-space: pre-wrap;
                font-size: 0.95rem;
                padding: 12px 16px;
                border-radius: 10px 10px 0 10px;
                background: linear-gradient(to right, #4568DC, #B06AB3);
            }

            .chatbox .chat p.error{
                color: #721C24;
                background: #F8D7DA;
            }

            .chatbox .incoming p {
                color: #000;
                background: #F2F2F2;
                border-radius: 10px 10px 10 0px;
            }

            .chatbot .chat-input {
                position: absolute;
                bottom: 0;
                width: 100%;
                display: flex;
                gap: 5px;
                background: #fff;
                padding: 5px 20px;
                border-top: 1px solid #ccc;
            }

            .chat-input textarea {
                height: 55px;
                width: 100%;
                border: none;
                outline: none;
                max-height: 180px;
                font-size: 0.95rem;
                resize: none;
                padding: 16px 15px 16px 0;
            }

            .chat-input span {
                align-self: flex-end;
                height: 55px;
                line-height: 55px;
                color: #724AE8;
                font-size: 1.55rem;
                cursor: pointer;
                visibility: hidden;
            }

            .chat-input textarea:not(:placeholder-shown) ~ span {
                visibility: visible;
            }

            @media (max-width: 490px){
                .chatbot{
                    right: 0;
                    bottom: 0;
                    width: 100%;
                    height: 100%;
                    border-radius: 0;
                }

                .chatbot .chatbox{
                    height: 90%;
                }

                .chatbot header span{
                    display: block;
                }
            }
        </style>
    </head>
    <body style="background-color: #F0F1F2">
        <%@include file="all_component/navbar.jsp"%>
        <div class="container" style="padding: 60px 0px">
            <div class="row">
                <div class="col-lg-4 offset-lg-4">
                    <div class="card form-custom">
                        <div class="card-body">
                            <h5 class="text-center pb-2" style="font-size: 32px;">Login</h5>

                            <c:if test="${not empty failedMsg}">
                                <h5 class="text-center text-danger">${failedMsg}</h5>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <h5 class="text-center text-success">${succMsg}</h5>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>


                            <form action="login" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required name="email" placeholder="Enter your email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" required name="password" placeholder="Enter your password">
                                </div>
                                <div class="text-center p-3">
                                    <div class="row" style="justify-content: center;">
                                        <div style="padding: 0 20px 20px 20px;">
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/EBook/logingoogle&response_type=code&client_id=61561031673-ugukbhbpmfsvm9fkuq5k60r28bj63os1.apps.googleusercontent.com&approval_prompt=force" style="font-size: 28px;" class="text-danger">
                                                <i class="fa-brands fa-google"></i>
                                            </a>
                                        </div>
                                        <div style="padding: 0 20px 20px 20px;">
                                            <a href="https://github.com/login/oauth/authorize?client_id=Ov23liE6hJC5720G2W3Y&redirect_uri=http://localhost:9999/EBook/logingithub&scope=user:email" style="font-size: 28px;" class="text-dark">
                                                <i class="fa-brands fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-info mb-2">Login</button>
                                    <br>
                                    <a href="register.jsp">Create Account</a>
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