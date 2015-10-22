<%@ page import="com.chefkoochooloo.dao.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ingredient.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="200" required="" value="${ingredientInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'spotlight', 'error')} required">
	<label for="spotlight">
		<g:message code="ingredient.spotlight.label" default="Spotlight" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="spotlight" cols="40" rows="5" maxlength="500" required="" value="${ingredientInstance?.spotlight}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'likes', 'error')} ">
	<label for="likes">
		<g:message code="ingredient.likes.label" default="Likes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ingredientInstance?.likes?}" var="l">
    <li><g:link controller="likeIngredient" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="likeIngredient" action="create" params="['ingredient.id': ingredientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'likeIngredient.label', default: 'LikeIngredient')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'recipes', 'error')} ">
	<label for="recipes">
		<g:message code="ingredient.recipes.label" default="Recipes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ingredientInstance?.recipes?}" var="r">
    <li><g:link controller="recipeIngredient" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="recipeIngredient" action="create" params="['ingredient.id': ingredientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient')])}</g:link>
</li>
</ul>


</div>

