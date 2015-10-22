<%@ page import="com.chefkoochooloo.dao.LikeIngredient" %>



<div class="fieldcontain ${hasErrors(bean: likeIngredientInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="likeIngredient.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" value="${likeIngredientInstance.level}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: likeIngredientInstance, field: 'ingredient', 'error')} required">
	<label for="ingredient">
		<g:message code="likeIngredient.ingredient.label" default="Ingredient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ingredient" name="ingredient.id" from="${com.chefkoochooloo.dao.Ingredient.list()}" optionKey="id" required="" value="${likeIngredientInstance?.ingredient?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: likeIngredientInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="likeIngredient.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.chefkoochooloo.dao.User.list()}" optionKey="id" required="" value="${likeIngredientInstance?.user?.id}" class="many-to-one"/>

</div>

