<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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