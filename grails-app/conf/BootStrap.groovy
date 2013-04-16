import uk.ac.shu.webarch.eregister.*;
class BootStrap {

    def init = { servletContext ->

	println("Bootstrap::init");

			/*Instructor reference data */
	
	def ian_instructor = Instructor.findByStaffNumber('b1027654') ?: new Instructor(staffNumber:'b1027654', staffName:'Ian Ibbotson', faculty:'ACES').save(failOnError:true);


	def matt_instructor = Instructor.findByStaffNumber('b1027655') ?: new Instructor(staffNumber:'b1027655', staffName:'Mathew Love', faculty:'ACES').save(failOnError:true);

			/*Course reference data*/

	def web_arch_course = Course.findByCourseNumber('1a') ?: new Course(courseNumber:'1a', courseName:'Web Architectures', courseLeader: ian_instructor, faculty:'ACES').save(failOnError:true);

	def effective_design_course = Course.findByCourseNumber('2a') ?: new Course(courseNumber:'2a', courseName:'Effective Design', courseLeader: matt_instructor, faculty:'ACES').save(failOnError:true);

	println("Created or looked up course: ${web_arch_course}");
	println("Created or looked up course: ${effective_design_course}");

			
			/*Student reference data */

	def zac_student = Student.findByStudentID('210293ZR') ?: new Student(studentID:'210293ZR', studentName:'Zac Richards', learningCentreNumber:'21027654', course: web_arch_course, height:204).save(failOnError:true);

	def lucy_student = Student.findByStudentID('210293LB') ?: new Student(studentID:'210293LB', studentName:'Lucy Benham', learningCentreNumber:'21027655', course:web_arch_course, height:100).save(failOnError:true);

	def luke_student = Student.findByStudentID('210293LM') ?: new Student(studentID:'210293LM', studentName:'Luke Mihic', learningCentreNumber:'21027656', course:effective_design_course, height:190).save(failOnError:true);





     
     /*If this app was being created for the real world, I would use reference data. Also it is important to note that this is all actually test data and not actual input data */ 

    }
    def destroy = {
    }
}
