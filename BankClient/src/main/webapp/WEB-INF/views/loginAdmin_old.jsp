<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Admin login">
	<jsp:attribute name="head">
	
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
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
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

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
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
<h2>Login Form</h2>

	<p>${msg}</p>
<form action="loginAdmin1" method="post">
  <div class="imgcontainer">
    <img src="${pageContext.request.contextPath}/images/login.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="adminId"><b>AdminId</b></label>
    <input type="text" placeholder="Enter adminId" name="adminId" id="adminId" required="required" >

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" id="password" required="required">
        
    <button type="submit">Login</button>
  </div>
<!-- 
  <div class="container" style="background-color:#f1f1f1">
    <button type="submit" class="cancelbtn" onclick="insertCustomer">Register new user</button>
  </div> -->
</form>

		</jsp:attribute></m:master>
