
<%@ page import="com.chefkoochooloo.dao.CountryFact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'countryFact.label', default: 'CountryFact')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-countryFact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-countryFact" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fact" title="${message(code: 'countryFact.fact.label', default: 'Fact')}" />
					
						<th><g:message code="countryFact.country.label" default="Country" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${countryFactInstanceList}" status="i" var="countryFactInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${countryFactInstance.id}">${fieldValue(bean: countryFactInstance, field: "fact")}</g:link></td>
					
						<td>${fieldValue(bean: countryFactInstance, field: "country")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${countryFactInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
