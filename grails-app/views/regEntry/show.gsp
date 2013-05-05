
<%@ page import="uk.ac.shu.webarch.eregister.RegEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regEntry.label', default: 'RegEntry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regEntry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regEntry">
			
				<g:if test="${regEntryInstance?.sheetNumber}">
				<li class="fieldcontain">
					<span id="sheetNumber-label" class="property-label"><g:message code="regEntry.sheetNumber.label" default="Sheet Number" /></span>
					
						<span class="property-value" aria-labelledby="sheetNumber-label"><g:link controller="regSheet" action="show" id="${regEntryInstance?.sheetNumber?.id}">${regEntryInstance?.sheetNumber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${regEntryInstance?.studentID}">
				<li class="fieldcontain">
					<span id="studentID-label" class="property-label"><g:message code="regEntry.studentID.label" default="Student ID" /></span>
					
						<span class="property-value" aria-labelledby="studentID-label"><g:link controller="student" action="show" id="${regEntryInstance?.studentID?.id}">${regEntryInstance?.studentID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${regEntryInstance?.ts}">
				<li class="fieldcontain">
					<span id="ts-label" class="property-label"><g:message code="regEntry.ts.label" default="Ts" /></span>
					
						<span class="property-value" aria-labelledby="ts-label"><g:formatDate date="${regEntryInstance?.ts}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${regEntryInstance?.id}" />
					<g:link class="edit" action="edit" id="${regEntryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
