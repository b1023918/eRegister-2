package uk.ac.shu.webarch.eregister

class Enrollment {

	
	String enrollmentNo
	Student studentID
	RegClass className
	String studentContactDetails



	

    static constraints = {

	enrollmentNo unique: true
    }
}
