<%-- 
    Document   : fnolDetails
    Created on : 18-Feb-2023, 3:42:14 pm
    Author     : Preyangsee
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <jsp:include page="menuUnderwriter.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
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
<!--    <style>
        table.dataTable thead .sorting:after,
        table.dataTable thead .sorting:before,
        table.dataTable thead .sorting_asc:after,
        table.dataTable thead .sorting_asc:before,
        table.dataTable thead .sorting_asc_disabled:after,
        table.dataTable thead .sorting_asc_disabled:before,
        table.dataTable thead .sorting_desc:after,
        table.dataTable thead .sorting_desc:before,
        table.dataTable thead .sorting_desc_disabled:after,
        table.dataTable thead .sorting_desc_disabled:before {
            bottom: .5em;
        }

    </style>-->
    
<!--
     <script>
            $(document).ready(function () {
            $('#dtDynamicVerticalScrollExample').DataTable({
            "scrollY": "50vh",
            "scrollCollapse": true
            });
             $('.dataTables_length').addClass('bs-select');
        });
        </script>-->
    <script>

        function displayFnolDetail(id){
            
                //alert("hello" + id);
            $.ajax({
                
                url: "GetFNOLDetail",
                data:{
                    fnolId : id
                },
                success: function (responseText) {
                //alert(responseText);
                $("#getDetails").html(responseText);
                }
            });
        }
        function approveFnol(){
            $.ajax({
                url: "ApproveUnderwriter",         
                success: function (responseText) {
                    alert(responseText);
                    $("#" + "updated").html(responseText);
                                
                }
            });
        }
        
        
    </script>
   
    <div id="table-body" class="tableFixHead">
        <c:if test='${FnolList!=null}'>
            
                
                <table id="dtDynamicVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0"
                    width="100%">
                    <thead>
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
                                    Status
                                </th>
                                <th scope = "col">
                                    Details
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
                                        <button onclick="displayFnolDetail(<c:out value='${fnol.getFnolId()}'/>)" class="nav-link px-2 text-black" style="font-family: 'Playfair Display'; padding-left: 3rem">Check</button>
                                    </td>
                                    
                                   </tr>  
                        </c:forEach>
                </table>
               
                
        </c:if>
    </div>
            <div id="getDetails">    
            </div>