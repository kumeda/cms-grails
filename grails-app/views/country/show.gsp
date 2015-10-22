
<%@ page import="com.chefkoochooloo.dao.Country" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-country" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list country">
			
				<g:if test="${countryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="country.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${countryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.cover_url}">
				<li class="fieldcontain">
					<span id="cover_url-label" class="property-label"><g:message code="country.cover_url.label" default="Coverurl" /></span>
					
						<span class="property-value" aria-labelledby="cover_url-label"><g:fieldValue bean="${countryInstance}" field="cover_url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.flag_url}">
				<li class="fieldcontain">
					<span id="flag_url-label" class="property-label"><g:message code="country.flag_url.label" default="Flagurl" /></span>
					
						<span class="property-value" aria-labelledby="flag_url-label"><g:fieldValue bean="${countryInstance}" field="flag_url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.capital}">
				<li class="fieldcontain">
					<span id="capital-label" class="property-label"><g:message code="country.capital.label" default="Capital" /></span>
					
						<span class="property-value" aria-labelledby="capital-label"><g:fieldValue bean="${countryInstance}" field="capital"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.charities}">
				<li class="fieldcontain">
					<span id="charities-label" class="property-label"><g:message code="country.charities.label" default="Charities" /></span>
					
						<g:each in="${countryInstance.charities}" var="c">
						<span class="property-value" aria-labelledby="charities-label"><g:link controller="countryCharity" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="country.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${countryInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.facts}">
				<li class="fieldcontain">
					<span id="facts-label" class="property-label"><g:message code="country.facts.label" default="Facts" /></span>
					
						<g:each in="${countryInstance.facts}" var="f">
						<span class="property-value" aria-labelledby="facts-label"><g:link controller="countryFact" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.languages}">
				<li class="fieldcontain">
					<span id="languages-label" class="property-label"><g:message code="country.languages.label" default="Languages" /></span>
					
						<g:each in="${countryInstance.languages}" var="l">
						<span class="property-value" aria-labelledby="languages-label"><g:link controller="language" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.population}">
				<li class="fieldcontain">
					<span id="population-label" class="property-label"><g:message code="country.population.label" default="Population" /></span>
					
						<span class="property-value" aria-labelledby="population-label"><g:fieldValue bean="${countryInstance}" field="population"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.recipes}">
				<li class="fieldcontain">
					<span id="recipes-label" class="property-label"><g:message code="country.recipes.label" default="Recipes" /></span>
					
						<g:each in="${countryInstance.recipes}" var="r">
						<span class="property-value" aria-labelledby="recipes-label"><g:link controller="recipe" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.wish}">
				<li class="fieldcontain">
					<span id="wish-label" class="property-label"><g:message code="country.wish.label" default="Wish" /></span>
					
						<span class="property-value" aria-labelledby="wish-label"><g:fieldValue bean="${countryInstance}" field="wish"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:countryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${countryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
