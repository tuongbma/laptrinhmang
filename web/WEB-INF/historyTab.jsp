<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<div class="w3-container">
    <table align="center" >
        <tr id="firstRow">
            <th>No</th>
            <th>Rival</th>
            <th>Result</th>
            <th>Time</th>
        </tr>
        <c:forEach items="${listHistory}" var="match" begin="0" end="4">   
            <tr>
                <td></td>
                <td><c:out value="${match.getRivalName()}"/></td>
                <td><c:out value="${match.getResult()}"/></td>
                <td><c:out value="${match.getTime()}"/> ago</td>
            </tr>
        </c:forEach>
    </table>
</div>