package uk.ac.shu.webarch.eregister

class RegClass {

	
	String className
	Instructor staffNumber
	Course courseNumber

	Set classes
	Set enroll

	static mappedBy = [enroll:'className', classes: 'className']
	static hasMany = [enroll:RegSheet, classes:Enrollment]

    static constraints = {
    }
}
