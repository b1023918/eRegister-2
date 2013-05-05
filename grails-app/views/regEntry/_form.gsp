<%@ page import="uk.ac.shu.webarch.eregister.RegEntry" %>



<div class="fieldcontain ${hasErrors(bean: regEntryInstance, field: 'sheetNumber', 'error')} required">
	<label for="sheetNumber">
		<g:message code="regEntry.sheetNumber.label" default="Sheet Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sheetNumber" name="sheetNumber.id" from="${uk.ac.shu.webarch.eregister.RegSheet.list()}" optionKey="id" required="" value="${regEntryInstance?.sheetNumber?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regEntryInstance, field: 'studentID', 'error')} required">
	<label for="studentID">
		<g:message code="regEntry.studentID.label" default="Student ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="studentID" name="studentID.id" from="${uk.ac.shu.webarch.eregister.Student.list()}" optionKey="id" required="" value="${regEntryInstance?.studentID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regEntryInstance, field: 'ts', 'error')} required">
	<label for="ts">
		<g:message code="regEntry.ts.label" default="Ts" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="ts" precision="day"  value="${regEntryInstance?.ts}"  />
</div>

