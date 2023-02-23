<%-- 
    Document   : fnolDetails
    Created on : 18-Feb-2023, 3:42:14 pm
    Author     : Preyangsee
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <jsp:include page="menuInsuranceOfficer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
<!--    <script>
        function approveFnol(){
            $.ajax({
                url: "ApproveUnderwriter"            
                success: function (responseText) {
                    alert(responseText);
                     $("#" + "updated").html(responseText);
                                
                }
            });
        }
    </script>-->
<style>
        .tableFixHead {
        overflow-y: auto; /* make the table scrollable if height is more than 200 px  */
        height: 200px; /* gives an initial height of 200px to the table */
      }
      .tableFixHead thead th {
        position: sticky; /* make the table heads sticky */
        top: 0px; /* table head will be placed from the top of the table and sticks to it */
      }
      table {
        border-collapse: collapse; /* make the table borders collapse to each other */
        width: 100%;
      }
    </style>
    <script>
        function displayFnolDetail(id){
            
                alert("hello" + id);
            $.ajax({
                
                url: "GetFNOL",
                data:{
                    fnolId : id
                },
                success: function (responseText) {
                alert(responseText);
                $("#getDetails").html(responseText);
                }
            });
        }
        function approveFNOL(id){
            alert("hello" + id);
            $.ajax({
                
                url: "ApproveFNOL",
                data:{
                    fnolId : id
                },
                success: function (responseText) {
                alert(responseText);
                $("#table-body").html(responseText);
//                $.getScript('menuInsuranceOfficer.jsp', function () {          
//      loadFNOLDetails();  }); 
//  document.getElementById("menubar").style.display='none';
//      document.getElementById("table-body").style.display='none';

            //document.getElementById("display-body").style.display='none';
                //$("#table-body").html(responseText);
                }
            });
        }
        function rejectFNOL(id){
            alert("hello" + id);
            $.ajax({
                
                url: "RejectFNOL",
                data:{
                    fnolId : id
                },
                success: function (responseText) {
                alert(responseText);
                $("#table-body").html(responseText);
                //document.getElementById("display-body").style.display='none';
                                
                }
            });
        }
    </script>
   
       
                
<!--<div class="bg-light p-5 rounded">
    <h1 class="display-6 fw-light"style="font-family: 'Lato'">FNOL ID : ${fnol.getFnolId()}</h1>
    <p class="lead">This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>
    <a class="btn btn-lg btn-primary" href="/docs/5.3/components/navbar/" role="button">View navbar docs &raquo;</a>
  </div>-->

    <div id="table-body" class="tableFixHead">
        <c:if test='${FnolList!=null}'>
            
                
                <table id="dtDynamicVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0"
                    width="100%">
                         <tr style="font-family: 'Playfair Display'">
                                <th scope = "col">
                                    FNOL Id
                                </th>
                                <th scope = "col">
                                    First Name
                                </th>
                                <th scope = "col">
                                    Last Name
                                </th>
                                <th scope = "col">
                                    Date of Damage
                                </th>
                                <th scope = "col">
                                    Time
                                </th>
                                <th scope = "col">
                                    Underwriter Remarks
                                </th>
                                <th scope = "col">
                                    Status
                                </th>
                                <th scope = "col">
                                    Remarks
                                </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items='${FnolList}' var="fnol">
                               <tr style="font-family: 'Lato'">
                                    <td>
                                        ${fnol.getFnolId()}
                                    </td>
                                    <td>
                                        ${fnol.getFirstName()}
                                    </td>
                                    <td>
                                        ${fnol.getLastName()}
                                    </td>
                                    <td>
                                        ${fnol.getDateOfDamage()}
                                    </td>
                                    <td>
                                        ${fnol.getTimeofDamage()}
                                    </td>
                                    <td>
                                        <c:if test='${fnol.getUnderwriterStatus()==1}'>Approved</c:if>
                                        <c:if test='${fnol.getUnderwriterStatus()==0}'>Pending</c:if>
                                        <c:if test='${fnol.getUnderwriterStatus()==-1}'>Rejected</c:if>
                                    </td>
                                    <td>
                                        <c:if test='${fnol.getInsuranceStatus()==1}'>Approved</c:if>
                                        <c:if test='${fnol.getInsuranceStatus()==0}'>Pending</c:if>
                                        <c:if test='${fnol.getInsuranceStatus()==-1}'>Rejected</c:if>
                                    </td>
                                    <td>
                                        <button onclick="approveFNOL(<c:out value='${fnol.getFnolId()}'/>)" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'; padding-left: 3rem">Approve</button>
                                        <button onclick="rejectFNOL(<c:out value='${fnol.getFnolId()}'/>)" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'; padding-left: 3rem">Reject</button>
                                    </td>
                                    
                                   </tr>  
                        </c:forEach>
                </table>
               
                
        </c:if>
    </div>

        <div id = "getDetails"></div>

