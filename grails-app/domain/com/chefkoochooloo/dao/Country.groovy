package com.chefkoochooloo.dao

import groovy.transform.ToString

@ToString(includePackage=false, includeNames=true, excludes="")
class Country {

  static hasMany = [languages: Language, charities: CountryCharity, facts: CountryFact, recipes: Recipe]

  Integer id
  Integer ent
  Integer opt
  Integer population
  String capital
  String code
  String cover_url
  String flag_url
  String name
  String wish

  static mapping = {
    table '`country`'
    cache true
    version false
  }

  static constraints = {
    ent blank: true
    opt blank: true
  }
}
