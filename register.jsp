<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="springform"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
	function fn(event) {
		var first_name = document.getElementById("first_name").value;
		var last_name = document.getElementById("last_name").value;
		var age = document.getElementById("age").value;
		var contact_number = document.getElementById("contact_number").value;
		var email_id = document.getElementById("email_id").value;
		var password = document.getElementById("password").value;

		if (first_name == null || first_name == "")
		{
			alert("Please Enter First Name.");
			return false;
		}
		else if (last_name == null || last_name == "")
		{
			alert("Please Enter Last Name.");
			return false;
		}
		else if (age == null || age == "" || age == 0)
		{
			alert("Please Enter a valid Age.");
			return false;
		}
		else if (contact_number == null || contact_number == "")
		{			
			alert("Please Enter Contact Number.");
			return false;
		}
		else if(contact_number.length !=10){
			alert("Contact Number should be of 10 digits.");
			return false;
		}
		else if (email_id == null || email_id == "")
		{
			alert("Please Enter Email Id.");
			return false;
		}
		else if (password == null || password == "")
		{
			alert("Please Enter Password.");
			return false;
		}
		return true;
	}
	
	function onlyAlphabets(e, t) {
        try {
            if (window.event) {
                var charCode = window.event.keyCode;
            }
            else if (e) {
                var charCode = e.which;
            }
            else { return true; }
            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
                return true;
            else
                return false;
        }
        catch (err) {
            alert(err.Description);
        }
    }
	
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
	
	function validateEmail(emailField){
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

        if (reg.test(emailField.value) == false) 
        {
            alert('Invalid Email Address');
            return false;
        }

        return true;
	}
</script>
<style>
body {
	background: url(images/back10.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

/* Control the right side */
.right {
	position: absolute;
	bottom: 150px;
	right: 50px;
	text-align: right;
	transform: scale(1.25, 1);
	color: #2F4F4F;
}

img {
	width: 200px;
}

option, select {
	/* Whatever color  you want */
	background-color: #2F4F4F;
	color: white;
}

input[type=text], [type=date] {
	background-color: #2F4F4F;
	color: white;
}

input[type=submit] {
	background-color: #2F4F4F;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 16px;
}

.name {
	color: #2F4F4F;
	font-size: 60px;
	position: absolute;
	height: 50px;
	/*  width: 50px;  */
	top: 0;
	right: 15px;
	font-style: oblique;
	font-weight: bold;
}

.register {
	position: absolute;
	bottom: 100px;
	right: 420px;
	text-align: right;
	align: right;
}

.login:hover {
	background-color: #3e8e41;
}

.login:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

.login {
	background-color: #2F4F4F;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 16px;
}

.form {
	position: absolute;
	margin: auto;
	top: 100px;
	right: 0;
	bottom: 0;
	left: 50%;
	color: #2F4F4F;
	font-weight: bold;
	font-size: 18px;
}
</style>
<title>Registration Page</title>
</head>
<body>
	<div class="name">Medicine Monitoring System</div>
	<div class="form">
		<springform:form modelAttribute="admin" method="post"
			action="registerUser.htm">
			<table>
				<tr>
					<td><springform:label path="adminFirstName">First Name :</springform:label>
					<td><springform:input path="adminFirstName"
							placeholder="First Name" style="height : 30px;" id="first_name"
							autocomplete="off" maxlength="50"
							onkeypress="return onlyAlphabets(event,this);" />
				</tr>
				<tr>
					<td><springform:label path="adminLastName">Last Name :</springform:label>
					<td><springform:input path="adminLastName"
							placeholder="Last Name" maxlength="50" id="last_name"
							style="height : 30px;" autocomplete="off"
							onkeypress="return onlyAlphabets(event,this);" />
				</tr>
				<tr>
					<td><springform:label path="adminAge">Age :</springform:label>
					<td><springform:input path="adminAge" placeholder="Age"
							maxlength="2" id="age" style="height : 30px;" autocomplete="off"
							onkeypress="return isNumber(event)" />
				</tr>
				<tr>
					<td><springform:label path="adminGender">Gender :</springform:label>
						<td><springform:select path="adminGender" style="height : 30px;">
							<springform:options items="${genderList}" />
						</springform:select>
				</tr>

				<tr>
					<td><springform:label path="adminDOB">Date of Birth :</springform:label>
					<td><springform:input path="adminDOB" id="dob" type="date"
							placeholder="mm/dd/yyyy" style="height : 30px;"
							autocomplete="off" />
				</tr>
				<tr>
					<td><springform:label path="adminContactNo">Contact Number :</springform:label>
					<td><springform:input path="adminContactNo"
							placeholder="Contact Number" style="height : 30px;"
							maxlength="10" id="contact_number" autocomplete="off"
							onkeypress="return isNumber(event)" /> <springform:errors
							path="adminContactNo" style="color:red" />
				</tr>
				<tr>
					<td><springform:label path="adminAltContactNo">Alternative Contact Number :</springform:label>
					<td><springform:input path="adminAltContactNo"
							placeholder="Alt Contact Number" style="height : 30px;"
							maxlength="10" autocomplete="off"
							onkeypress="return isNumber(event)" />
				</tr>
				<tr>
					<td><springform:label path="adminEmailId">Email :</springform:label>
					<td><springform:input path="adminEmailId"
							placeholder="Email Id" id="email_id" style="height : 30px;"
							maxlength="50" autocomplete="off" onblur="validateEmail(this);" />
						<springform:errors path="adminEmailId" style="color:red" />
				</tr>

				<tr>
					<td><springform:label path="adminPassword">Password :</springform:label>
					<td><springform:input path="adminPassword"
							placeholder="Password" id="password" style="height : 30px;"
							maxlength="10" autocomplete="off" />
				</tr>
				<div class="register">
					<input type="submit" value="register" onclick="return fn(event)">
				</div>
				</form>
			</table>
		</springform:form>
	</div>

	<form method="get" action="index.htm">
		<button class="login">Login</button>
	</form>
</body>
</html>