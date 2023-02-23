<%-- 
    Document   : printDriverInfo
    Created on : 18-Feb-2023, 6:47:47 pm
    Author     : Preyangsee
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
        <title>DMV SEARCH</title>
    </head>
    <jsp:include page="menuUnderwriter.jsp"></jsp:include>
    <body>
        <form action="SearchDriverInfo" method="post">
            <div class="container-md">
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="User ID" name="driverLicenseNumber" value="${fnol.getDriverLicenseNumber()}">
                <label for="floatingInput">Enter License No.</label>
            </div> 
                <button class="w-100 btn btn-md btn-primary" style="background-color: black; border: none; font-family: 'Playfair Display'" type="submit">Search Credentials in DMV</button>
        </div>
            
        </form>
    <%--<c:set var="DriverInfo" value="${DriverInfo}"/>--%>
    <%--<c:if test='${driver !=null}'>--%>
        <div class="px-4 py-5 my-5 text-center bg-light p-5 rounded">
            <!--<img class="d-block mx-auto mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->
            <h6 class="display-6 fw-light" style="font-family: 'Lato'">License ID : ${driver.getLicenseId()}</h6>
            <div class="col-lg-6 mx-auto">
                <p class="lead mb-sm-2">
                <h6 class="fw-light">GENERAL INFORMATION</h6>
                Name : <b>${driver.getName()}</b> <br>
<!--                Phone Number : <b></b>-->
                Address : <b>${driver.getAddress()}</b><br>
                Gender : <b>${driver.getGender()}</b><br>
                Eye Color : <b>${driver.getEyeColor()}</b><br>
                <br>
                License Status : <i>${driver.getLicenseStatus()}</i> Accident Status : <i>${driver.getAccidentstatus()}</i> <br>
               
                </p>
<!--                <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                    <button type="submit" class="btn btn-primary btn-lg px-4 gap-3" name="fnolId" value='${fnol.getFnolId()}' onclick="approveFnol()">Approve</button>
                    <button type="button" class="btn btn-outline-secondary btn-lg px-4">Reject</button>
                </div>-->
            </div>
        </div>
    <%--</c:if>--%>
    

    </body>

