<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title" rtexprvalue="true" required="true"%>
<%@ attribute name="head" fragment="true"%>
<%@ attribute name="content" fragment="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.active {
	background-color: #04AA6D;
}

.active:hover {
	opacity: 0.8;
}

li a:hover:not(.active) {
	background-color: #d4d4d4;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 17px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: #04AA6D;
	font-family: inherit;
	margin: 0;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.topnav a:hover, .dropdown:hover .dropbtn {
	background-color: #555;
	color: white;
}

.dropdown-content a:hover {
	background-color: #ddd;
	color: black;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>

</head>
<body bgcolor="#9CECEF">
	<div style="position: absolute; width: 100%; height: 10%">
		<img src="${pageContext.request.contextPath}/images/t.png"
			style="width: 30%; height: 100%">
	</div>
	<!-- <div style="position: absolute; width: 10%; height: 100%; left: 0%;top: 15%; background-color: orange; ">
<table>
<tr><td><a href="aboutus">About Us</a></td></tr>
<tr><td><a href="services">Services</a></td></tr>
<tr><td><a href="login">Login</a></td></tr>
</table>
</div> -->
	<div style="position: absolute; width: 100%; left: 0%; top: 11%;">
		<ul>
			<li><a href="aboutus">About Us</a></li>
			<li><a href="services">Services</a></li>
			<li style="float: right"><a:choose>
					<a:when
						test="${sessionScope.user!=null || sessionScope.adminID!=null}">
						<a class="active" href="logout">Logout</a>
					</a:when>
					<a:otherwise>

						<div class="dropdown">
							<button class="dropbtn">
								Login <i class="fa fa-caret-down"></i>
							</button>
							<div class="dropdown-content">
								<a href="loginCustomer">User</a> <a href="loginAdmin">Admin</a>
							</div>
						</div>
					</a:otherwise>
				</a:choose></li>
		</ul>
	</div>


	<jsp:invoke fragment="head"></jsp:invoke>
	<!-- <div style="position: absolute; width: 20%; height: 100%; left: 20%;top: 15%; background-color: blue; "> -->
	<div
		style="position: absolute; width: 70%; background-color: pink; height: 100%; left: 15%; top: 20%; border: 5px solid; border-left-color: blue; border-right-color: yellow; border-top-color: green; border-bottom-color: red; margin: auto; padding: 10px">

		<a:if test="${sessionScope.username!=null}">
			<h3>welcome ${sessionScope.username}</h3>
		</a:if>
		<jsp:invoke fragment="content"></jsp:invoke></div>
</body>
</html>