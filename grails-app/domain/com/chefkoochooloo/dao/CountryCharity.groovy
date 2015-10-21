package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class CountryCharity {
  
  static belongsTo = [country: Country]

  Integer id
  Integer ent
  Integer opt
  String donate
  String url
 
  static mapping = {
    table '`country_charity`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
    url size: 1..400, blank: false
    donate size: 1..1000, blank: false
  }
}

