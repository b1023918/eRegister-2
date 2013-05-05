
<%@ page import="uk.ac.shu.webarch.eregister.Enrollment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrollment.label', default: 'Enrollment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-enrollment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-enrollment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="enrollment.className.label" default="Class Name" /></th>
					
						<g:sortableColumn property="enrollmentNo" title="${message(code: 'enrollment.enrollmentNo.label', default: 'Enrollment No')}" />
					
						<g:sortableColumn property="studentContactDetails" title="${message(code: 'enrollment.studentContactDetails.label', default: 'Student Contact Details')}" />
					
						<th><g:message code="enrollment.studentID.label" default="Student ID" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${enrollmentInstanceList}" status="i" var="enrollmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${enrollmentInstance.id}">${fieldValue(bean: enrollmentInstance, field: "className")}</g:link></td>
					
						<td>${fieldValue(bean: enrollmentInstance, field: "enrollmentNo")}</td>
					
						<td>${fieldValue(bean: enrollmentInstance, field: "studentContactDetails")}</td>
					
						<td>${fieldValue(bean: enrollmentInstance, field: "studentID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${enrollmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
