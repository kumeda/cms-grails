
<%@ page import="com.chefkoochooloo.dao.RecipeImage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeImage.label', default: 'RecipeImage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recipeImage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recipeImage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="url" title="${message(code: 'recipeImage.url.label', default: 'Url')}" />
					
						<g:sortableColumn property="alt" title="${message(code: 'recipeImage.alt.label', default: 'Alt')}" />
					
						<g:sortableColumn property="presentation" title="${message(code: 'recipeImage.presentation.label', default: 'Presentation')}" />
					
						<th><g:message code="recipeImage.recipe.label" default="Recipe" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipeImageInstanceList}" status="i" var="recipeImageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recipeImageInstance.id}">${fieldValue(bean: recipeImageInstance, field: "url")}</g:link></td>
					
						<td>${fieldValue(bean: recipeImageInstance, field: "alt")}</td>
					
						<td>${fieldValue(bean: recipeImageInstance, field: "presentation")}</td>
					
						<td>${fieldValue(bean: recipeImageInstance, field: "recipe")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipeImageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
