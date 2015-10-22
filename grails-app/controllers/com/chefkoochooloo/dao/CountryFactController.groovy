package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CountryFactController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CountryFact.list(params), model:[countryFactInstanceCount: CountryFact.count()]
    }

    def show(CountryFact countryFactInstance) {
        respond countryFactInstance
    }

    def create() {
        respond new CountryFact(params)
    }

    @Transactional
    def save(CountryFact countryFactInstance) {
        if (countryFactInstance == null) {
            notFound()
            return
        }

        if (countryFactInstance.hasErrors()) {
            respond countryFactInstance.errors, view:'create'
            return
        }

        countryFactInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'countryFact.label', default: 'CountryFact'), countryFactInstance.id])
                redirect countryFactInstance
            }
            '*' { respond countryFactInstance, [status: CREATED] }
        }
    }

    def edit(CountryFact countryFactInstance) {
        respond countryFactInstance
    }

    @Transactional
    def update(CountryFact countryFactInstance) {
        if (countryFactInstance == null) {
            notFound()
            return
        }

        if (countryFactInstance.hasErrors()) {
            respond countryFactInstance.errors, view:'edit'
            return
        }

        countryFactInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CountryFact.label', default: 'CountryFact'), countryFactInstance.id])
                redirect countryFactInstance
            }
            '*'{ respond countryFactInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CountryFact countryFactInstance) {

        if (countryFactInstance == null) {
            notFound()
            return
        }

        countryFactInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CountryFact.label', default: 'CountryFact'), countryFactInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'countryFact.label', default: 'CountryFact'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
