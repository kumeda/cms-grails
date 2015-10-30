<%@ page import="com.chefkoochooloo.dao.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tag.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${tagInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'recipes', 'error')} ">
	<label for="recipes">
		<g:message code="tag.recipes.label" default="Recipes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tagInstance?.recipes?}" var="r">
    <li><g:link controller="recipeTag" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="recipeTag" action="create" params="['tag.id': tagInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'recipeTag.label', default: 'RecipeTag')])}</g:link>
</li>
</ul>


</div>

