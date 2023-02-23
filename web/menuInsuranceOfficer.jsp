<%-- 
    Document   : newmenu
    Created on : 18-Feb-2023, 3:04:06 pm
    Author     : Preyangsee
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Car Insurance Management</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta name="theme-color" content="#712cf9">
<link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    
    <script>
        function loadFNOLDetails(){
            document.getElementById("menubar").style.display='none';
            
             $.ajax({
                                 url: 'ShowFnol',
                                 
                                 success: function (responseText) {
                        alert(responseText);
                                       $("#target").html(responseText);
                                 }
                                  });
        }
    </script>
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom" id="menubar">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <img src="images/logo.png" width="55" height="55"></img>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a onclick="loadFNOLDetails()" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'">HOME</a></li>
          <li><a href="ShowFnol" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'; padding-left: 3rem">ACTIVE PROPERTY LOSS NOTICE</a></li>
          <!--<li><a href="printDriverInfo.jsp" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'; padding-left: 3rem">DMV</a></li>-->

          <!--                    <li><a href="#" class="nav-link px-2 text-white">Edit Employee</a></li> -->
          <!--<li><a href="" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'; padding-left: 3rem">STATUS</a></li>-->

      </ul>
        
        <style>
            .button:hover {
                background-color: #EEE8AA;
                transition: 0.7s;
            }
        </style>

      <div class="col-md-3 text-end">
                    <c:choose>
                    <c:when test ='${Loggedin==null}'>

                    <a href="login.jsp">
                        <button type="button" class="btn btn-primary btn-outline-dark " style="background-color: #EEE8AA; border: none; font-family: 'Lato'">Login</button>
                    </a>
<!--                    <a href="PreSignUp">
                        <button type="button" class="btn btn-primary btn-outline-dark " style="background-color: #EEE8AA; border: none; font-family: 'Lato'">Sign-up</button>
                    </a>-->
                    </c:when>
                    <c:otherwise>

                    <a href="Logout">
                        <button type="button" class="btn btn-outline-dark me-2 text-black" style="font-family: 'Lato'" >Log Out</button>
                    </a>
                    </c:otherwise>
                    </c:choose>
          
<!--        <button type="button" class="btn btn-outline-primary me-2">Login</button>
        <button type="button" class="btn btn-primary">Sign-up</button>-->
      </div>
    </header>
  </div>
    <body>
        <div id="target"></div>
    </body>
</html>
