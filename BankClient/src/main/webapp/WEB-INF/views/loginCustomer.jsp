<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Customer login">
	<jsp:attribute name="head">
	
	<script>
	function home() {
	window.location.href="http://localhost:9101/home";
}
	</script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}
.cancelbtn:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
  color: white;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 20%;
  border-radius: 30%;
}

.container {
  padding: 16px;
}

span.password {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.password {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</jsp:attribute>
	<jsp:attribute name="content">
<h2>User Login Form</h2>
<h1 id="${msg }"></h1>
	<a:out value="${msg }"></a:out>
	<form action="main" method="post">
		<button class="btn--close-modal" onclick="home();">&times;</button>
  <div class="imgcontainer">
    <img src="${pageContext.request.contextPath}/images/login.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="uname"><b>User Id</b></label>
    <input type="text" placeholder="Enter UserId" name="userId" id="userId" required="required">

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" id="password" required="required">
        
    <button type="submit" >Login</button>
    <button type="reset">reset</button>
  </div>
  <div class="container" style="background-color:#f1f1f1">
    <a href="insertCustomer" class="cancelbtn" style="text-decoration:none"	>Register new user</a>
  </div>
</form>

		</jsp:attribute></m:master>
