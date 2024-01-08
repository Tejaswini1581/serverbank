<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="m"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Transfer">
    <jsp:attribute name="head">
    <meta charset="UTF-8">
    <title>Bank Selection</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ADD8E6;
            margin: 40;
            padding: 30;
       }
         form {
        text-align: center;
    }
    table{
margin-left: auto;  
margin-right: auto;  
border-collapse: collapse;    
width: 500px;  
text-align: left;  
font-size: 20px;  
    }
     table td,
table th {
    padding: 10px;
    margin: 10     px;
}
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #90EE90;
            border-radius: 5px;
           box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
       }
       h2 {
            margin-top: 22;
       }
       label {
            display: inline-block;
            margin-right: 5px;
            font-weight: bold;
        }
         input[type="radio"] {
           margin-right: 5px;
        }
        /* Display radio buttons side by side */
        .radio-group {
            display: inline-block;
       }
       #autocomplete {
            position: relative;
            display: inline-block;
        }

        #autocomplete input {
            padding: 5px;
        }

        #suggestions {
            position: absolute;
            width: 100%;
            max-height: 150px;
            overflow-y: auto;
            border: 1px solid #ccc;
            background-color: #fff;
            display: none;
        }

        .suggestion {
            padding: 8px;
            cursor: pointer;
        }

        .suggestion:hover {
            background-color: #f2f2f2;
        }
    </style>
   <script>
   function home() {
		window.location.href="http://localhost:9101/mainpage";
	}
        $(document).ready(function() {
            $("input[name='bankType']").change(function() {
                var selectedValue = $("input[name='bankType']:checked").val();
                if (selectedValue === "sameBank") {
                  $("#bankFormContainer").html($("#sameBankForm").html());
              } else if (selectedValue === "otherBank") {
                    $("#bankFormContainer").html($("#otherBankForm").html());
                }
            });//input[name='bankType']
        });//(document).ready(function() 
        function getAutocompleteSuggestions() {
            var input = document.getElementById("accountHolderName").value;
            
            $.ajax({
                url: "http://localhost:9100/autocomplete",
                type: 'GET',
                data: {
                    query: input
                },
                success: function(data) {
                    updateSuggestions(data);
                },
                error: function(x,err) {
                    alert(error);
                }
            });//$.ajax({
        }// getAutocompleteSuggestions(

        function updateSuggestions(suggestions) {
            var suggestionsDiv = document.getElementById("suggestions");
            suggestionsDiv.innerHTML = "";

            suggestions.forEach(function(suggestion) {
                var suggestionElement = document.createElement("div");
                suggestionElement.textContent = suggestion;
                suggestionsDiv.appendChild(suggestionElement);
            });//suggestions.forEach
        }//updateSuggestions(suggestions)
    </script>
</jsp:attribute>
    <jsp:attribute name="content">
    <h2><a:out value="${msg}"></a:out> </h2>
		<button class="btn--close-modal" onclick="home();">&times;</button>
    <div class="container" >
        <h2>Select a Bank</h2>
        <h3>Transfer Type:</h3>
        <div class="radio-group">
          <label for="sameBank">
               <input type="radio" id="sameBank" name="bankType" value="sameBank">
                Same Bank
            </label>
        </div>
        <div class="radio-group">
           <label for="otherBank">
                <input type="radio" id="otherBank" name="bankType" value="otherBank">
                Other Bank
            </label>
        </div>
   </div>   
    <div id="bankFormContainer"></div>
    <!-- Template for the Same Bank Form -->
    <div id="sameBankForm" style="display: none; " >   
        <f:form action = "transfer1" modelAttribute= "C">
                             <h3>Transfer To The Same Bank  </h3>
            <table>
                <tr>
                    <!-- Your form fields for the same bank -->
                    <td><label for="destinationAccountName"> Account
                            Holder Name:</label></td>
                    <td>
                    
                    <f:input path="destinationAccountName" type="text" onkeyup="getAutocompleteSuggestions()" required="required"/>
                    <div id="suggestions"></div>
                    
            
                   <!--  <input type="text" id="destinationAccountName"
                        name="destinationAccountName"> -->
                        <br></td>
                </tr>
              <%--    <tr>
                    <td><label for="account_No"> Account No:</label></td>
                    <td><f:input type="text" id="account_No" name="account_No" required="required"/><br></td>
                </tr> --%>
                 <tr>
                    <td><label for="account_ID">To Account No:</label></td>
                    <td><input type="text" id="account_ID" name="account_ID" required="required"/><br></td>
                </tr>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><f:input type="text" path="amount" required="required"/><br></td>
               <tr>
                    <td><label for="remarks"> Remarks:</label></td>
                    <td><f:input type="text" path="remarks" required="required"/><br></td>
                </tr>
                <tr>
                    <td>
                        <!-- Add other form fields here --> <input type="submit" value="Submit">
                    </td>
                </tr>
            </table>
        </f:form>
    </div>
    <!-- Template for the Other Bank Form -->
    <div id="otherBankForm" style="display: none;">
        <f:form action = "transfer2" modelAttribute= "C">
        <table>
         <h3>Transfer To Other Bank   </h3>
               <tr>
                    <!-- Your form fields for the other bank -->
                    <td><label for="otherBankField">Account Holder Name:</label></td>

                   <td>
                   
                    <f:input type="text" path="destinationAccountName" onkeyup="getAutocompleteSuggestions()" required="required"/>
                    <div id="suggestions"></div>
                   <tr>
                    <td><label for="account_ID">To Account No:</label></td>
                    <td><input type="text" id="account_ID" name="account_ID" required="required"/><br></td>
                </tr>
                   
                 <!--   <input type="text" id="otherBankField"
                        name="otherBankField"> -->
                 <%-- <tr>
                    <td><label for="account_No"> Account No:</label></td>
                    <td><f:input type="text" id="account_No" name="account_No" required="required"/><br></td>
                </tr> --%>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><f:input type="text" path="amount" required="required"/><br></td>
                </tr>
                <tr>
                    <td><label for="remarks"> Remarks:</label></td>
                   <td><f:input type="text" path="remarks" required="required"/><br></td>
               </tr>
                <!-- Add other form fields here -->
               <tr>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </f:form>
   </div>
        </jsp:attribute></m:master>