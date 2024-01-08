<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="Login">
	<jsp:attribute name="head">
</jsp:attribute>
	<jsp:attribute name="content">
		<f:form modelAttribute="A">
		<table>
			<tr>
				<td>Account Number</td>
				<td><f:input path="accountNo" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Account Name</td>
				<td><f:input path="accountName" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Balance</td>
				<td><f:input path="balance" readonly="readonly" /></td>
			</tr>
		</table>
	</f:form>
	<a href="main">Back to home page</a>
	<p>
	${msg }</p>
		</jsp:attribute></m:master>
