<div class="container-fluid bg-custom" style="height: 10px;">
</div>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-6 col-lg-6 custom-col">
            <a href="home.jsp" class="text-success custom-link no-decoration">
                <h3>
                    <i class="fa-solid fa-book"></i> Ebooks
                </h3>
            </a>
        </div>

        <div class="col-md-6 col-lg-6 d-flex justify-content-end custom-col">
            <c:if test="${not empty userObj}">
                <a href="checkout.jsp" class="btn btn-success btn-custom text-white mr-2">
                    <i class="fa-regular fa-circle-user"></i>
                    <span class="search-text"> ${userObj.name}</span>
                </a>
                <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white btn-custom">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span class="search-text"> Logout</span>
                </a>
            </c:if>
            <c:if test="${empty userObj}">
                <a href="login.jsp" class="btn btn-success btn-custom">
                    <i class="fa-solid fa-arrow-right-to-bracket"></i>
                    <span class="search-text"> Login</span>
                </a>
                <a href="register.jsp" class="btn btn-primary text-white btn-custom">
                    <i class="fa-solid fa-user-plus"></i>
                    <span class="search-text"> Register</span>
                </a>
            </c:if>
        </div>
    </div>
</div>

<!-- Logout Modal -->
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
                    <h4>Do you want to logout?</h4>
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Close</button>
                    <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<!-- End Logout Modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="home.jsp"><i class="fa-solid fa-landmark"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarSupportedContent" 
            aria-controls="navbarSupportedContent" aria-expanded="false" 
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>