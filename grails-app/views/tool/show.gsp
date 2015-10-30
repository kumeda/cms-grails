
<%@ page import="com.chefkoochooloo.dao.Tool" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tool.label', default: 'Tool')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tool" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tool" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tool">
			
				<g:if test="${toolInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="tool.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${toolInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="tool.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${toolInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolInstance?.likes}">
				<li class="fieldcontain">
					<span id="likes-label" class="property-label"><g:message code="tool.likes.label" default="Likes" /></span>
					
						<g:each in="${toolInstance.likes}" var="l">
						<span class="property-value" aria-labelledby="likes-label"><g:link controller="likeTool" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${toolInstance?.recipes}">
				<li class="fieldcontain">
					<span id="recipes-label" class="property-label"><g:message code="tool.recipes.label" default="Recipes" /></span>
					
						<g:each in="${toolInstance.recipes}" var="r">
						<span class="property-value" aria-labelledby="recipes-label"><g:link controller="recipeTool" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:toolInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${toolInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
