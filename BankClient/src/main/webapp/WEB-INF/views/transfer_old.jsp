<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
            });
        const searchBox = document.getElementById('searchBox');
        const suggestionsDiv = document.getElementById('suggestions');

        // Simulated data source (replace with actual data retrieval logic)
        const suggestions = ['apple', 'banana', 'cherry', 'date', 'elderberry'];

        searchBox.addEventListener('input', function () {
            const inputText = searchBox.value.toLowerCase();
            const filteredSuggestions = suggestions.filter(suggestion =>
                suggestion.toLowerCase().startsWith(inputText)
            );

            showSuggestions(filteredSuggestions);
        });

        function showSuggestions(suggestions) {
            suggestionsDiv.innerHTML = '';

            if (suggestions.length > 0) {
                suggestions.forEach(suggestion => {
                    const suggestionElement = document.createElement('div');
                    suggestionElement.classList.add('suggestion');
                    suggestionElement.textContent = suggestion;

                    suggestionElement.addEventListener('click', function () {
                        searchBox.value = suggestion;
                        suggestionsDiv.innerHTML = '';
                    });

                    suggestionsDiv.appendChild(suggestionElement);
                });

                suggestionsDiv.style.display = 'block';
            } else {
                suggestionsDiv.style.display = 'none';
            }
        }
        
        });
    	
    </script>
</head>
<body>
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
        <form>
                             <h3>Transfer To The Same Bank  </h3>
            <table>
                <tr>
                    <!-- Your form fields for the same bank -->
                    <td><label for="destinationAccountName"> Account
                            Holder Name:</label></td>
                    <td>
                     <div id="autocomplete">
        <input type="text" id="searchBox" placeholder="Search...">
        <div id="suggestions"></div>
    </div>
                   <!--  <input type="text" id="destinationAccountName"
                        name="destinationAccountName"> -->
                        <br></td>
                </tr>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><input type="text" id="amount" name="amount"><br></td>
               <tr>
                    <td><label for="remarks"> Remarks:</label></td>
                    <td><input type="text" id="remarks" name="remarks"><br></td>
                </tr>
                <tr>
                    <td>
                        <!-- Add other form fields here --> <input type="submit"
                       value="Submit">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- Template for the Other Bank Form -->
    <div id="otherBankForm" style="display: none;">
        <form>
        <table>
         <h3>Transfer To Other Bank   </h3>
               <tr>
                    <!-- Your form fields for the other bank -->
                    <td><label for="otherBankField">Account Holder Name:</label></td>

                   <td><input type="text" id="otherBankField"
                        name="otherBankField"><br></td>
                </tr>
                <tr>
                    <td><label for="amount"> Amount:</label></td>
                    <td><input type="text" id="amount" name="amount"><br></td>
                </tr>
                <tr>
                    <td><label for="remarks"> Remarks:</label></td>
                   <td><input type="text" id="remarks" name="remarks"><br></td>
               </tr>
                <!-- Add other form fields here -->
               <tr>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>
   </div>
</body>
</html>