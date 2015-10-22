package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class LikeTool {

  static belongsTo = User

  Integer id
  User    user
  Tool tool
  Integer level // 0 to 5

  static mapping = {
    table '`like_tool`'
    cache true
    version false
  }

  static constraints = {
    level blank: false
  }
}
