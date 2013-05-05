package uk.ac.shu.webarch.eregister



import org.junit.*
import grails.test.mixin.*

@TestFor(RegEntryController)
@Mock(RegEntry)
class RegEntryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/regEntry/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.regEntryInstanceList.size() == 0
        assert model.regEntryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.regEntryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.regEntryInstance != null
        assert view == '/regEntry/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/regEntry/show/1'
        assert controller.flash.message != null
        assert RegEntry.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/regEntry/list'

        populateValidParams(params)
        def regEntry = new RegEntry(params)

        assert regEntry.save() != null

        params.id = regEntry.id

        def model = controller.show()

        assert model.regEntryInstance == regEntry
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/regEntry/list'

        populateValidParams(params)
        def regEntry = new RegEntry(params)

        assert regEntry.save() != null

        params.id = regEntry.id

        def model = controller.edit()

        assert model.regEntryInstance == regEntry
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/regEntry/list'

        response.reset()

        populateValidParams(params)
        def regEntry = new RegEntry(params)

        assert regEntry.save() != null

        // test invalid parameters in update
        params.id = regEntry.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/regEntry/edit"
        assert model.regEntryInstance != null

        regEntry.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/regEntry/show/$regEntry.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        regEntry.clearErrors()

        populateValidParams(params)
        params.id = regEntry.id
        params.version = -1
        controller.update()

        assert view == "/regEntry/edit"
        assert model.regEntryInstance != null
        assert model.regEntryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/regEntry/list'

        response.reset()

        populateValidParams(params)
        def regEntry = new RegEntry(params)

        assert regEntry.save() != null
        assert RegEntry.count() == 1

        params.id = regEntry.id

        controller.delete()

        assert RegEntry.count() == 0
        assert RegEntry.get(regEntry.id) == null
        assert response.redirectedUrl == '/regEntry/list'
    }
}
