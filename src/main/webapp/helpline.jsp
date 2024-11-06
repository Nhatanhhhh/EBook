<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>Help Page</title>
        <link rel="stylesheet" href="assets/style.css"/>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-4">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="text-info pt-3 pb-3">
                                <i class="fa-solid fa-headset fa-5x"></i>
                            </div>
                            <h3>24*7 Service</h3>
                            <h4>Help Line Number</h4>
                            <h6>(+84)0813 052062 | Gmail : <a class="text-dark" style="text-decoration: none;" href="https://workspace.google.com/intl/vi/gmail/" target="_blank"><i class="fa-solid fa-envelope-open-text text-danger"></i> nguyennhatanhnnacm@gmail.com</a></h6>
                            <a href="index.jsp" class="btn btn-info">Home</a>
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
