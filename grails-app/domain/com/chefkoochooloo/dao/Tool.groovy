package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Tool {

  static hasMany = [likes: LikeTool]

  Integer id
  String name
  String url

  static mapping = {
    table '`tool`'
    url length: 500 // determine how big a url can be
    cache true
    version false
  }

  static constraints = {
    name blank: false
    url size: 1..500, blank: false
  }
}
