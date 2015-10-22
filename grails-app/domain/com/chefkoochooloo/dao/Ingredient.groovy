package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Ingredient {

  static hasMany = [recipes: RecipeIngredient, likes: LikeIngredient]

  Integer id
  String name
  String spotlight

  static mapping = {
    table '`ingredient`'
    spotlight length: 1000 // determine how big a spotlight can be
    cache true
    version false
  }

  static constraints = {
    name size: 1..200, blank:false
    spotlight size: 1..1000, blank:false
  }
}
