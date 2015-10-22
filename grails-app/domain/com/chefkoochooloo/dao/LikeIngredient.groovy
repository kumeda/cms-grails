package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class LikeIngredient {

  static belongsTo = User

  Integer id
  User    user
  Ingredient ingredient
  Integer level // 0 to 5

  static mapping = {
    table '`like_ingredient`'
    cache true
    version false
  }

  static constraints = {
    level blank: false
  }
}
