package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class RecipeImage {

  static belongsTo = Recipe

  Integer id
  Integer presentation
  String alt
  String url
  Recipe recipe

  static mapping = {
    table '`recipe_image`'
    cache true
    version false
  }

  static constraints = {
    url blank: false
  }
}
