package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Recipe {
  static belongsTo = Country
  static hasMany = [tools: Tool, flags: Flag, ingredients: RecipeIngredient, images: RecipeImage, types: Type, steps: RecipeStep, countries: Country]

  Integer id
  Integer ent
  Integer opt
  String name
  String presentation
  String time

  static mapping = {
    table '`recipe`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
  }
}
