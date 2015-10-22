
<%@ page import="com.chefkoochooloo.dao.RecipeIngredient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeIngredient.label', default: 'RecipeIngredient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recipeIngredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recipeIngredient" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'recipeIngredient.amount.label', default: 'Amount')}" />
					
						<th><g:message code="recipeIngredient.ingredient.label" default="Ingredient" /></th>
					
						<th><g:message code="recipeIngredient.recipe.label" default="Recipe" /></th>
					
						<th><g:message code="recipeIngredient.unit.label" default="Unit" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipeIngredientInstanceList}" status="i" var="recipeIngredientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recipeIngredientInstance.id}">${fieldValue(bean: recipeIngredientInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: recipeIngredientInstance, field: "ingredient")}</td>
					
						<td>${fieldValue(bean: recipeIngredientInstance, field: "recipe")}</td>
					
						<td>${fieldValue(bean: recipeIngredientInstance, field: "unit")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipeIngredientInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
