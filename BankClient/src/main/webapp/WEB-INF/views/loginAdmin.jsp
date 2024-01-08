<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Admin login">
	<jsp:attribute name="head">
       <!--  <style>

body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0; /* Remove default margin */
    padding: 0; /* Remove default padding */
    
    /* ... other styles ... */
}
.login-container {
    width: 80%;
    height:90%
   	display: flex;
   
    margin: 0% auto 0; /* Center the container horizontally */
   	 padding: 20px;
    background-image: url('/img/hero.png');
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 80%; /* Adjust the maximum width as needed */
}

h2 {
	align: center;
	text-align:center;
	font-size: 100%; /* Adjust font size */
	color: #333; /* Set headline color */
	margin-bottom: 20%;
	font-size: 28%; /* Add space after headline */ 
	 background-image: linear-gradient(to top left, #B19CD9, #D4A2E1);
	 transform: scale(1.07, 1.05) skewX(-10deg);
	
}

.login-form {
	display: flex;
	 /* Center horizontally */
	justify-content: center;
	align-items: center;
	text-align: left; /* Center the form horizontally */
	 /* Add some space from the top */
}


 .container {
	width: 50%; /* Set a fixed width for the container */
	height: 80%;
	padding: 5%;
	background-color: #f1f1f1;
	border-radius: 1%;
	box-shadow: 0 4rem 6rem rgba(0, 0, 0, 0.3);
	z-index: 1000;
	transition: all 0.5s;
} 




/* Styling for input fields */
.container input[type="text"],
.container input[type="password"] {
    width: 100%;
    padding: 2%;
    margin-bottom: 5%;
    border: none;
    border-radius: 4%;
    border: 5% solid #CCC;
    background-color: #FFF; /* Input background color */
}

/* Styling for the login button */
.container button.login-button {
    background-color: #3498DB;
    color: #FFF;
    border: none;
    border-radius: 45;
    padding: 3% 3%;
    cursor: pointer;
}

.container button.login-button:hover {
    background-color: #2980B9;
}

/* Additional styling as needed */




label {
	font-weight: bold;
	color: black;
	font-size: 175%;
	font-family: Arial, Helvetica, sans-serif;
	display: block; /* Display labels on separate lines */
	margin-bottom: 2%;
}


button.login-button {
	background-color: #E6E6FA;
	color: white;
	padding: 12%;
	border: none;
	border-radius: 4%;
	cursor: pointer;
	width: 30%;
	font-weight: bold;
	text-align: center;
	margin-top:10%
}

button.login-button:hover {
	opacity: 0.8;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 3%; /* Adjusted padding */
	margin: 2% 0; /* Adjusted margin */
	border: 1% solid #737373;
	box-sizing: border-box;
}



.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 10px 0 12px 0;
}

img.avatar {
	width: 20%;
	border-radius: 30%;
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
</style> -->
    </jsp:attribute>
	<jsp:attribute name="content">
        
        <p>${msg}</p>
>
        <div class="login-container">
        <form action="loginAdmin1" method="post" class="login-form">
        	
   			<div class="container">
   			<h2 class=" modal__header">Login Form</h2>
        		<label for="adminId"><b>Admin Id</b></label>
        		<input type="text" placeholder="Enter adminId" name="adminId"
					id="adminId" required="required">

       		 	<label for="password"><b>Password</b></label>
        		<input type="password" placeholder="Enter Password"
					name="password" id="password" required="required">

        		<button type="submit" class="login-button">Login</button>
   			 </div>
		</form>
		</div>
        
    </jsp:attribute>
</m:master>
