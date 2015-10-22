package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Recipe {
  static belongsTo = Country
  static hasMany = [tools: Tool, flags: Flag, ingredients: RecipeIngredient, images: RecipeImage, types: Type, steps: RecipeStep, countries: Country, likes: LikeRecipe]

  Integer id
  String name
  String presentation
  String time // TBD: this should be a Date
  User   user

  static mapping = {
    table '`recipe`'
    cache true
    version false
  }

  static constraints = {
    name blank: false
  }
}
