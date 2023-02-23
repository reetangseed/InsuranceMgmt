
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
        <!-- Custom styles for this template -->
        <link href="css/signin_2.css" rel="stylesheet">
        <!--        <link href="css/menu_css.css" rel="stylesheet">-->

    </head>
    <%@taglib prefix="s" uri="/struts-tags"%> 
    <body class="text-center">


        <main class="form-signin w-100 m-auto">
            <form action="Login" method="post">
                <img class="mb-3" src="images/logo.png" alt="company logo" width="150" height="150">
                <h1 class="h3 mb-3 fw-normal" style="font-family: 'Playfair Display'">Account Login</h1>

                <!--                <h3 class="alert-danger">
                                    
                                </h3>-->


                <c:if test='${ErrorMsg != null}'>
                    <div class="alert alert-danger" role="alert">
                        <Strong> WRONG EMAIL OR PASSWORD </strong> 
                    </div>
                </c:if>
                <div class="form-floating">
                    <input name="emailAddress" type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Email Address</label>
                </div>
                <div class="form-floating">
                    <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>

                <!--                <div class="checkbox mb-3">
                                    <label>
                                        <input type="checkbox" value="remember-me"> Remember me
                                    </label>
                                </div>-->
                <button class="w-100 btn btn-lg btn-primary" style="background-color:black; border: none ; color: white;font-family: 'Playfair Display'" type="submit">Sign in</button>

                <!--<a href="PreSignUp" class = "w-36 p-3" style="color: #FAFAD2" type="submit"> New Account? Sign Up </a>-->
            </form>
            <p class="mt-5 mb-3 text-muted">2023&copy;2024</p>

        </main>



    </body>
</html>
