<%@ page import="com.chefkoochooloo.dao.Tool" %>



<div class="fieldcontain ${hasErrors(bean: toolInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tool.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${toolInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: toolInstance, field: 'likes', 'error')} ">
	<label for="likes">
		<g:message code="tool.likes.label" default="Likes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${toolInstance?.likes?}" var="l">
    <li><g:link controller="likeTool" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="likeTool" action="create" params="['tool.id': toolInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'likeTool.label', default: 'LikeTool')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: toolInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="tool.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${toolInstance?.url}"/>

</div>

