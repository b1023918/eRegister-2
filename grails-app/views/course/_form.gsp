<%@ page import="uk.ac.shu.webarch.eregister.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="course.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseInstance?.classes?}" var="c">
    <li><g:link controller="regClass" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regClass" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regClass.label', default: 'RegClass')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'courseLeader', 'error')} ">
	<label for="courseLeader">
		<g:message code="course.courseLeader.label" default="Course Leader" />
		
	</label>
	<g:textField name="courseLeader" value="${courseInstance?.courseLeader}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'courseName', 'error')} ">
	<label for="courseName">
		<g:message code="course.courseName.label" default="Course Name" />
		
	</label>
	<g:textField name="courseName" value="${courseInstance?.courseName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'courseNumber', 'error')} ">
	<label for="courseNumber">
		<g:message code="course.courseNumber.label" default="Course Number" />
		
	</label>
	<g:textField name="courseNumber" value="${courseInstance?.courseNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'faculty', 'error')} ">
	<label for="faculty">
		<g:message code="course.faculty.label" default="Faculty" />
		
	</label>
	<g:textField name="faculty" value="${courseInstance?.faculty}"/>
</div>

