<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:master title="TransferDetails">
	<jsp:attribute name="head">
	
<meta charset="ISO-8859-1">
</jsp:attribute>
	<jsp:attribute name="content">
	<a:if test="${not empty list}">
                <table style="border: 1px solid black";>
                    <tr>
                        <td>Transfer Id</td>
                        <td>Source Account</td>
                        <td>Destination Account Holder Name</td>
                        <td>Amount</td>
                        <td>Date and Time</td>
                       <td>Remarks</td>
                      <td>Transfer Type</td>
                       
                   </tr>
                    <a:forEach items="${list}" var="v">
                        <tr>
                            <td class="userid">${v.transferId }</td>
                            <td>${v.sourceAccount.sourceAccount }</td>
                            <td>${v.destinationAccountName }</td>
                            <td>${v.amount }</td>
                            <td>${v.timeStamp }</td>
                            <td>${v.remarks }</td>
                            <td>${v.transferType }</td>
                       </tr>
					</a:forEach>
				</table>	</a:if>
	<a:if test="${empty list}">
	<h1>No Transfer records found</h1>
	</a:if>
        </jsp:attribute></m:master>