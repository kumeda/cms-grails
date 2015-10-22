<%@ page import="com.chefkoochooloo.dao.RecipeIngredient" %>



<div class="fieldcontain ${hasErrors(bean: recipeIngredientInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="recipeIngredient.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: recipeIngredientInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeIngredientInstance, field: 'ingredient', 'error')} required">
	<label for="ingredient">
		<g:message code="recipeIngredient.ingredient.label" default="Ingredient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ingredient" name="ingredient.id" from="${com.chefkoochooloo.dao.Ingredient.list()}" optionKey="id" required="" value="${recipeIngredientInstance?.ingredient?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeIngredientInstance, field: 'recipe', 'error')} required">
	<label for="recipe">
		<g:message code="recipeIngredient.recipe.label" default="Recipe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recipe" name="recipe.id" from="${com.chefkoochooloo.dao.Recipe.list()}" optionKey="id" required="" value="${recipeIngredientInstance?.recipe?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeIngredientInstance, field: 'unit', 'error')} required">
	<label for="unit">
		<g:message code="recipeIngredient.unit.label" default="Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="unit" name="unit.id" from="${com.chefkoochooloo.dao.Unit.list()}" optionKey="id" required="" value="${recipeIngredientInstance?.unit?.id}" class="many-to-one"/>

</div>

