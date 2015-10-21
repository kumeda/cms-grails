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
    cache true
    version false
  }

  static constraints = {
    fact blank: false
  }
}
