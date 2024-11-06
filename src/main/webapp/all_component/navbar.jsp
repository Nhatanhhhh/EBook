<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="login" value="active" scope="request" />
<%@page isELIgnored="false"%>
<div class="container-fluid bg-custom" style="height: 10px;">
</div>


<div class="container-fuid p-3 bg-light">
    <div class="row">
        <div class="col-md-3 col-lg-3 custom-col">
            <a href="index.jsp" class="text-success custom-link" style="text-decoration: none;">
                <h3>
                    <i class="fa-solid fa-book"></i> Ebooks
                </h3>
            </a>
        </div>
        <div class="col-md-6 col-lg-6 custom-col">
            <form action="book-list" method="get" class="form-inline">
                <!-- Search by book name -->
                <input type="text" name="searchName" class="form-control mr-2" placeholder="Search by name" value="${searchName}">

                <!-- Filter by category -->
                <select name="category" class="form-control mr-2">
                    <option value="" ${empty category ? 'selected' : ''}>All Categories</option>
                    <option value="New" ${category == 'New' ? 'selected' : ''}>New</option>
                    <option value="Old" ${category == 'Old' ? 'selected' : ''}>Old</option>
                    <option value="Recent" ${category == 'Recent' ? 'selected' : ''}>Recent</option>
                </select>

                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>

        <c:if test="${not empty userObj}">
            <div class="col-md-3 col-lg-3 custom-col text-right">
                <a href="checkout.jsp"><i class="fa-brands fa-opencart text-dark" style="font-size: 22px;"></i></a>
                <a class="btn btn-success btn-custom ml-3 text-white">
                    <i class="fa-solid fa-circle-user"></i>
                    <span class="search-text">${userObj.name}</span>
                </a>
                <a href="logout" class="btn btn-primary text-white btn-custom">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span class="search-text"> Logout</span>
                </a>
            </div>
        </c:if>


        <c:if test="${empty userObj}">
            <div class="col-md-3 col-lg-3 custom-col text-right">
                <a href="login.jsp" class="btn btn-success btn-custom"><i class="fa-solid fa-user"></i><span class="search-text"> Login</span></a>
                <a href="register.jsp" class="btn btn-primary text-white btn-custom"> <i class="fa-solid fa-user-plus"></i><span class="search-text"> Register</span></a>
            </div>
        </c:if>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarSupportedContent" 
            aria-controls="navbarSupportedContent" aria-expanded="false" 
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_recent_book.jsp"><i class="fa-solid fa-book-open-reader"></i> Recent Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link disabled" href="all_old_book.jsp"><i class="fa-solid fa-book-bookmark"></i> Old Book</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <c:if test="${empty userObj}">
                <a href="login.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gears"></i> Setting</a>
                <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-square-phone"></i> Contact Us</a>
            </c:if>
            <c:if test="${not empty userObj}">
                <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gears"></i> Setting</a>
                <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-square-phone"></i> Contact Us</a>
            </c:if>
        </form>
    </div>
</nav>

