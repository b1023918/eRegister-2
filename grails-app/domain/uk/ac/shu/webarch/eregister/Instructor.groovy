package uk.ac.shu.webarch.eregister

class Instructor {

  String instructorName
  Long instructorAge

  static mappedBy = [classes:'classInstructor']
  static hasMany = [classes:RegClass]

    static constraints = {
    }
}
