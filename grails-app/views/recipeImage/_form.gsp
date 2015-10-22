<%@ page import="com.chefkoochooloo.dao.RecipeImage" %>



<div class="fieldcontain ${hasErrors(bean: recipeImageInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="recipeImage.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="url" cols="40" rows="5" maxlength="500" required="" value="${recipeImageInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeImageInstance, field: 'alt', 'error')} required">
	<label for="alt">
		<g:message code="recipeImage.alt.label" default="Alt" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="alt" required="" value="${recipeImageInstance?.alt}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeImageInstance, field: 'presentation', 'error')} required">
	<label for="presentation">
		<g:message code="recipeImage.presentation.label" default="Presentation" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="presentation" type="number" value="${recipeImageInstance.presentation}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeImageInstance, field: 'recipe', 'error')} required">
	<label for="recipe">
		<g:message code="recipeImage.recipe.label" default="Recipe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recipe" name="recipe.id" from="${com.chefkoochooloo.dao.Recipe.list()}" optionKey="id" required="" value="${recipeImageInstance?.recipe?.id}" class="many-to-one"/>

</div>

