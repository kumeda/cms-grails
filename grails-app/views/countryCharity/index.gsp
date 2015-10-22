
<%@ page import="com.chefkoochooloo.dao.CountryCharity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'countryCharity.label', default: 'CountryCharity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-countryCharity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-countryCharity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="url" title="${message(code: 'countryCharity.url.label', default: 'Url')}" />
					
						<g:sortableColumn property="donate" title="${message(code: 'countryCharity.donate.label', default: 'Donate')}" />
					
						<th><g:message code="countryCharity.country.label" default="Country" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${countryCharityInstanceList}" status="i" var="countryCharityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${countryCharityInstance.id}">${fieldValue(bean: countryCharityInstance, field: "url")}</g:link></td>
					
						<td>${fieldValue(bean: countryCharityInstance, field: "donate")}</td>
					
						<td>${fieldValue(bean: countryCharityInstance, field: "country")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${countryCharityInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
