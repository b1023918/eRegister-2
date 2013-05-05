package uk.ac.shu.webarch.eregister

import org.springframework.dao.DataIntegrityViolationException

class RegSheetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [regSheetInstanceList: RegSheet.list(params), regSheetInstanceTotal: RegSheet.count()]
    }

    def create() {
        [regSheetInstance: new RegSheet(params)]
    }

    def save() {
        def regSheetInstance = new RegSheet(params)
        if (!regSheetInstance.save(flush: true)) {
            render(view: "create", model: [regSheetInstance: regSheetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'regSheet.label', default: 'RegSheet'), regSheetInstance.id])
        redirect(action: "show", id: regSheetInstance.id)
    }

    def show(Long id) {
        def regSheetInstance = RegSheet.get(id)
        if (!regSheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regSheet.label', default: 'RegSheet'), id])
            redirect(action: "list")
            return
        }

        [regSheetInstance: regSheetInstance]
    }

    def edit(Long id) {
        def regSheetInstance = RegSheet.get(id)
        if (!regSheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regSheet.label', default: 'RegSheet'), id])
            redirect(action: "list")
            return
        }

        [regSheetInstance: regSheetInstance]
    }

    def update(Long id, Long version) {
        def regSheetInstance = RegSheet.get(id)
        if (!regSheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regSheet.label', default: 'RegSheet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regSheetInstance.version > version) {
                regSheetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regSheet.label', default: 'RegSheet')] as Object[],
                          "Another user has updated this RegSheet while you were editing")
                render(view: "edit", model: [regSheetInstance: regSheetInstance])
                return
            }
        }

        regSheetInstance.properties = params

        if (!regSheetInstance.save(flush: true)) {
            render(view: "edit", model: [regSheetInstance: regSheetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'regSheet.label', default: 'RegSheet'), regSheetInstance.id])
        redirect(action: "show", id: regSheetInstance.id)
    }

    def delete(Long id) {
        def regSheetInstance = RegSheet.get(id)
        if (!regSheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regSheet.label', default: 'RegSheet'), id])
            redirect(action: "list")
            return
        }

        try {
            regSheetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regSheet.label', default: 'RegSheet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regSheet.label', default: 'RegSheet'), id])
            redirect(action: "show", id: id)
        }
    }
}
