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
        <c:forEach items="${listHistory}" var="match">   
            <tr>
                <td><c:out value="<%= j++ %>"/></td>
                <td><c:out value="${match.getRivalName()}"/></td>
                <td><c:out value="${match.getResult()}"/></td>
                <td><c:out value="${match.getTime()}"/> ago</td>
        </tr>
        </c:forEach>
    </table>
</div>