<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>Order Page</title>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <style>

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
                z-index: 1;
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
                z-index: 1;
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
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid pt-5 pb-5">
            <h3 class="text-center">Your Order</h3>
            <table class="table table-striped">
                <thead class="table-primary">
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody class="table-light">
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                </tbody>
            </table>
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
        <%@include file="all_component/footer.jsp"%>
        <script src="assets/script.js" defer></script>

    </body>
</html>
