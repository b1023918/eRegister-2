
<!DOCTYPE html>
<html>
<head>
		<meta name="layout" content="main"/>
		<title>Welcome to eRegister</title>
		
	</head>
<body>
<div style="padding:20px;">
<h1>Sign in</h1>
<p>Welcome to the student E-Register, please fill in the form below to sign in</p><br>
<g:form action="processAttendence" method="get" >

Student ID:
<p><g:field type="text" name="studentID" min="5" max="10" required="" value="${studentID}"/></p><br>
Class Name/Number:
<p><g:field type="text" name="sheetNumber" value="${sheetNumber}"/></p><br>
<p><g:submitButton name="register" value="Register" /></p>

<a href="http://localhost:8080/eRegister/listActiveClasses">Class Attendees</a>
</div>

</g:form>
</body>


