
<%@ page import="com.chefkoochooloo.dao.RecipeStep" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeStep.label', default: 'RecipeStep')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recipeStep" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recipeStep" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="recipe_order" title="${message(code: 'recipeStep.recipe_order.label', default: 'Recipeorder')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'recipeStep.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="label" title="${message(code: 'recipeStep.label.label', default: 'Label')}" />
					
						<th><g:message code="recipeStep.recipe.label" default="Recipe" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipeStepInstanceList}" status="i" var="recipeStepInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recipeStepInstance.id}">${fieldValue(bean: recipeStepInstance, field: "recipe_order")}</g:link></td>
					
						<td>${fieldValue(bean: recipeStepInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: recipeStepInstance, field: "label")}</td>
					
						<td>${fieldValue(bean: recipeStepInstance, field: "recipe")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipeStepInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
