package uk.ac.shu.webarch.eregister

class Student {

	
	String studentID
	String studentName
	String learningCentreNumber
	String courseNumber
	Long height

	Set classes
	Set attendances

	static mappedBy = [attendances:'studentID', classes: 'studentID']
	static hasMany = [attendances:RegEntry, classes:Enrollment]

    static constraints = {

	studentID unique: true
    }
}
