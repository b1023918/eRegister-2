
<%@ page import="uk.ac.shu.webarch.eregister.RegSheet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regSheet.label', default: 'RegSheet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regSheet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regSheet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regSheet">
			
				<g:if test="${regSheetInstance?.classDate}">
				<li class="fieldcontain">
					<span id="classDate-label" class="property-label"><g:message code="regSheet.classDate.label" default="Class Date" /></span>
					
						<span class="property-value" aria-labelledby="classDate-label"><g:fieldValue bean="${regSheetInstance}" field="classDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regSheetInstance?.className}">
				<li class="fieldcontain">
					<span id="className-label" class="property-label"><g:message code="regSheet.className.label" default="Class Name" /></span>
					
						<span class="property-value" aria-labelledby="className-label"><g:link controller="regClass" action="show" id="${regSheetInstance?.className?.id}">${regSheetInstance?.className?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${regSheetInstance?.classes}">
				<li class="fieldcontain">
					<span id="classes-label" class="property-label"><g:message code="regSheet.classes.label" default="Classes" /></span>
					
						<g:each in="${regSheetInstance.classes}" var="c">
						<span class="property-value" aria-labelledby="classes-label"><g:link controller="regEntry" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${regSheetInstance?.sheetNumber}">
				<li class="fieldcontain">
					<span id="sheetNumber-label" class="property-label"><g:message code="regSheet.sheetNumber.label" default="Sheet Number" /></span>
					
						<span class="property-value" aria-labelledby="sheetNumber-label"><g:fieldValue bean="${regSheetInstance}" field="sheetNumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${regSheetInstance?.id}" />
					<g:link class="edit" action="edit" id="${regSheetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
