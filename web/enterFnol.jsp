
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test='${User == null}'>
    <c:redirect url="login.jsp"/>
</c:if>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>Edit Employee</title>
    
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

    

    

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/menu_css.css" rel="stylesheet">
<link href="css/product.css" rel="stylesheet">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    

    
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
      <jsp:include page="newmenu.jsp"></jsp:include>
      
      <style>
          .box {
              overflow-wrap: break-word;
          }
          </style>
    
<main class="form-signin w-100 m-auto">
    <c:if test='${successmsg != null}'>
            <div class="alert alert-success" role="alert">
            <Strong> SUCCESS!! </strong> Await for confirmation. 
            </div>
        </c:if>
    <c:if test='${errormsg != null}'>
            <div class="alert alert-danger" role="alert">
            <Strong> ERROR!! </strong> TRY AGAIN. 
            </div>
        </c:if>
  <form action="InsertFnol" method="Post">
    <!--<img class="mb-4" src="images/image.png" alt="company logo" width="150" height="57">-->
    <h1 class="h4 mb-3 fw-normal" style="font-family: 'Playfair Display'">First Notice Of Loss</h1>

    <div class="container-md">
    <div class="form-floating">
        <input type="text" class="form-control" id="floatingInput" placeholder="User ID" name="userId" readonly value="${User.getUserId()}">
        
      <label for="floatingInput">User ID</label>
    </div>    
    <div class="form-floating">
        <input type="text" class="form-control" id="floatingInput" placeholder="Policy ID" name="policyId" required>
      <label for="floatingInput">Policy ID</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Car Model" name="carModel" required>
      <label for="floatingInput">Car Model</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Car Number" name="carNumber" required>
      <label for="floatingInput">Car Number</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Car Age" name="carAge" required>
      <label for="floatingInput">Car Age</label>
    </div>
        
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Driver Name" name="driverName" required>
      <label for="floatingInput">Driver Name</label>
    </div>
    
    <div class="form-floating">
        <input type="text" class="form-control" id="floatingInput" placeholder="Driver License Number" name="driverLicenseNumber" required>
      <label for="floatingInput">Driver License Number</label>
    </div>
        
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Driver Phone Number" name="driverPhoneNumber" required>
      <label for="floatingInput">Driver Phone Number</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="dd-mm-yyyy" name="dateOfDamage" required>
      <label for="floatingInput">Date Of Damage</label>
    </div>
  
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="00:00" name="timeofDamage" required>
      <label for="floatingInput">Time Of Damage</label>
    </div>
  
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Location Of Accident" name="locationOfAccident" required>
      <label for="floatingInput">Location Of Accident</label> 
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Details Of Accident" name="accidentDetails" required>
      <label for="floatingInput">Accident Details</label> 
    </div>
  
      
    <button class="w-100 btn btn-lg btn-primary" style="background-color: black; border: none; font-family: 'Plyfair Display'" type="submit">Save</button>
    </div>
  </form>

</main>


    
  </body>
</html>
