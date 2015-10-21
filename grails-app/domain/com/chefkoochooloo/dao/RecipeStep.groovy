package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class RecipeStep {

  static belongsTo = Recipe

  Integer id
  Integer ent
  Integer opt
  Integer recipe_order
  Integer type
  String label
  Recipe recipe

  static mapping = {
    table '`recipe_step`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
  }
}
