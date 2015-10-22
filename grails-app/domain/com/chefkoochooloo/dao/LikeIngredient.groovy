package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class LikeIngredient implements Serializable {

  static belongsTo = User

  User    user
  Ingredient ingredient
  Integer level // 0 to 5

  static mapping = {
    table '`like_ingredient`'
    id composite: ['user', 'ingredient']
    user(column: "user_id")
    ingredient(column: "ingredient_id")
    cache true
    version false
  }

  static constraints = {
    level blank: false
  }
}
