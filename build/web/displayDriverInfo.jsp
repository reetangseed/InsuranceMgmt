<%-- 
    Document   : displayDriverInfo
    Created on : 21-Feb-2023, 7:10:29 pm
    Author     : Preyangsee
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container text-center bg-white p-5">
            <!--<img class="d-block mx-auto mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->
            <h6 class="display-6 fw-light" style="font-family: 'Lato'">License ID : ${driver.getLicenseId()}</h6>
            <div class="col-lg-6 mx-auto">
                <p class="lead mb-sm-2">
                <h6 class="fw-light">GENERAL INFORMATION</h6>
                Name : <b>${driver.getName()}</b> <br>
                Address : <b>${driver.getAddress()}</b><br>
                Gender : <b>${driver.getGender()}</b><br>
                Eye Color : <b>${driver.getEyeColor()}</b><br>
                <br>
                License Status : <i>${driver.getLicenseStatus()}</i> Accident Status : <i>${driver.getAccidentstatus()}</i> <br>
                </p>
               
            </div>
        </div>
<!--        <div class="container btn-outline-light">
            <div class="row">
                <div class="col-sm-3">
         <div class="mx-auto">
        <p class="lead mb-sm-3">
        <h6>License ID : ${driver.getLicenseId()}</h6>
        <h6 class="fw-light">GENERAL INFORMATION</h6>
             Name : <b>${driver.getName()}</b> <br>
                Phone Number : <b></b>
             Address : <b>${driver.getAddress()}</b><br>
             Gender : <b>${driver.getGender()}</b><br>
             Eye Color : <b>${driver.getEyeColor()}</b><br>
                <br>
             License Status : <i>${driver.getLicenseStatus()}</i> Accident Status : <i>${driver.getAccidentstatus()}</i> <br>
        
        </p>-->
        
    </body>
</html>
