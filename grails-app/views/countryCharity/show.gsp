
<%@ page import="com.chefkoochooloo.dao.CountryCharity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'countryCharity.label', default: 'CountryCharity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-countryCharity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-countryCharity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list countryCharity">
			
				<g:if test="${countryCharityInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="countryCharity.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${countryCharityInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryCharityInstance?.donate}">
				<li class="fieldcontain">
					<span id="donate-label" class="property-label"><g:message code="countryCharity.donate.label" default="Donate" /></span>
					
						<span class="property-value" aria-labelledby="donate-label"><g:fieldValue bean="${countryCharityInstance}" field="donate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryCharityInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="countryCharity.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:link controller="country" action="show" id="${countryCharityInstance?.country?.id}">${countryCharityInstance?.country?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:countryCharityInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${countryCharityInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
