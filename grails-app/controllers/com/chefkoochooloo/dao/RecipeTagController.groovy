package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecipeTagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RecipeTag.list(params), model:[recipeTagInstanceCount: RecipeTag.count()]
    }

    def show(RecipeTag recipeTagInstance) {
        respond recipeTagInstance
    }

    def create() {
        respond new RecipeTag(params)
    }

    @Transactional
    def save(RecipeTag recipeTagInstance) {
        if (recipeTagInstance == null) {
            notFound()
            return
        }

        if (recipeTagInstance.hasErrors()) {
            respond recipeTagInstance.errors, view:'create'
            return
        }

        recipeTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recipeTag.label', default: 'RecipeTag'), recipeTagInstance.id])
                redirect recipeTagInstance
            }
            '*' { respond recipeTagInstance, [status: CREATED] }
        }
    }

    def edit(RecipeTag recipeTagInstance) {
        respond recipeTagInstance
    }

    @Transactional
    def update(RecipeTag recipeTagInstance) {
        if (recipeTagInstance == null) {
            notFound()
            return
        }

        if (recipeTagInstance.hasErrors()) {
            respond recipeTagInstance.errors, view:'edit'
            return
        }

        recipeTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RecipeTag.label', default: 'RecipeTag'), recipeTagInstance.id])
                redirect recipeTagInstance
            }
            '*'{ respond recipeTagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RecipeTag recipeTagInstance) {

        if (recipeTagInstance == null) {
            notFound()
            return
        }

        recipeTagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RecipeTag.label', default: 'RecipeTag'), recipeTagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeTag.label', default: 'RecipeTag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
