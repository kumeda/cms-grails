<%@ page import="com.chefkoochooloo.dao.LikeRecipe" %>



<div class="fieldcontain ${hasErrors(bean: likeRecipeInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="likeRecipe.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" value="${likeRecipeInstance.level}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: likeRecipeInstance, field: 'recipe', 'error')} required">
	<label for="recipe">
		<g:message code="likeRecipe.recipe.label" default="Recipe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recipe" name="recipe.id" from="${com.chefkoochooloo.dao.Recipe.list()}" optionKey="id" required="" value="${likeRecipeInstance?.recipe?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: likeRecipeInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="likeRecipe.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.chefkoochooloo.dao.User.list()}" optionKey="id" required="" value="${likeRecipeInstance?.user?.id}" class="many-to-one"/>

</div>

