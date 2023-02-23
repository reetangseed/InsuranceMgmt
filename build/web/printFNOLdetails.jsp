<%-- 
    Document   : printFNOLdetails
    Created on : 21-Feb-2023, 6:44:51 pm
    Author     : Preyangsee
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function getPolicyDetails(id){
            //alert("hello" + id);
            $.ajax({
                
                url: "GetPolicyDetails",
                data:{
                    policyId : id
                },
                success: function (responseText) {
                //alert(responseText);
                $("#policyDetails").html(responseText);
                }
            });
        }
        function getDriverDetails(id){
            //alert("hello" + id);
            $.ajax({
                
                url: "SearchDriver",
                data:{
                    driverLicenseNumber : id
                },
                success: function (responseText) {
                //alert(responseText);
                $("#driverDetails").html(responseText);
                }
            });
        }
        function approveFNOL(id){
            //alert("hello" + id);
            $.ajax({
                
                url: "ApproveUnderwriter",
                data:{
                    fnolId : id
                },
                success: function (responseText) {
                //alert(responseText);
                $.getScript('menuUnderwriter.jsp', function () {          
      loadFNOLDetails();  
});  
            document.getElementById("display-body").style.display='none';
                //$("#table-body").html(responseText);
                }
            });
        }
        function rejectFNOL(id){
            //alert("hello" + id);
            $.ajax({
                
                url: "RejectUnderwriter",
                data:{
                    fnolId : id
                },
                success: function (responseText) {
                //alert(responseText);
                //document.getElementById("display-body").style.display='none';
                $.getScript('menuUnderwriter.jsp', function () {          
      loadFNOLDetails();  
});  
            document.getElementById("display-body").style.display='none';
                
                }
            });
        }
        
    </script>
    <body id="display-body">
        <div class="container btn-outline-light">
            <div class="row">
                <div class="col-md-3">
         <div class="mx-auto">
        <p class="lead mb-sm-3">
        <h6>FNOL ID : ${fnol.getFnolId()}</h6>
        <h6 class="fw-light">GENERAL INFORMATION</h6>
            Name : <b>${fnol.getFirstName()} ${fnol.getLastName()}</b> <br>
            Phone Number : <b>${fnol.getPhoneNumber()}</b><br>
            Email Address : <b>${fnol.getEmailAddress()}</b><br>
            <br>
        <h6 class="fw-light">LOSS INFORMATION</h6>
        Car Model : <i>${fnol.getCarModel()}</i> <br> Car Number : <i>${fnol.getCarNumber()}<br></i> Car Age : <i>${fnol.getCarAge()}</i><br>
        Driver Name : <b>${fnol.getDriverName()}</b><br> License Number : <b>${fnol.getDriverLicenseNumber()}</b><br> Phone Number : <b>${fnol.getDriverPhoneNumber()}</b><br>
        Date Of Damage : <b>${fnol.getDateOfDamage()}</b><br> Time : <i>${fnol.getTimeofDamage()}</i><br> Location : <b>${fnol.getLocationOfAccident()}</b><br>
        Details : <i>${fnol.getAccidentDetails()}</i> <br>
        <p class="fw-light" style="font-family: 'Playfair Display'"><b>POLICY ID : ${fnol.getPolicyId()}</b></p>
        </p>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <button type="button" onclick="getPolicyDetails(<c:out value='${fnol.getPolicyId()}'/>)" class="btn btn-outline-dark btn-sm px-1 py-2 gap-3" style="background-color: #EEE8AA;  border: none; font-family: 'Lato'">Check Policy Status</button>
          <button type="button" onclick="getDriverDetails(<c:out value='${fnol.getDriverLicenseNumber()}'/>)" class="btn btn-outline-dark btn-sm px-1 py-2 gap-3" style="background-color: #EEE8AA;border: none; font-family: 'Lato'">Check License Status</button>

            
        </div>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <button type="button" onclick="approveFNOL(<c:out value='${fnol.getFnolId()}'/>)" class="btn btn-primary btn-outline-light btn-lg px-4 gap-3" style="background-color: black">Approve</button>
            <button type="button" onclick="rejectFNOL(<c:out value='${fnol.getFnolId()}'/>)" class="btn btn-outline-secondary btn-lg px-4">Reject</button>
            
        </div>
    </div>
                </div>
                <div class="col">
                    <div id="policyDetails"></div>
                </div>
                <div class="col">
                    <div id="driverDetails"></div>
                </div>
            </div>
        </div>
    </body>
</html>
