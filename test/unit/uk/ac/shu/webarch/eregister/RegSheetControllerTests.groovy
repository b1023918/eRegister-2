package uk.ac.shu.webarch.eregister



import org.junit.*
import grails.test.mixin.*

@TestFor(RegSheetController)
@Mock(RegSheet)
class RegSheetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/regSheet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.regSheetInstanceList.size() == 0
        assert model.regSheetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.regSheetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.regSheetInstance != null
        assert view == '/regSheet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/regSheet/show/1'
        assert controller.flash.message != null
        assert RegSheet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/regSheet/list'

        populateValidParams(params)
        def regSheet = new RegSheet(params)

        assert regSheet.save() != null

        params.id = regSheet.id

        def model = controller.show()

        assert model.regSheetInstance == regSheet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/regSheet/list'

        populateValidParams(params)
        def regSheet = new RegSheet(params)

        assert regSheet.save() != null

        params.id = regSheet.id

        def model = controller.edit()

        assert model.regSheetInstance == regSheet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/regSheet/list'

        response.reset()

        populateValidParams(params)
        def regSheet = new RegSheet(params)

        assert regSheet.save() != null

        // test invalid parameters in update
        params.id = regSheet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/regSheet/edit"
        assert model.regSheetInstance != null

        regSheet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/regSheet/show/$regSheet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        regSheet.clearErrors()

        populateValidParams(params)
        params.id = regSheet.id
        params.version = -1
        controller.update()

        assert view == "/regSheet/edit"
        assert model.regSheetInstance != null
        assert model.regSheetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/regSheet/list'

        response.reset()

        populateValidParams(params)
        def regSheet = new RegSheet(params)

        assert regSheet.save() != null
        assert RegSheet.count() == 1

        params.id = regSheet.id

        controller.delete()

        assert RegSheet.count() == 0
        assert RegSheet.get(regSheet.id) == null
        assert response.redirectedUrl == '/regSheet/list'
    }
}
