
<%@ page import="com.chefkoochooloo.dao.RecipeTool" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeTool.label', default: 'RecipeTool')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recipeTool" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recipeTool" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="recipeTool.recipe.label" default="Recipe" /></th>
					
						<th><g:message code="recipeTool.tool.label" default="Tool" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipeToolInstanceList}" status="i" var="recipeToolInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recipeToolInstance.id}">${fieldValue(bean: recipeToolInstance, field: "recipe")}</g:link></td>
					
						<td>${fieldValue(bean: recipeToolInstance, field: "tool")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipeToolInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
