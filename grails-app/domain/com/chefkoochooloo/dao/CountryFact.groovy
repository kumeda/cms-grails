package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class CountryFact {

  static belongsTo = Country

  Integer id
  Country country
  String fact

  static mapping = {
    table '`country_fact`'
    fact length: 1000 // determine how big a fact can be
    cache true
    version false
  }

  static constraints = {
    fact size: 1..1000, blank: false
  }
}
