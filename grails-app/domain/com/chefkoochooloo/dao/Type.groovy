package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Type {

  Integer id
  String name

  static mapping = {
    table '`type`'
    cache true
    version false
  }

  static constraints = {
    name blank: false
  }
}
