<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title" rtexprvalue="true" required="true"%>
<%@ attribute name="head" fragment="true"%>
<%@ attribute name="content" fragment="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="aa"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="shortcut icon" type="image/png" href="img/icon.png">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,400,500,600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/style.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/master_old_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/scrollbar.css">
<title>Prospera Bank</title>
<%-- 
<script defer src="${pageContext.request.contextPath}/scripts/script.js"></script> --%>
<style>
.circular-image {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	overflow: hidden;
	display: inline-block;
}

.circular-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
	<header class="header">
		<nav class="nav" style="background-color: lightblue;">
			<img src="${pageContext.request.contextPath}/img/prospera_bank.png"
				alt="Bankist logo" class="nav__logo" id="logo"
				data-version-number="3.0">
			<aa:choose>
				<aa:when
					test="${sessionScope.user!=null || sessionScope.adminID!=null}">
					<ul class="nav__links">
						<li class="nav__item"><a class="nav__link" href="/deposit"
							style="color: #0000FF">Deposit</a></li>
						<li class="nav__item"><a class="nav__link" href="/withdraw"
							style="color: #0000FF">Withdraw</a></li>
						<li class="nav__item"><a class="nav__link" href="/transfer"
							style="color: #0000FF">Transfer</a></li>
						<li class="nav__item"><a class="nav__link" href="/transferDetails"
							style="color: #0000FF">Transfer Details</a></li>
						<li class="nav__item"><a class="nav__link"
							href="/transactionDetails" style="color: #0000FF">Transaction
								Details</a></li>
						<li class="nav__item"><a class="nav__link" href="/balance"
							style="color: #0000FF">Check Balance</a></li>
						<li class="nav__item">
							<div class="dropdown">
								<div class="circular-image">
									<img src="/img/profileimg.png" alt="Profile Pic">
								</div>
								<i class="fa fa-caret-down"></i>

								<!-- <button class="dropbtn">
									profile pic <i class="fa fa-caret-down"></i>
								</button> -->
								<div class="dropdown-content ">
									<a class="nav__link" href="http://localhost:9101/loginCustomer">profile</a>
									<a class="active" href="logout">Logout</a>
								</div>
							</div>
						</li>
					</ul>
				</aa:when>
				<aa:otherwise>
					<ul class="nav__links">
						<li class="nav__item"><a class="nav__link" href="/aboutus"
							style="color: #0000FF">About Us</a></li>
						<li class="nav__item"><a class="nav__link" href="/contactus"
							style="color: #0000FF">Contact Us</a></li>
						<li class="nav__item"><a class="nav__link" href="/help"
							style="color: #0000FF">Help</a></li>
						<li><div class="dropdown">
								<button class="dropbtn">
									Login <i class="fa fa-caret-down"></i>
								</button>
								<div class="dropdown-content">
									<a class="nav__link" href="http://localhost:9101/loginCustomer">User</a>
									<a class="nav__link" href="loginAdmin">Admin</a>
								</div>
							</div></li>
					</ul>
				</aa:otherwise>
			</aa:choose>
		</nav>

		<%-- <ul class="nav__links">
				<li class="nav__item"><a class="nav__link" href="#section--1">Features</a>
				</li>
				<li class="nav__item"><a class="nav__link" href="#section--2">Operations</a>
				</li>

				<li class="nav__item"><a class="nav__link" href="#section--3">About
						Us</a></li>
				
				
				<li class="nav__item"><aa:choose>
					<aa:when test="${sessionScope.user!=null || sessionScope.adminID!=null}">
						<a class="active" href="logout">Logout</a>
					</aa:when>
					<aa:otherwise>

						<div class="dropdown">
							<button class="dropbtn">
								Login <i class="fa fa-caret-down"></i>
							</button>
							<div class="dropdown-content ">
							
								<a class="nav__link" href="http://localhost:9101/loginCustomer">User</a>
								 <a class="nav__link" href="loginAdmin">Admin</a>
							</div>
						</div>
					</aa:otherwise>
				</aa:choose></li>
			</ul>
		</nav> --%>
		<!-- 
		<div class="header__title">
			<h1>
				When
				Green highlight effect
				<span class="highlight">banking</span> meets<br> <span
					class="highlight">minimalist</span>
			</h1>
			<h4>A simpler banking experience for a simpler life.</h4>
			<button class="btn--text btn--scroll-to">Learn more
				&DownArrow;</button>
			<img src="img/hero.png" class="header__img"
				alt="Minimalist bank items">
		</div> -->
	</header>

	<jsp:invoke fragment="content"></jsp:invoke>
</body>
</html>
