package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Type {

  Integer id
  Integer ent
  Integer opt
  String name
  String presentation
  String time

  static mapping = {
    table '`type`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
  }
}
