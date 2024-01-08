<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="Login">
	<jsp:attribute name="head">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".status").click(function() {
			var a = $(this).val();
			a = a + "ed";
			var b = $(this).closest("tr").find(".userid").text();
			var $myDiv = $(this).closest("tr");
			$.ajax({
				type : "PUT",
				url : "http://localhost:9100/updateCustomer/" + a + "/" + b,
				dataType : "text",
				async : false,
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					$myDiv.hide();
				},
				error : function(x, err) {
					alert("readyState " + x.readyState);
					alert("responseText " + x.responseText);
				}
			});//end of ajax
		});//end of accept
	});
</script>
<meta charset="ISO-8859-1">
</jsp:attribute>
	<jsp:attribute name="content">
	<a:if test="${not empty list}">
				<table>
					<tr>
						<td>User Id</td>
						<td>First Name</td>
						<td>Last Name</td>
						<td>Mail Id</td>
						<td>Phone Number</td>
						<td>Date Of Birth</td>
						<td>Gender</td>
						<td>Password</td>
						<td>Address</td>
					</tr>
					<a:forEach items="${list}" var="v">
						<tr>
							<td class="userid">${v.userId }</td>
							<td>${v.firstName }</td>
							<td>${v.lastName }</td>
							<td>${v.mailId }</td>
							<td>${v.phoneNo }</td>
							<td>${v.dateOfBirth }</td>
							<td>${v.gender }</td>
							<td>${v.address }</td>
							<td><input type="button" class="status" value="Accept"></td>
							<td><input type="button" class="status" value="Reject"></td>
						</tr>
					</a:forEach>
				</table>	</a:if>
	<a:if test="${empty list}">
	<h1>No pending records found</h1>
	</a:if>
		</jsp:attribute></m:master>