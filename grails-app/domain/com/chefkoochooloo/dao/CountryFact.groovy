package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class CountryFact {

  static belongsTo = [country: Country]

  Integer id
  Integer ent
  Integer opt

  String fact

  static mapping = {
    table '`country_fact`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
  }
}

