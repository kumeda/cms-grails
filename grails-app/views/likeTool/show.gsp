
<%@ page import="com.chefkoochooloo.dao.LikeTool" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'likeTool.label', default: 'LikeTool')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-likeTool" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-likeTool" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list likeTool">
			
				<g:if test="${likeToolInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="likeTool.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${likeToolInstance}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${likeToolInstance?.tool}">
				<li class="fieldcontain">
					<span id="tool-label" class="property-label"><g:message code="likeTool.tool.label" default="Tool" /></span>
					
						<span class="property-value" aria-labelledby="tool-label"><g:link controller="tool" action="show" id="${likeToolInstance?.tool?.id}">${likeToolInstance?.tool?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${likeToolInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="likeTool.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${likeToolInstance?.user?.id}">${likeToolInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:likeToolInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${likeToolInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
