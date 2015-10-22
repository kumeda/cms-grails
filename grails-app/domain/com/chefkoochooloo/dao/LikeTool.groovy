package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class LikeTool implements Serializable {

  static belongsTo = User

  User    user
  Tool tool
  Integer level // 0 to 5

  static mapping = {
    table '`like_tool`'
    id composite: ['user', 'tool']
    user(column: "user_id")
    tool(column: "tool_id")
    cache true
    version false
  }

  static constraints = {
    level blank: false
  }
}
