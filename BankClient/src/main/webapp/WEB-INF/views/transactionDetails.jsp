<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="Login">
	<jsp:attribute name="head">
	
<meta charset="ISO-8859-1">
</jsp:attribute>
	<jsp:attribute name="content">
	<a:if test="${not empty list}">
                <table style="border: 1px solid black";>
                    <tr>
                        <td>Transaction Id</td>
                        <td>Account No</td>
                        <td>Transaction Type</td>
                        <td>Date and Time</td>
                        <td>Amount</td>
                       <td>Remarks</td>                       
                   </tr>
                    <a:forEach items="${list}" var="v">
                        <tr>
                            <td class="userid">${v.transactionId }</td>
                            <td>${v.accountNo.accountNo }</td>
                            <td>${v.transactionType }</td>
                            <td>${v.timestamp }</td>
                            <td>${v.amount }</td>
                            <td>${v.remarks }</td>
                       </tr>
					</a:forEach>
				</table>	</a:if>
	<a:if test="${empty list}">
	<h1>No Transaction records found</h1>
	</a:if>
        </jsp:attribute></m:master>