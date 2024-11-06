<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>Setting Page</title>
        <!-- Google Fonts Link For Icons  -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <style type="text/css">
            a{
                text-decoration: none;
                color: black;
            }

            a:hover{
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
                background: linear-gradient(to right, #EACDA3, #D6AE7B);
                color: #FFF;
            }

            .custom-box-1:hover{
                background: linear-gradient(to right, #EACDA3, #D6AE7B);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .custom-box-2{
                background: linear-gradient(to right, #2F7336, #AA3A38);
                color: #FFF;
            }

            .custom-box-2:hover{
                background: linear-gradient(to right, #2F7336, #AA3A38);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .custom-box-3{
                background: linear-gradient(to right, #114357, #F29492);
                color: #FFF;
            }

            .custom-box-3:hover{
                background: linear-gradient(to right, #114357, #F29492);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .custom-box-4{
                background: linear-gradient(to right, #6A3093, #A044FF);
                color: #FFF;
            }

            .custom-box-4:hover{
                background: linear-gradient(to right, #6A3093, #A044FF);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .custom-box-5{
                background: linear-gradient(to right, #457FCA, #5691C8);
                color: #FFF;
            }

            .custom-box-5:hover{
                background: linear-gradient(to right, #457FCA, #5691C8);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
            }

            .custom-box-6{
                background: linear-gradient(to right, #BBD2C5, #536976, #292E49);
                color: #FFF;
            }

            .custom-box-6:hover{
                background: linear-gradient(to right, #BBD2C5, #536976, #292E49);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                font-weight: bold;
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
    <body style="background-color: #F7F7F7;">

        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp" />
        </c:if>

        <%@include file="all_component/navbar.jsp" %>

        <div class="container mb-5 pb-5">
            <h3 class="text-center pb-3 pt-3">SETTING</h3>
            <div class="row">
                <div class="col-md-4">
                    <a href="sell_book.jsp">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-1">
                                <i class="fa-solid fa-book-medical fa-2x"></i>
                                <h4>Sell Book</h4>
                                <p>Sell Your Old Book</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-2">
                                <i class="fa-regular fa-address-card fa-2x"></i>
                                <h4>Login & Security (Edit Profile)</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="old_book.jsp">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-6">
                                <i class="fa-solid fa-book-medical fa-2x"></i>
                                <h4>Old Book</h4>
                                <p>Management your Old Book</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-md-6">
                    <a href="order.jsp">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-4">
                                <i class="fa-solid fa-box-archive fa-2x"></i>
                                <h4>Your Order</h4>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-6">
                    <a href="helpline.jsp">
                        <div class="card custom-box">
                            <div class="card-body text-center custom-box-5">
                                <i class="fa-solid fa-headset fa-2x"></i>
                                <h4>Help Center</h4>
                                <p>24*7 Service</p>
                            </div>
                        </div>
                    </a>
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
