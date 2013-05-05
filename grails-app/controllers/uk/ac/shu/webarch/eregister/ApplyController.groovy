package uk.ac.shu.webarch.eregister

class ApplyController {

    def index() { }

	def processAttendence() {
	def result = [:]
	println(params)
	println("sheetNumber:${params.sheetNumber}")
	result.studentID = params.studentID
	result.sheetNumber = params.sheetNumber
	def locatedStudent = Student.findByStudentID(params.studentID)
	def locatedSheet = RegSheet.findBySheetNumber(params.sheetNumber)
	println("locatedStudent = ${locatedStudent}")	 //prints the student
	println("locatedSheet = ${locatedSheet}")	 //prints the sheet number
	def createdRegEntry = new RegEntry(studentID:locatedStudent, sheetNumber:locatedSheet).save()
	render( view:'index', model:result)
}


}
