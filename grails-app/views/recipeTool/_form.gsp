<%@ page import="com.chefkoochooloo.dao.RecipeTool" %>



<div class="fieldcontain ${hasErrors(bean: recipeToolInstance, field: 'recipe', 'error')} required">
	<label for="recipe">
		<g:message code="recipeTool.recipe.label" default="Recipe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recipe" name="recipe.id" from="${com.chefkoochooloo.dao.Recipe.list()}" optionKey="id" required="" value="${recipeToolInstance?.recipe?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeToolInstance, field: 'tool', 'error')} required">
	<label for="tool">
		<g:message code="recipeTool.tool.label" default="Tool" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tool" name="tool.id" from="${com.chefkoochooloo.dao.Tool.list()}" optionKey="id" required="" value="${recipeToolInstance?.tool?.id}" class="many-to-one"/>

</div>

