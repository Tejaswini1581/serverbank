<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Login">
	<jsp:attribute name="head">
	<script>
	function home() {
	window.location.href="http://localhost:9101/home";
}
	</script>
	</jsp:attribute>
	<jsp:attribute name="content">
	
	<div class="example">
		<div class="modal hidden">
		<button class="btn--close-modal" onclick="home();">&times;</button>
		<h2 class="modal__header">
			Open your bank account <br> in just <span class="highlight">5
				minutes</span>
		</h2>
		<f:form action="insertCustomer1" modelAttribute="C" class="modal__form">
			<label>User Id</label>
			 <f:input path="userId" required="true" /><f:errors path="userId" />
			 <label>First Name</label> 
			 <f:input path="firstName"  required="true" /><f:errors path="firstName" />
			 <label>Last Name</label>
			  <f:input path="lastName"  required="true" /><f:errors path="lastName" />
			 <label>Email Address</label> 
			 <f:input path="mailId"  required="true" /><f:errors path="mailId" />
			 <label>Phone Number</label> 
			 <f:input path="phoneNo" required="true"  /><f:errors path="phoneNo" />
			<label>Date Of Birth</label> 
			<f:input path="dateOfBirth"  required="true"  type="Date"/><f:errors path="dateOfBirth" />
			 <label>Gender</label>
			  <f:select path="gender" required="true" >
						<f:option value="">select</f:option>
						<f:option value="Male" />
						<f:option value="Female" />
						<f:option value="Transgender" />
						<f:option value="Others" />
					</f:select><f:errors path="gender" />
			 <label for="password">Password</label>
			<div class="password-input-container">
			<f:input type="password" path="password" class="password-input" placeholder="Enter your password" required="true" /><f:errors path="password" />
				 <span class="password-toggle" id="password-toggle"> 
				 <i class="fas fa-eye"></i>
				</span>
			</div>
			<label>Address</label>
			<f:input path="address"  required="true" /><f:errors path="address" />
			<button type="submit" class="btn">Register &rarr;</button>
		</f:form>
	</div>	
	</div>
	<div class="overlay hidden"></div>
	<p>${msg }</p>
	</jsp:attribute></m:master>