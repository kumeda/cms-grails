
<%@ page import="com.chefkoochooloo.dao.RecipeImage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeImage.label', default: 'RecipeImage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recipeImage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recipeImage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recipeImage">
			
				<g:if test="${recipeImageInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="recipeImage.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${recipeImageInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeImageInstance?.alt}">
				<li class="fieldcontain">
					<span id="alt-label" class="property-label"><g:message code="recipeImage.alt.label" default="Alt" /></span>
					
						<span class="property-value" aria-labelledby="alt-label"><g:fieldValue bean="${recipeImageInstance}" field="alt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeImageInstance?.presentation}">
				<li class="fieldcontain">
					<span id="presentation-label" class="property-label"><g:message code="recipeImage.presentation.label" default="Presentation" /></span>
					
						<span class="property-value" aria-labelledby="presentation-label"><g:fieldValue bean="${recipeImageInstance}" field="presentation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeImageInstance?.recipe}">
				<li class="fieldcontain">
					<span id="recipe-label" class="property-label"><g:message code="recipeImage.recipe.label" default="Recipe" /></span>
					
						<span class="property-value" aria-labelledby="recipe-label"><g:link controller="recipe" action="show" id="${recipeImageInstance?.recipe?.id}">${recipeImageInstance?.recipe?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:recipeImageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${recipeImageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
