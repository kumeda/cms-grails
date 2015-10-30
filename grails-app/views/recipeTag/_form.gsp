<%@ page import="com.chefkoochooloo.dao.RecipeTag" %>



<div class="fieldcontain ${hasErrors(bean: recipeTagInstance, field: 'recipe', 'error')} required">
	<label for="recipe">
		<g:message code="recipeTag.recipe.label" default="Recipe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recipe" name="recipe.id" from="${com.chefkoochooloo.dao.Recipe.list()}" optionKey="id" required="" value="${recipeTagInstance?.recipe?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeTagInstance, field: 'tag', 'error')} required">
	<label for="tag">
		<g:message code="recipeTag.tag.label" default="Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tag" name="tag.id" from="${com.chefkoochooloo.dao.Tag.list()}" optionKey="id" required="" value="${recipeTagInstance?.tag?.id}" class="many-to-one"/>

</div>

