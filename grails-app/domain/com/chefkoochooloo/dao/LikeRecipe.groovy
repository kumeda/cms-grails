package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class LikeRecipe implements Serializable {

  static belongsTo = User

  User    user
  Recipe recipe
  Integer level // 0 to 5

  static mapping = {
    table '`like_recipe`'
    id composite: ['user', 'recipe']
    user(column: "user_id")
    recipe(column: "recipe_id")
    cache true
    version false
  }

  static constraints = {
    level blank: false
  }
}
