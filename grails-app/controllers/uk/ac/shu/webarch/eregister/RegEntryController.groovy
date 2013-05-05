package uk.ac.shu.webarch.eregister

import org.springframework.dao.DataIntegrityViolationException

class RegEntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [regEntryInstanceList: RegEntry.list(params), regEntryInstanceTotal: RegEntry.count()]
    }

    def create() {
        [regEntryInstance: new RegEntry(params)]
    }

    def save() {
        def regEntryInstance = new RegEntry(params)
        if (!regEntryInstance.save(flush: true)) {
            render(view: "create", model: [regEntryInstance: regEntryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'regEntry.label', default: 'RegEntry'), regEntryInstance.id])
        redirect(action: "show", id: regEntryInstance.id)
    }

    def show(Long id) {
        def regEntryInstance = RegEntry.get(id)
        if (!regEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regEntry.label', default: 'RegEntry'), id])
            redirect(action: "list")
            return
        }

        [regEntryInstance: regEntryInstance]
    }

    def edit(Long id) {
        def regEntryInstance = RegEntry.get(id)
        if (!regEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regEntry.label', default: 'RegEntry'), id])
            redirect(action: "list")
            return
        }

        [regEntryInstance: regEntryInstance]
    }

    def update(Long id, Long version) {
        def regEntryInstance = RegEntry.get(id)
        if (!regEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regEntry.label', default: 'RegEntry'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regEntryInstance.version > version) {
                regEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regEntry.label', default: 'RegEntry')] as Object[],
                          "Another user has updated this RegEntry while you were editing")
                render(view: "edit", model: [regEntryInstance: regEntryInstance])
                return
            }
        }

        regEntryInstance.properties = params

        if (!regEntryInstance.save(flush: true)) {
            render(view: "edit", model: [regEntryInstance: regEntryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'regEntry.label', default: 'RegEntry'), regEntryInstance.id])
        redirect(action: "show", id: regEntryInstance.id)
    }

    def delete(Long id) {
        def regEntryInstance = RegEntry.get(id)
        if (!regEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regEntry.label', default: 'RegEntry'), id])
            redirect(action: "list")
            return
        }

        try {
            regEntryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regEntry.label', default: 'RegEntry'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regEntry.label', default: 'RegEntry'), id])
            redirect(action: "show", id: id)
        }
    }
}
