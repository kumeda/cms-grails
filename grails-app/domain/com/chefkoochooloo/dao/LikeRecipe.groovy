package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class LikeRecipe {

  static belongsTo = User

  Integer id
  User    user
  Recipe recipe
  Integer level // 0 to 5

  static mapping = {
    table '`like_recipe`'
    cache true
    version false
  }

  static constraints = {
    level blank: false
  }
}
