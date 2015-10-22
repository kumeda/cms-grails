package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ToolController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tool.list(params), model:[toolInstanceCount: Tool.count()]
    }

    def show(Tool toolInstance) {
        respond toolInstance
    }

    def create() {
        respond new Tool(params)
    }

    @Transactional
    def save(Tool toolInstance) {
        if (toolInstance == null) {
            notFound()
            return
        }

        if (toolInstance.hasErrors()) {
            respond toolInstance.errors, view:'create'
            return
        }

        toolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tool.label', default: 'Tool'), toolInstance.id])
                redirect toolInstance
            }
            '*' { respond toolInstance, [status: CREATED] }
        }
    }

    def edit(Tool toolInstance) {
        respond toolInstance
    }

    @Transactional
    def update(Tool toolInstance) {
        if (toolInstance == null) {
            notFound()
            return
        }

        if (toolInstance.hasErrors()) {
            respond toolInstance.errors, view:'edit'
            return
        }

        toolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tool.label', default: 'Tool'), toolInstance.id])
                redirect toolInstance
            }
            '*'{ respond toolInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tool toolInstance) {

        if (toolInstance == null) {
            notFound()
            return
        }

        toolInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tool.label', default: 'Tool'), toolInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tool.label', default: 'Tool'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
