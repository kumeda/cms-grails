package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class User {

  Integer id
  String name

  static mapping = {
    table '`user`'
    cache true
    version false
  }

  static constraints = {
    name blank: false
  }
}
