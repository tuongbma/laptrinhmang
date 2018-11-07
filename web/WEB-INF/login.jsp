<%-- 
    Document   : login
    Created on : Nov 2, 2018, 9:45:01 AM
    Author     : buith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="form" action="login" method="post" onsubmit="return validate()">
            <table align="center">
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr> 
                    <td><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login"></input>
                        <input type="reset" value="Reset"></input></td>
                </tr>
            </table>
        </form>

    </body>
</html>
<script>
    function validate()
    {
        var username = document.form.username.value;
        var password = document.form.password.value;

        if (username == null || username == "")
        {
            alert("Username cannot be blank");
            return false;
        } else if (password == null || password == "")
        {
            alert("Password cannot be blank");
            return false;
        }
    }
</script> 
