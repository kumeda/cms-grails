
<%@ page import="com.chefkoochooloo.dao.LikeRecipe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'likeRecipe.label', default: 'LikeRecipe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-likeRecipe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-likeRecipe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="level" title="${message(code: 'likeRecipe.level.label', default: 'Level')}" />
					
						<th><g:message code="likeRecipe.recipe.label" default="Recipe" /></th>
					
						<th><g:message code="likeRecipe.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${likeRecipeInstanceList}" status="i" var="likeRecipeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${likeRecipeInstance.id}">${fieldValue(bean: likeRecipeInstance, field: "level")}</g:link></td>
					
						<td>${fieldValue(bean: likeRecipeInstance, field: "recipe")}</td>
					
						<td>${fieldValue(bean: likeRecipeInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${likeRecipeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
