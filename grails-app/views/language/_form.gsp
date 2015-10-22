<%@ page import="com.chefkoochooloo.dao.Language" %>



<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="language.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${languageInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="language.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${languageInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'music', 'error')} required">
	<label for="music">
		<g:message code="language.music.label" default="Music" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="music" type="number" value="${languageInstance.music}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="language.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${languageInstance?.type}"/>

</div>

