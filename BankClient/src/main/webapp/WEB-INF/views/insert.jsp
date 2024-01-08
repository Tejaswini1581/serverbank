<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="insertPrepared">
	<table>
		<tr>
			<th>Empno</th>
			<th>Ename</th>
			<th>Gender</th>
			<th>Date of Birth</th>
		</tr>
		<tr><td>Empno</td><td><input type="text" name="number"></td></tr>
		<tr><td>Ename</td><td><input type="text" name="name"></td></tr>
		<tr><td>Job</td><td><input type="text" name="job"></td></tr>
		<tr><td>Mgr</td><td><input type="text" name="mgr"></td></tr>
		<tr><td>Hiredate</td><td><input type="text" name="hiredate"></td></tr>
		<tr><td>sal</td><td><input type="text" name="sal"></td></tr>
		 <tr><td>Deptno</td><td><input type="text" name="deptno"></td></tr>
		<tr><td><input type="submit" name="insert"></td></tr>
	</table></form>
	<a:out value="${messsage}"></a:out>
</body>
</html>