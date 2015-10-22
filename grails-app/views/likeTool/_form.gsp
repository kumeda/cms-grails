<%@ page import="com.chefkoochooloo.dao.LikeTool" %>



<div class="fieldcontain ${hasErrors(bean: likeToolInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="likeTool.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" value="${likeToolInstance.level}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: likeToolInstance, field: 'tool', 'error')} required">
	<label for="tool">
		<g:message code="likeTool.tool.label" default="Tool" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tool" name="tool.id" from="${com.chefkoochooloo.dao.Tool.list()}" optionKey="id" required="" value="${likeToolInstance?.tool?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: likeToolInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="likeTool.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.chefkoochooloo.dao.User.list()}" optionKey="id" required="" value="${likeToolInstance?.user?.id}" class="many-to-one"/>

</div>

