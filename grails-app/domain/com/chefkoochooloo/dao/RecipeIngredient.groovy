package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class RecipeIngredient {

  static belongsTo = Recipe

  Integer id
  Ingredient ingredient
  Unit unit
  Float amount
  Recipe recipe

  static mapping = {
    table '`recipe_ingredient`'
    cache true
    version false
  }

  static constraints = {
    amount blank: false
  }
}
