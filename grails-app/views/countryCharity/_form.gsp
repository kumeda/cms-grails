<%@ page import="com.chefkoochooloo.dao.CountryCharity" %>



<div class="fieldcontain ${hasErrors(bean: countryCharityInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="countryCharity.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="url" cols="40" rows="5" maxlength="400" required="" value="${countryCharityInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryCharityInstance, field: 'donate', 'error')} required">
	<label for="donate">
		<g:message code="countryCharity.donate.label" default="Donate" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="donate" cols="40" rows="5" maxlength="1000" required="" value="${countryCharityInstance?.donate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryCharityInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="countryCharity.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="country" name="country.id" from="${com.chefkoochooloo.dao.Country.list()}" optionKey="id" required="" value="${countryCharityInstance?.country?.id}" class="many-to-one"/>

</div>

