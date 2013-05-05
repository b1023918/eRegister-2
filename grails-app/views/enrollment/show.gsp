
<%@ page import="uk.ac.shu.webarch.eregister.Enrollment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrollment.label', default: 'Enrollment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-enrollment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-enrollment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list enrollment">
			
				<g:if test="${enrollmentInstance?.className}">
				<li class="fieldcontain">
					<span id="className-label" class="property-label"><g:message code="enrollment.className.label" default="Class Name" /></span>
					
						<span class="property-value" aria-labelledby="className-label"><g:link controller="regClass" action="show" id="${enrollmentInstance?.className?.id}">${enrollmentInstance?.className?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${enrollmentInstance?.enrollmentNo}">
				<li class="fieldcontain">
					<span id="enrollmentNo-label" class="property-label"><g:message code="enrollment.enrollmentNo.label" default="Enrollment No" /></span>
					
						<span class="property-value" aria-labelledby="enrollmentNo-label"><g:fieldValue bean="${enrollmentInstance}" field="enrollmentNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enrollmentInstance?.studentContactDetails}">
				<li class="fieldcontain">
					<span id="studentContactDetails-label" class="property-label"><g:message code="enrollment.studentContactDetails.label" default="Student Contact Details" /></span>
					
						<span class="property-value" aria-labelledby="studentContactDetails-label"><g:fieldValue bean="${enrollmentInstance}" field="studentContactDetails"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enrollmentInstance?.studentID}">
				<li class="fieldcontain">
					<span id="studentID-label" class="property-label"><g:message code="enrollment.studentID.label" default="Student ID" /></span>
					
						<span class="property-value" aria-labelledby="studentID-label"><g:link controller="student" action="show" id="${enrollmentInstance?.studentID?.id}">${enrollmentInstance?.studentID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${enrollmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${enrollmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
