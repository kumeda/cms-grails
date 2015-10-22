package com.chefkoochooloo.dao



import grails.test.mixin.*
import spock.lang.*

@TestFor(FlagController)
@Mock(Flag)
class FlagControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.flagInstanceList
            model.flagInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.flagInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def flag = new Flag()
            flag.validate()
            controller.save(flag)

        then:"The create view is rendered again with the correct model"
            model.flagInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            flag = new Flag(params)

            controller.save(flag)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/flag/show/1'
            controller.flash.message != null
            Flag.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def flag = new Flag(params)
            controller.show(flag)

        then:"A model is populated containing the domain instance"
            model.flagInstance == flag
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def flag = new Flag(params)
            controller.edit(flag)

        then:"A model is populated containing the domain instance"
            model.flagInstance == flag
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/flag/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def flag = new Flag()
            flag.validate()
            controller.update(flag)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.flagInstance == flag

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            flag = new Flag(params).save(flush: true)
            controller.update(flag)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/flag/show/$flag.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/flag/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def flag = new Flag(params).save(flush: true)

        then:"It exists"
            Flag.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(flag)

        then:"The instance is deleted"
            Flag.count() == 0
            response.redirectedUrl == '/flag/index'
            flash.message != null
    }
}
