<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Login">
	<jsp:attribute name="head">
<!-- javascript code here -->



</jsp:attribute>
	<jsp:attribute name="content">
	<a:out value="${msg }"></a:out>
	<form action="main" method="post">
	<table>
	<tr>
					<td>UserId</td>
					<td><input type="text" name="userId" id="userId" required="required" ></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" id="password" required="required" ></td>
				</tr>
				<tr>
					<td><input type="submit"></td>
				<td><input type="reset"></td>
	</tr>
	</table>
		</form>
	</jsp:attribute>
</m:master>
