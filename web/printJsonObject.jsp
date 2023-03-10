<%-- 
    Document   : landingPage
    Created on : 22-Dec-2022, 12:00:33 PM
    Author     : Avijit Chattopadhyay
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%--<c:if test='${user == null}'>--%>
            <%--<c:redirect url="login.jsp"/>--%>
        <%--</c:if>--%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link href="css/header.css" rel="stylesheet">-->
<!--        <link rel="stylesheet" href="css/all.min.css">
        <link rel="stylesheet" href="css/reset-min.css">
        <link rel="stylesheet" href="css/algolia-min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/docs.min.css">
        <link rel="stylesheet" href="css/index.css">-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/product.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <title>Active Policies</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/>
        <style>
            #example_wrapper{
                width: 75%;
                display: block;
                margin: auto;
            }
        </style>
    </head>
    
    <body>
        <main>
    
    <!<!-- I want to check my session before showing any content to the user -->

    
    


    <jsp:include page="menuUnderwriter.jsp"></jsp:include>
    
<!--        <div class="form-group"> 			Show Numbers Of Rows 		
        <h6 style="color:black; font-family: 'Lato'"><b>Entries</b></h6>

        <select class  ="form-control" name="state" id="maxRows" style="width:80px; height: 40px; display: inline-flex">
            <option value="5000">Show ALL Rows</option>
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="50">50</option>
            <option value="70">70</option>
            <option value="100">100</option>
        </select>		 		
    </div>-->

   
<!--        <div id="example">
            <script>
                init({
                    title: 'Large data',
                    desc: 'Use `virtualScroll` to enable the virtual scroll to play with large data sets (10000 rows).',
                    links: ['bootstrap-table.min.css'],
                    scripts: ['bootstrap-table.min.js']
                })
            </script>-->



<!--            <div class="bootstrap-table bootstrap5">
                <div class="fixed-table-toolbar"><div class="bs-bars float-left">

                    </div><div class="columns columns-right btn-group float-right"><div class="keep-open btn-group" title="Columns">
                            <div class="dropdown-menu dropdown-menu-right" style=""><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="id" value="0" checked="checked"> <span>ID</span></label><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="name" value="1" checked="checked"> <span>Item Name</span></label><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="price" value="2" checked="checked"> <span>Item Price</span></label></div></div></div></div>

                <div class="fixed-table-container fixed-height" style="height: 542px; padding-bottom: 50.5px;">-->
<br>
                    <div class="table-body">
                        <table id="example" class="table table-bordered table-hover bg-light px-4 py-5" style="margin-top: -9.5px; background-color: #808080">
                            <thead><!--
                            <%--<c:choose>--%>
                                <%--<c:when test = "${requestScope.noData != null}">--%>
                                    <tr>
                                        <td colspan="5">
                                            <h2 style="border:2px solid rgb(255, 99, 71); background-color:rgba(255, 99, 71, 0.5); font-size:15px;">
                                                <%--<c:out value="${requestScope.noData}"> </c:out>--%>
                                                </h2>
                                            </td>
                                        </tr>
                                <%--</c:when>--%>
                            <%--</c:choose>--%>
                            -->                            <tr style="font-family: 'Playfair Display'">
                                <th scope = "col">
                                    Policy Id
                                </th>
                                <th scope = "col">
                                    Policy Name
                                </th>
                                <th scope = "col">
                                    Policy Description
                                </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${PolicyList}" var="policy">
                               <tr style="font-family: 'Lato'">
                                    <td>
                                        ${policy.getPolicyId()}
                                    </td>
                                    <td>
                                        ${policy.getPolicyName()}
                                    </td>
                                    <td>
                                        ${policy.getPolicyInfo()}
                                    </td>
                                    
                                    
                                   </tr>
                            </c:forEach>

                     </tbody>
                    </table>
                            
                            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                            <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
                            <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
                            <script>
                                $(document).ready(function () {
                                    $('#example').DataTable();
                                });
                            </script>
<%--<jsp:include page="pagination.jsp"></jsp:include>--%>

                    <!--<script src="tablepagination.js"></script>-->
                    
                    
<!--                    <div class="fixed-table-footer" style="display: none;"></div>
                </div>
                <div class="fixed-table-pagination" style="display: none;"></div>
            </div>
            <div class="clearfix"></div>-->

<!--            <script>
                var $table = $('#table');
                var total = 0;

                function getData(number, isAppend) {
                    if (!isAppend) {
                        total = 0;
                    }
                    var data = [];
                    for (var i = total; i < total + number; i++) {
                        data.push({
                            'id': i,
                            'name': 'Item ' + i,
                            'price': '$' + i
                        })
                    }
                    if (isAppend) {
                        total += number;
                    } else {
                        total = number;
                    }
                    $('#total').text(total);
                    return data;
                }

                function mounted() {
                    $table.bootstrapTable({data: getData(20)});

                    $('#load').click(function () {
                        $table.bootstrapTable('load', getData(10000));
                    })

                    $('#append').click(function () {
                        $table.bootstrapTable('append', getData(10000, true));
                    });
                }
            </script>-->
        </div>

</main></body>
</html>
