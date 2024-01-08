<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Insert title here</title>

<script

    src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">

    $(document).ready(function() {

                        $("#state").append("<option value=-1>select</option>");

                        $("#country").append(

                                "<option value='-1''>select</option>");

                        $.ajax({

                            type : 'GET',

                            url : "http://localhost:9999/getcountries",

                            //data:JSON.stringify(V),

                            dataType : "JSON",

                            contentType : "application/json;charset=utf-8",

                            async : false,

                            success : function(data) {

                                //alert(data.length);

 

                                for (var i = 0; i < data.length; i++) {

                                    $("#country").append(

                                            "<option value='" + data[i].countryName + "'>"+ data[i].countryName+ "</option>");

                                }

                            },

                            error : function(x, err) {

                                alert("readyState -" + x.readyState);

                                alert("responseText -" + x.responseText);

                            }

 

                        });//endofajax

 

                        $("#country").change(function() {

                                            var countryName = $("#country").val();

                                            $.ajax({type : "GET",

                                            url : "http://localhost:9999/countryID/"+ countryName,

                                            //data: "{'CiD':'" + $("#country").val() + "'}",

                                            dataType : "json",

                                            contentType : "application/json;charset=utf-8",

                                            async : false,

                                            success : function(data) {

                                            $("#state").empty();

                                            $("#state").append("<option value=-1>select</option>");

                                    for (var i = 0; i < data.length; i++) {

                                        $("#state").append("<option value='" + data[i] + "'>"+ data[i]+ "</option>");

                                        }

                                        },

                                        error : function(x, err) {

                                        alert("readyState "+ x.readyState);

                                        alert("responseText "+ x.responseText);

                                    }

                            });

                        });//endofajax

                        $("#submitbtn").click(function(event) {

                            let v1 = $("#customerPassword").val();

                            let v2 = $("#confirmpassword").val();

                            if (v1 != v2) {

                                alert("Enter Same Password");

                                event.preventDefault();

                            }

                        });

                    });//endofjquery

</script>

</head>

<body>

    <f:form method="POST" modelAttribute="c" action="customer">

        <table>

            <tr>

                <td>Enter Customer Name</td>

                <td><f:input type="text" path="customerName"

                        placeholder="Enter your name"></f:input></td>

                <td><f:errors path="customerName"></f:errors></td>

            </tr>

            <tr>

                <td>Enter Address</td>

                <td><f:input type="text" path="address"

                        placeholder="Enter your address"></f:input></td>

                <td><f:errors path="address"></f:errors></td>

            </tr>

            <tr>

                <td>Enter country name</td>

                <td><f:select path="country" placeholder="Enter your country"></f:select></td>

                <td><f:errors path="country"></f:errors></td>

            </tr>

            <tr>

                <td>Enter state</td>

                <td><f:select path="state" placeholder="Enter your state"></f:select></td>

                <td><f:errors path="state"></f:errors></td>

            </tr>

            <tr>

                <td>Enter city</td>

                <td><f:input type="text" path="city"

                        placeholder="Enter your city name"></f:input></td>

                <td><f:errors path="city"></f:errors></td>

            </tr>

            <tr>

                <td>Enter pincode</td>

                <td><f:input type="text" path="pincode"

                        placeholder="Enter your pincode"></f:input></td>

                <td><f:errors path="pincode"></f:errors></td>

            </tr>

            <tr>

                <td>Enter Email</td>

                <td><f:input type="text" path="email"

                        placeholder="Enter your email Id"></f:input></td>

                <td><f:errors path="email"></f:errors></td>

            </tr>

            <tr>

                <td>Enter Gender</td>

                <td><f:input type="text" path="gender"

                        placeholder="Enter Gender"></f:input></td>

                <td><f:errors path="gender"></f:errors></td>

            </tr>

            <tr>

                <td>Enter contact NO</td>

                <td><f:input type="text" path="contactNo"

                        placeholder="Enter your contact No"></f:input></td>

                <td><f:errors path="contactNo"></f:errors></td>

            </tr>

            <tr>

                <td>Enter Dob</td>

                <td><f:input type="date" path="dob"

                        placeholder="Enter your date of Birth"></f:input></td>

                <td><f:errors path="dob"></f:errors></td>

            </tr>

            <tr>

                <td>Enter Password</td>

                <td><f:input type="password" path="customerPassword"

                        placeholder="Enter any password"></f:input></td>

                <td><f:errors path="customerPassword"></f:errors></td>

            </tr>

            <tr>

                <td>Confirm Password</td>

                <td><input type="password" id="confirmpassword"

                    placeholder="confirm your password"></td>

            </tr>

            <tr>

                <td><input type="submit" id="submitbtn" value="Register"></td>

            </tr>

        </table>

        <c:out value="${str}"></c:out>

    </f:form>

</body>

</html>