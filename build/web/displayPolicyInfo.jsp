<%-- 
    Document   : displayPolicyInfo
    Created on : 21-Feb-2023, 7:11:18 pm
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
            <h6 class="display-6 fw-light" style="font-family: 'Lato'">Policy ID : ${policy.getPolicyId()}</h6>
            <div class="col-lg-6 mx-auto">
                <p class="lead mb-sm-2">
                Name : <b>${policy.getPolicyName()}</b> <br>
<!--                Phone Number : <b></b>-->
                Information : <b>${policy.getPolicyInfo()}</b><br>
               <br>
               
                </p>
<!--                <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                    <button type="submit" class="btn btn-primary btn-lg px-4 gap-3" name="fnolId" value='${fnol.getFnolId()}' onclick="approveFnol()">Approve</button>
                    <button type="button" class="btn btn-outline-secondary btn-lg px-4">Reject</button>
                </div>-->
            </div>
        </div>
        
    </body>
</html>
