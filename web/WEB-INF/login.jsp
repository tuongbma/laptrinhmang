<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Login Site</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
  
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>

    <link rel="stylesheet" href="public/css/style.css">

  
</head>

<body>

  <div class="cont">
  <div class="demo">
    <div class="login">
      <div class="login__check"></div>
      <form class="login__form" name="form" action="login" method="post" onsubmit="return validate()">
        <div class="login__row">
          <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          </svg>
          <input type="text" name="username" class="login__input name" placeholder="Username"/>
        </div>
        <div class="login__row">
          <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
          </svg>
          <input type="password" name="password" class="login__input pass" placeholder="Password"/>
        </div>
        <button type="submit" class="login__submit" value="Login">Sign in</button>
        <p class="login__signup">Don't have an account? &nbsp;<a>Sign up</a></p>
        </form>
    </div>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="public/js/index.js"></script>
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
