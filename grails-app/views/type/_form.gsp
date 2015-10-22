<%@ page import="com.chefkoochooloo.dao.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="type.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${typeInstance?.name}"/>

</div>

