package uk.ac.shu.webarch.eregister

class Instructor {

	String staffName
	String staffNumber
	String faculty
	
	


	static mappedBy = [classes:'staffNumber']
	static hasMany = [classes:RegClass]

    static constraints = {
	
	staffNumber unique: true
    }
}
