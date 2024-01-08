<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<f:form action = "insertTransaction" modelAttribute= "V">
<table>
            <tr>
                <td>Transaction Id</td>
                <td><f:input path="transactionId"/></td>
                <td><f:errors path="transactionId"/></td>
            </tr>
            <tr>
                <td>Account No</td>
                <td><f:input path="accountNo"/></td>
                <td><f:errors path="accountNo"/></td>
            </tr>
            <tr>
                <td>Transaction Type</td>
                <td><f:input path="transactionType"/></td>
                <td><f:errors path="transactionType"/></td>
            </tr>
            <tr>
                <td>Time Stamp</td>
                <td><f:input path="timestamp"/></td>
                <td><f:errors path="timestamp"/></td>
            </tr>
            <tr>
                <td>Amount</td>
                <td><f:input path="amount"/></td>
                <td><f:errors path="amount"/></td>
            </tr>
            <tr>
                <td>Remarks</td>
                <td><f:input path="remarks"/></td>
                <td><f:errors path="remarks"/></td>
            </tr>
            <tr>
                <td><input type="submit"></td>
            </tr>
        </table>

</f:form>
</body>
</html>