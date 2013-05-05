
<%@ page import="uk.ac.shu.webarch.eregister.RegSheet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regSheet.label', default: 'RegSheet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-regSheet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-regSheet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="classDate" title="${message(code: 'regSheet.classDate.label', default: 'Class Date')}" />
					
						<th><g:message code="regSheet.className.label" default="Class Name" /></th>
					
						<g:sortableColumn property="sheetNumber" title="${message(code: 'regSheet.sheetNumber.label', default: 'Sheet Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${regSheetInstanceList}" status="i" var="regSheetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${regSheetInstance.id}">${fieldValue(bean: regSheetInstance, field: "classDate")}</g:link></td>
					
						<td>${fieldValue(bean: regSheetInstance, field: "className")}</td>
					
						<td>${fieldValue(bean: regSheetInstance, field: "sheetNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${regSheetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
