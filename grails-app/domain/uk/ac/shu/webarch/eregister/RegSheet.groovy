package uk.ac.shu.webarch.eregister

class RegSheet {
	
	String sheetNumber
	String classDate
	RegClass className
	
	static mappedBy = [classes:'sheetNumber']
	static hasMany = [classes:RegEntry]
	

    static constraints = {
    }
}
