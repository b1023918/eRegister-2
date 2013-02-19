package uk.ac.shu.webarch.eregister

class Instructor {

	String staffName
	String staffNumber
	String faculty
	Long instructorAge
	

	static mappedBy = [classes:'staffNumber']
	static hasMany = [classes:RegClass]

    static constraints = {
    }
}
