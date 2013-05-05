<%@ page import="uk.ac.shu.webarch.eregister.RegSheet" %>



<div class="fieldcontain ${hasErrors(bean: regSheetInstance, field: 'classDate', 'error')} ">
	<label for="classDate">
		<g:message code="regSheet.classDate.label" default="Class Date" />
		
	</label>
	<g:textField name="classDate" value="${regSheetInstance?.classDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regSheetInstance, field: 'className', 'error')} required">
	<label for="className">
		<g:message code="regSheet.className.label" default="Class Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="className" name="className.id" from="${uk.ac.shu.webarch.eregister.RegClass.list()}" optionKey="id" required="" value="${regSheetInstance?.className?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regSheetInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="regSheet.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regSheetInstance?.classes?}" var="c">
    <li><g:link controller="regEntry" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regEntry" action="create" params="['regSheet.id': regSheetInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regEntry.label', default: 'RegEntry')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: regSheetInstance, field: 'sheetNumber', 'error')} ">
	<label for="sheetNumber">
		<g:message code="regSheet.sheetNumber.label" default="Sheet Number" />
		
	</label>
	<g:textField name="sheetNumber" value="${regSheetInstance?.sheetNumber}"/>
</div>

