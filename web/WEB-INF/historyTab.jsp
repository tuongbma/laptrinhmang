<div class="w3-container">
    <p><b>History</b></p>
    <table align="center" >
        <tr>
            <th>No</th>
            <th>Username Player 1</th>
            <th>Username Player 2</th>
            <th>Result</th>
            <th>Start time</th>
            <th>End time</th>
        </tr>
        <c:forEach items="${listHistory}" var="item">   
            <tr>
                <!--<td><c:out value="<%= i++%>"/></td>-->
                <td><c:out value="${item.getUsername1()}"/></td>
                <td><c:out value="${item.getUsername2()}"/></td>
                <td><c:out value="${item.getResult()}"/></td>
                <td><c:out value="${item.getStartTime()}"/></td>
                <td><c:out value="${item.getEndTime()}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>