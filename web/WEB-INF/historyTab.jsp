<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<div class="w3-container">
    <table align="center" >
        <tr>
            <th>No</th>
            <th>Rival</th>
            <th>Result</th>
            <th>Time</th>
        </tr>
        <% int j = 1; %>
        <c:forEach items="${listHistory}" var="item">   
            <tr>
                <td><c:out value="<%= j++ %>"/></td>
                <td><c:out value="${item.getUsernamePlayer2()}"/></td>
                <c:if test="${item.getResult() == user.getID()}">
                    <td>WIN</td>
                </c:if>
                <c:if test="${item.getResult() != user.getID()}">
                    <td>LOSE</td>
                </c:if>
                <c:if test="${item.getResult() == 0}">
                    <td>TIE</td>
                </c:if>
                <td><c:out value="${item.getTime()}"/> ago</td>
        </tr>
        </c:forEach>
    </table>
</div>