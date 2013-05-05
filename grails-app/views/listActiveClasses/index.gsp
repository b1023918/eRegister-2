<html>
<body>
<ul>
<g:each in="${sheets}" var="sheet">
RegSheet = ${sheet}

<g:each in="${sheet.classes}" var="sig">
<li>
${sig.studentID.studentName}
</li>
</g:each>

</g:each>
</ul>
</body>

</html>
