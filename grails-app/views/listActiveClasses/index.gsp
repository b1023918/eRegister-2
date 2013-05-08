
<!DOCTYPE html>
<html>
<head>
		<meta name="layout" content="main"/>
		<title>Welcome to eRegister</title>
		
	</head>
<body>
<div style="padding:20px; text-align:center;">
<ul>
<g:each in="${sheets}" var="sheet">
<h1>RegSheet = ${sheet}
</h1>
<g:each in="${sheet.classes}" var="sig">
<li style="list-style:none; text-align:center;">
${sig.studentID.studentName}
</li><br>
</g:each>

</g:each>
<a href="http://localhost:8080/eRegister/">Back to Home</a>
</ul>
</div> 
</body>

</html>


<html>
<head>
		
