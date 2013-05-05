<%@ page import="uk.ac.shu.webarch.eregister.RegClass" %>



<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'className', 'error')} ">
	<label for="className">
		<g:message code="regClass.className.label" default="Class Name" />
		
	</label>
	<g:textField name="className" value="${regClassInstance?.className}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="regClass.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regClassInstance?.classes?}" var="c">
    <li><g:link controller="enrollment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="enrollment" action="create" params="['regClass.id': regClassInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'enrollment.label', default: 'Enrollment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'courseNumber', 'error')} required">
	<label for="courseNumber">
		<g:message code="regClass.courseNumber.label" default="Course Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="courseNumber" name="courseNumber.id" from="${uk.ac.shu.webarch.eregister.Course.list()}" optionKey="id" required="" value="${regClassInstance?.courseNumber?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'enroll', 'error')} ">
	<label for="enroll">
		<g:message code="regClass.enroll.label" default="Enroll" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regClassInstance?.enroll?}" var="e">
    <li><g:link controller="regSheet" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regSheet" action="create" params="['regClass.id': regClassInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regSheet.label', default: 'RegSheet')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'staffNumber', 'error')} required">
	<label for="staffNumber">
		<g:message code="regClass.staffNumber.label" default="Staff Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="staffNumber" name="staffNumber.id" from="${uk.ac.shu.webarch.eregister.Instructor.list()}" optionKey="id" required="" value="${regClassInstance?.staffNumber?.id}" class="many-to-one"/>
</div>

