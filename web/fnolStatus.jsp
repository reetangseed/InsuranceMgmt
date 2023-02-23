<%-- 
    Document   : fnolDetails
    Created on : 18-Feb-2023, 3:42:14 pm
    Author     : Preyangsee
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:if test='${User == null}'>
    <c:redirect url="login.jsp"/>
</c:if>
    <jsp:include page="newmenu.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <script>
        function approveFnol(){
            $.ajax({
                url: "ApproveUnderwriter"            
                success: function (responseText) {
                    alert(responseText);
                     $("#" + "updated").html(responseText);
                                
                }
            });
        }
    </script>
    <body>
        <div id="updated">
        <%--<c:if test='${FnolList!=null}'>--%>
            <c:forEach items='${fnolStatus}' var="fnol">
<!--                <div class="container-lg">
                    <p>"User First Name" : ${fnol.getFirstName()}</p>
                </div>-->
<!--<div class="bg-light p-5 rounded">
    <h1 class="display-6 fw-light"style="font-family: 'Lato'">FNOL ID : ${fnol.getFnolId()}</h1>
    <p class="lead">This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>
    <a class="btn btn-lg btn-primary" href="/docs/5.3/components/navbar/" role="button">View navbar docs &raquo;</a>
  </div>-->
<div class="px-4 py-5 my-5 text-center bg-light p-5 rounded">
    <!--<img class="d-block mx-auto mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->
    <h6 class="display-6 fw-light" style="font-family: 'Lato'">FNOL ID : ${fnol.getFnolId()}</h6>
    <div class="col-lg-6 mx-auto">
        <p class="lead mb-sm-2">
        <h6 class="fw-light">GENERAL INFORMATION</h6>
            Name : <b>${fnol.getFirstName()} ${fnol.getLastName()}</b> <br>
            Phone Number : <b>${fnol.getPhoneNumber()}</b>
            Email Address : <b>${fnol.getEmailAddress()}</b><br>
            <br>
        <h6 class="fw-light">LOSS INFORMATION</h6>
        Car Model : <i>${fnol.getCarModel()}</i> Car Number : <i>${fnol.getCarNumber()}</i> Car Age : <i>${fnol.getCarAge()}</i><br>
        Driver Name : <b>${fnol.getDriverName()}</b> License Number : <b>${fnol.getDriverLicenseNumber()}</b> Phone Number : <b>${fnol.getDriverPhoneNumber()}</b><br>
        Date Of Damage : <b>${fnol.getDateOfDamage()}</b> Time : <i>${fnol.getTimeofDamage()}</i> Location : <b>${fnol.getLocationOfAccident()}</b> <br><!-- comment -->
        Details : <i>${fnol.getAccidentDetails()}</i> <br>
        </p>
        <br>
        <c:if test='${fnol.getUnderwriterStatus()==1}'>
                    <p class="fw-light" style="font-family: 'Playfair Display'"><span>&#10003;</span><i>Approved by Underwriter</i></p>
        </p>
        </c:if>
        <c:if test='${fnol.getUnderwriterStatus()==0}'>
                    <p class="fw-light" style="font-family: 'Playfair Display'"><span>&#33;</span><i>Pending</i></p>
        </p>
        </c:if>
        <c:if test='${fnol.getUnderwriterStatus()==-1}'>
                    <p class="fw-light" style="font-family: 'Playfair Display'"><span>&#10060;</span><i>Rejected. Contact Underwriter or Try Again!</i></p>
        </p>
        </c:if>
        <c:if test='${fnol.getInsuranceStatus()==1}'>
                    <p class="fw-light" style="font-family: 'Playfair Display'"><span>&#10003;</span><i>Approved by Professional</i></p>
        </p>
        </c:if>
        <c:if test='${fnol.getInsuranceStatus()==0}'>
                    <p class="fw-light" style="font-family: 'Playfair Display'"><span>&#33;</span><i>Pending</i></p>
        </p>
        </c:if>
        <c:if test='${fnol.getInsuranceStatus()==-1}'>
                    <p class="fw-light" style="font-family: 'Playfair Display'"><span>&#10060;</span><i>Rejected. Contact Underwriter or Try Again!</i></p>
        </p>
        </c:if>
        
        

        
<!--        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <a href=ApproveUnderwriter?fnolId=${fnol.fnolId}>
                <button type="button" class="btn btn-primary btn-lg px-4 gap-3" style="background-color: black">Approve</button>

            </a>
            <button type="submit" class="btn btn-primary btn-lg px-4 gap-3" name="fnolId" value='${fnol.getFnolId()}' onclick="approveFnol()">Approve</button>
            <a href=RejectUnderwriter?fnolId=${fnol.fnolId}>
                <button type="button" class="btn btn-outline-secondary btn-lg px-4">Reject</button>

            </a>
            
        </div>-->
    </div>
</div>
            </c:forEach>
        <%--</c:if>--%>
        </div>
    </body>
</html>
