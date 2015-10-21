package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Language {

  Integer id
  Integer music
  String code
  String name
  String type

  static mapping = {
    table '`language`'
    cache true
    version false
  }

  static constraints = {
    name blank: false
  }
}
