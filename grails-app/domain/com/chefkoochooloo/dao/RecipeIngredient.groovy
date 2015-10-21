package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class RecipeIngredient {

  static belongsTo = Recipe

  Integer id
  Integer ent
  Integer opt
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
    ent blank: true
    opt blank: true
  }
}
