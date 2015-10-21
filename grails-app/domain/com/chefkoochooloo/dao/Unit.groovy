package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Unit {

  Integer id
  String name

  static mapping = {
    table '`unit`'
    cache true
    version false
  }

  static constraints = {
    name blank: false
  }
}

