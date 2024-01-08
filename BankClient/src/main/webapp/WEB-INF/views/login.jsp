<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<m:master title="Login">
	<jsp:attribute name="head">
<!-- javascript code here -->
<script src="${pageContext.request.contextPath}/scripts/LoginValidations.js" type="text/javascript" ></script>
</jsp:attribute>
	<jsp:attribute name="content">
	<div id="msg"></div>
	<form action="home" method="post">
	<table>
	<tr>
					<td>Login</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr><td><input type="submit" onclick="return Validate();"></td>
				<td><input type="reset"></td></tr>
	</table>
		</form>
	</jsp:attribute></m:master>
