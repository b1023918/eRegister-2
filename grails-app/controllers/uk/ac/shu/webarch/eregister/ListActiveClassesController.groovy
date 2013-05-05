package uk.ac.shu.webarch.eregister
import grails.converters.*


class ListActiveClassesController {

    def index() { 

	def result=[:]
	result.sheets = []
	RegSheet.list().each { sheet ->
	println("sheet.sigs=${sheet.classes.size()}")
	if(sheet.classes.size()>0){
	
	result.sheets.add(sheet)
	}
	}

	
	withFormat {
		html result
		xml { render result as XML }
		json { render result as JSON }

      }	
   }
}
