package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FlagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Flag.list(params), model:[flagInstanceCount: Flag.count()]
    }

    def show(Flag flagInstance) {
        respond flagInstance
    }

    def create() {
        respond new Flag(params)
    }

    @Transactional
    def save(Flag flagInstance) {
        if (flagInstance == null) {
            notFound()
            return
        }

        if (flagInstance.hasErrors()) {
            respond flagInstance.errors, view:'create'
            return
        }

        flagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'flag.label', default: 'Flag'), flagInstance.id])
                redirect flagInstance
            }
            '*' { respond flagInstance, [status: CREATED] }
        }
    }

    def edit(Flag flagInstance) {
        respond flagInstance
    }

    @Transactional
    def update(Flag flagInstance) {
        if (flagInstance == null) {
            notFound()
            return
        }

        if (flagInstance.hasErrors()) {
            respond flagInstance.errors, view:'edit'
            return
        }

        flagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Flag.label', default: 'Flag'), flagInstance.id])
                redirect flagInstance
            }
            '*'{ respond flagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Flag flagInstance) {

        if (flagInstance == null) {
            notFound()
            return
        }

        flagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Flag.label', default: 'Flag'), flagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'flag.label', default: 'Flag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
