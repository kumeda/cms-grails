package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Tool {

  Integer id
  Integer ent
  Integer opt
  String name
  String url

  static mapping = {
    table '`tool`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
  }
}
