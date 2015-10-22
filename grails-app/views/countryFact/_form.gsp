<%@ page import="com.chefkoochooloo.dao.CountryFact" %>



<div class="fieldcontain ${hasErrors(bean: countryFactInstance, field: 'fact', 'error')} required">
	<label for="fact">
		<g:message code="countryFact.fact.label" default="Fact" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fact" required="" value="${countryFactInstance?.fact}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryFactInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="countryFact.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="country" name="country.id" from="${com.chefkoochooloo.dao.Country.list()}" optionKey="id" required="" value="${countryFactInstance?.country?.id}" class="many-to-one"/>

</div>

