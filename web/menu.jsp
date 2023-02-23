<%-- 
    Document   : landingPage
    Created on : 22-Dec-2022, 12:00:33 PM
    Author     : Avijit Chattopadhyay
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Car Insurance Management</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta name="theme-color" content="#712cf9">
<link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
        <!-- Custom styles for this template -->
<!--        <link href="css/header.css" rel="stylesheet">-->
        <!--<link href="css/carousel.css" rel="stylesheet">-->
    </head>
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <style>
    a:active {
        color:#FAFAD2;
    }</style>
    <script>
        
        function loadEmployeeDetails(){
            document.getElementById("menubar").style.display='none';
            
             $.ajax({
                                 url: 'EmployeeDetails',
                                 
                                 success: function (responseText) {
                        //alert(responseText);
                                       $("#employeeDetails").html(responseText);
                                 }
                                  });
        }
        function addEmployeeDetails(){
            document.getElementById("menubar").style.display='none';
            $.ajax({
                                 url: 'DoAddEmployee',
                                 
                                 success: function (responseText) {
                        //alert(responseText);
                                       $("#employeeDetails").html(responseText);
                                 }
                                  });
        }
        function searchEmployeeDetails(){
            document.getElementById("menubar").style.display='none';
            $.ajax({
                                 url: 'DoSearchEmployee',
                                 
                                 success: function (responseText) {
                        //alert(responseText);
                                       $("#employeeDetails").html(responseText);
                                 }
                                  });
        }
    </script>
    <header class="site-header sticky-top p-3" style="background-color: #DCDCDC" id="menubar">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-black text-decoration-none">
                    <img src="images/logo.png" width="75" height="75"></img>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li>NOTHING HERE!! LOGIN TO VIEW STATUS</li>
                    <!--<li><a href="enterFnol.jsp" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'; padding-left: 3rem">INSURANCE</a></li>-->
                    
<!--                    <li><a href="#" class="nav-link px-2 text-white">Edit Employee</a></li> -->
                    <!--<li><a href="" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'; padding-left: 3rem">STATUS</a></li>-->
                    
                    <!--<li><a href="#" class="nav-link px-2 text-black" style="font-family: 'Open Sans'"> <c:if test='${User.firstName!=null && User.lastName!=null}'>Welcome: ${User.firstName} ${User.lastName}</c:if></a> </li>-->

                </ul>

<!--                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
                </form>-->

                <div class="text-end">
                    <c:choose>
                    <c:when test ='${Loggedin==null}'>

                    <a href="login.jsp">
                        <button type="button" class="btn btn-outline-dark me-2 text-black" style="font-family: 'Lato'" >Login</button>
                    </a>
                    <a href="PreSignUp">
                        <button type="button" class="btn btn-outline-dark btn-warning" style="background-color: #EEE8AA; border: none; color: black; font-family: 'Lato'">Sign-up</button>
                    </a>
                    </c:when>
                    <c:otherwise>

                    <a href="Logout">
                        <button type="button" class="btn btn-outline-dark me-2 text-black" style="font-family: 'Lato'" >Log Out</button>
                    </a>
                    </c:otherwise>
                    </c:choose>

<!--                    <div>background-color:white</div>-->
                </div>
            </div>
        </div>
    </header>
    <body>
        <main>
            <div id="employeeDetails"></div>
            <!--<div class="text-center form-signin w-100 m-auto" id="addEmployee"></div>-->
        </main>
        
    </body>
</html>
