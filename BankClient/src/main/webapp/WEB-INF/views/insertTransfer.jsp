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
<f:form action = "insertvehicle" modelAttribute= "V">
<table>          
            <tr>
                <td>transfer Id</td>
                <td><f:input path="transferId"/></td>
                <td><f:errors path="transferId"/></td>
            </tr>
            <tr>
                <td>Source Account</td>
                <td><f:input path="sourceAccount"/></td>
                <td><f:errors path="sourceAccount"/></td>

           </tr>
           <tr>
               <td>Destination AccountName</td>
                <td><f:input path="destinationAccountName"/></td>
                <td><f:errors path="destinationAccountName"/></td>
            </tr>
           <tr>
               <td>Amount</td>
               <td><f:input path="amount"/></td>
                <td><f:errors path="amount"/></td>
            </tr>
            <tr>
                <td>Time Stamp</td>

               <td><f:input path="timeStamp"/></td>
                <td><f:errors path="timeStamp"/></td>
           </tr>
            <tr>
                <td>Remarks</td>
                <td><f:input path="remarks"/></td>
                <td><f:errors path="remarks"/></td>
            </tr>
            <tr>
               <td>Transfer Type</td>
              <td><f:input path="transferType"/></td>
               <td><f:errors path="transferType"/></td>
            </tr>
            <tr>
                <td><input type="submit"></td>
            </tr>
        </table>
</f:form>
</body>
</html>