package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class CountryCharity {

  static belongsTo = Country

  Integer id
  String donate
  String url
  Country country

  static mapping = {
    table '`country_charity`'
    cache true
    version false
  }

  static constraints = {
    url size: 1..400, blank: false
    donate size: 1..1000, blank: false
  }
}
