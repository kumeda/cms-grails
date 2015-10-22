package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CountryCharityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CountryCharity.list(params), model:[countryCharityInstanceCount: CountryCharity.count()]
    }

    def show(CountryCharity countryCharityInstance) {
        respond countryCharityInstance
    }

    def create() {
        respond new CountryCharity(params)
    }

    @Transactional
    def save(CountryCharity countryCharityInstance) {
        if (countryCharityInstance == null) {
            notFound()
            return
        }

        if (countryCharityInstance.hasErrors()) {
            respond countryCharityInstance.errors, view:'create'
            return
        }

        countryCharityInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'countryCharity.label', default: 'CountryCharity'), countryCharityInstance.id])
                redirect countryCharityInstance
            }
            '*' { respond countryCharityInstance, [status: CREATED] }
        }
    }

    def edit(CountryCharity countryCharityInstance) {
        respond countryCharityInstance
    }

    @Transactional
    def update(CountryCharity countryCharityInstance) {
        if (countryCharityInstance == null) {
            notFound()
            return
        }

        if (countryCharityInstance.hasErrors()) {
            respond countryCharityInstance.errors, view:'edit'
            return
        }

        countryCharityInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CountryCharity.label', default: 'CountryCharity'), countryCharityInstance.id])
                redirect countryCharityInstance
            }
            '*'{ respond countryCharityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CountryCharity countryCharityInstance) {

        if (countryCharityInstance == null) {
            notFound()
            return
        }

        countryCharityInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CountryCharity.label', default: 'CountryCharity'), countryCharityInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'countryCharity.label', default: 'CountryCharity'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
