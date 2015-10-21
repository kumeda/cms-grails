package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Ingredient {

  Integer id
  Integer ent
  Integer opt
  Integer user
  String name
  String spotlight

  static mapping = {
    table '`ingredient`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
    name size: 1..200, blank:false
    spotlight size: 1..500, blank:false
  }
}
