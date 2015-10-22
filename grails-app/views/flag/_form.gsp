<%@ page import="com.chefkoochooloo.dao.Flag" %>



<div class="fieldcontain ${hasErrors(bean: flagInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="flag.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${flagInstance?.name}"/>

</div>

