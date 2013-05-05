<%@ page import="uk.ac.shu.webarch.eregister.Enrollment" %>



<div class="fieldcontain ${hasErrors(bean: enrollmentInstance, field: 'className', 'error')} required">
	<label for="className">
		<g:message code="enrollment.className.label" default="Class Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="className" name="className.id" from="${uk.ac.shu.webarch.eregister.RegClass.list()}" optionKey="id" required="" value="${enrollmentInstance?.className?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enrollmentInstance, field: 'enrollmentNo', 'error')} ">
	<label for="enrollmentNo">
		<g:message code="enrollment.enrollmentNo.label" default="Enrollment No" />
		
	</label>
	<g:textField name="enrollmentNo" value="${enrollmentInstance?.enrollmentNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enrollmentInstance, field: 'studentContactDetails', 'error')} ">
	<label for="studentContactDetails">
		<g:message code="enrollment.studentContactDetails.label" default="Student Contact Details" />
		
	</label>
	<g:textField name="studentContactDetails" value="${enrollmentInstance?.studentContactDetails}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enrollmentInstance, field: 'studentID', 'error')} required">
	<label for="studentID">
		<g:message code="enrollment.studentID.label" default="Student ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="studentID" name="studentID.id" from="${uk.ac.shu.webarch.eregister.Student.list()}" optionKey="id" required="" value="${enrollmentInstance?.studentID?.id}" class="many-to-one"/>
</div>

