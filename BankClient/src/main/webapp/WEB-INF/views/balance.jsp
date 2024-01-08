<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Withdraw">
    <jsp:attribute name="head">
    	
</jsp:attribute>
    <jsp:attribute name="content">
    <h1>Your balance is <a:out value="${b}"></a:out> </h1>
        </jsp:attribute></m:master>