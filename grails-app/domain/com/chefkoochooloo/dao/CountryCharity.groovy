package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class CountryCharity {

  Integer id
  Integer ent
  Integer opt
  Integer country
  String donate
  String url
  Integer country_id 
 

  static mapping = {
    table '`country_charity`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
    donate size: 1..400, blank: false
  }
}

