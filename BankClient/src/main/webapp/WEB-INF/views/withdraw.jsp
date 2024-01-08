<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Withdraw">
    <jsp:attribute name="head">
    	<script>
	function checkk() {
		var input=document.getElementById("amount").value;
		if(!isNaN(parseFloat(input)) && isFinite(input))
			return true;
		else
			{
			alert("amount must be a  number");
			document.getElementById("amount").value="";
				return false;
			}
}
	</script>
  <style>
            /* Add your CSS styles here */
            body {
                font-family: Arial, sans-serif;
            }
            table {
                width: 100%;
                border-collapse: collapse;
              margin-top: 20px;
            }
            th, td {
               padding: 10px;
                text-align: left;
          }
          th {
                background-color: #f2f2f2;
            }
           input[type="text"], input[type="number"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
           }
            .errors {
                color: red;
                font-size: 14px;
            }
            button[type="submit"] {
                background-color: #4CAF50;
               color: white;
               padding: 10px 20px;
             border: none;
                border-radius: 4px;
               cursor: pointer;
            }
        </style>
</jsp:attribute>
    <jsp:attribute name="content">
    <h2><a:out value="${msg}"></a:out> </h2>
<f:form action = "withdraw1" modelAttribute= "C">
<table>
            <tr>
                <td>Amount</td>
                <td><f:input path="amount" onblur="return checkk();" required="required"/></td>
                <td><f:errors path="amount"/></td>
            </tr>
            <tr>
                <td>Remarks</td>
                <td><f:input path="remarks" required="required" /></td>
                <td><f:errors path="remarks"/></td>
            </tr>
  <tr>
                <td>Submit</td>
                <td><input type="submit"> </td>
            </tr>
</table>
</f:form>
        </jsp:attribute></m:master>