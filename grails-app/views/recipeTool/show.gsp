
<%@ page import="com.chefkoochooloo.dao.RecipeTool" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeTool.label', default: 'RecipeTool')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recipeTool" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recipeTool" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recipeTool">
			
				<g:if test="${recipeToolInstance?.recipe}">
				<li class="fieldcontain">
					<span id="recipe-label" class="property-label"><g:message code="recipeTool.recipe.label" default="Recipe" /></span>
					
						<span class="property-value" aria-labelledby="recipe-label"><g:link controller="recipe" action="show" id="${recipeToolInstance?.recipe?.id}">${recipeToolInstance?.recipe?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeToolInstance?.tool}">
				<li class="fieldcontain">
					<span id="tool-label" class="property-label"><g:message code="recipeTool.tool.label" default="Tool" /></span>
					
						<span class="property-value" aria-labelledby="tool-label"><g:link controller="tool" action="show" id="${recipeToolInstance?.tool?.id}">${recipeToolInstance?.tool?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:recipeToolInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${recipeToolInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
