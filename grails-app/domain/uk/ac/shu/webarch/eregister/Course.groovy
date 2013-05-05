package uk.ac.shu.webarch.eregister

class Course {

	String courseName
	String courseNumber
	Instructor courseLeader
	String faculty
	
	static mappedBy = [classes:'courseNumber']
	static hasMany = [classes:RegClass]

    static constraints = {

	courseNumber unique: true
    }
}
