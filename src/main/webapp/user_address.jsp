<%@page import="com.entity.InterfaceUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>Edit Address Page</title>
        <link rel="stylesheet" href="assets/style.css"/>
        <style>
            input[type="number"]::-webkit-outer-spin-button,
            input[type="number"]::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
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

            input[type="number"] {
                -moz-appearance: textfield;
            }

            .search-header i{
                display: none;
            }

            .section{
                padding: 50px 20px;
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
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <%InterfaceUser us = (InterfaceUser)session.getAttribute("userObj"); %>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp">
            </c:redirect>
        </c:if>
        <div class="container p-4">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card form-custom">
                        <div class="card-body">
                            <form action="" method="POST">
                                <h4 class="text-center p-2">Add Address</h4>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="Enter your Address" value="<%=us.getAddress()%>">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputLandmark">Landmark</label>
                                        <input type="text" class="form-control" id="inputLandmark" placeholder="Enter your Landmark" value="<%=us.getLandmark()%>">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="inputCity">City</label>
                                        <input type="text" class="form-control" id="inputCity" value="<%=us.getCity()%>" placeholder="Enter your City">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputState">State</label>
                                        <input type="text" class="form-control" id="inputState" value="<%=us.getState()%>" placeholder="Enter your State">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputZip">Zip</label>
                                        <input type="text" class="form-control" id="inputZip" value="<%=us.getZip()%>" placeholder="Enter your Zip">
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button class="btn btn-warning text-white">Add Address</button>
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
