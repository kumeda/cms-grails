
<%@ page import="com.chefkoochooloo.dao.RecipeStep" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeStep.label', default: 'RecipeStep')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recipeStep" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recipeStep" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recipeStep">
			
				<g:if test="${recipeStepInstance?.recipe_order}">
				<li class="fieldcontain">
					<span id="recipe_order-label" class="property-label"><g:message code="recipeStep.recipe_order.label" default="Recipeorder" /></span>
					
						<span class="property-value" aria-labelledby="recipe_order-label"><g:fieldValue bean="${recipeStepInstance}" field="recipe_order"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeStepInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="recipeStep.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${recipeStepInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeStepInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="recipeStep.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${recipeStepInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeStepInstance?.recipe}">
				<li class="fieldcontain">
					<span id="recipe-label" class="property-label"><g:message code="recipeStep.recipe.label" default="Recipe" /></span>
					
						<span class="property-value" aria-labelledby="recipe-label"><g:link controller="recipe" action="show" id="${recipeStepInstance?.recipe?.id}">${recipeStepInstance?.recipe?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:recipeStepInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${recipeStepInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
