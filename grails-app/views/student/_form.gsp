<%@ page import="uk.ac.shu.webarch.eregister.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentID', 'error')} ">
	<label for="studentID">
		<g:message code="student.studentID.label" default="Student ID" />
		
	</label>
	<g:textField name="studentID" value="${studentInstance?.studentID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'attendances', 'error')} ">
	<label for="attendances">
		<g:message code="student.attendances.label" default="Attendances" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.attendances?}" var="a">
    <li><g:link controller="regEntry" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regEntry" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regEntry.label', default: 'RegEntry')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="student.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.classes?}" var="c">
    <li><g:link controller="enrollment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="enrollment" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'enrollment.label', default: 'Enrollment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="student.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${uk.ac.shu.webarch.eregister.Course.list()}" optionKey="id" required="" value="${studentInstance?.course?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="student.height.label" default="Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" type="number" value="${studentInstance.height}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'learningCentreNumber', 'error')} ">
	<label for="learningCentreNumber">
		<g:message code="student.learningCentreNumber.label" default="Learning Centre Number" />
		
	</label>
	<g:textField name="learningCentreNumber" value="${studentInstance?.learningCentreNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentName', 'error')} ">
	<label for="studentName">
		<g:message code="student.studentName.label" default="Student Name" />
		
	</label>
	<g:textField name="studentName" value="${studentInstance?.studentName}"/>
</div>

