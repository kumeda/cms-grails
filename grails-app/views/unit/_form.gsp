<%@ page import="com.chefkoochooloo.dao.Unit" %>



<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="unit.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${unitInstance?.name}"/>

</div>

