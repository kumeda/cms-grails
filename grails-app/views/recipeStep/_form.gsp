<%@ page import="com.chefkoochooloo.dao.RecipeStep" %>



<div class="fieldcontain ${hasErrors(bean: recipeStepInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="recipeStep.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="type" type="number" min="0" max="1" value="${recipeStepInstance.type}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeStepInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="recipeStep.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="label" cols="40" rows="5" maxlength="500" required="" value="${recipeStepInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeStepInstance, field: 'recipe', 'error')} required">
	<label for="recipe">
		<g:message code="recipeStep.recipe.label" default="Recipe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recipe" name="recipe.id" from="${com.chefkoochooloo.dao.Recipe.list()}" optionKey="id" required="" value="${recipeStepInstance?.recipe?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeStepInstance, field: 'step', 'error')} required">
	<label for="step">
		<g:message code="recipeStep.step.label" default="Step" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="step" type="number" value="${recipeStepInstance.step}" required=""/>

</div>

