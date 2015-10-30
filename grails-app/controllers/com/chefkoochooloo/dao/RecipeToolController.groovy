package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecipeToolController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RecipeTool.list(params), model:[recipeToolInstanceCount: RecipeTool.count()]
    }

    def show(RecipeTool recipeToolInstance) {
        respond recipeToolInstance
    }

    def create() {
        respond new RecipeTool(params)
    }

    @Transactional
    def save(RecipeTool recipeToolInstance) {
        if (recipeToolInstance == null) {
            notFound()
            return
        }

        if (recipeToolInstance.hasErrors()) {
            respond recipeToolInstance.errors, view:'create'
            return
        }

        recipeToolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recipeTool.label', default: 'RecipeTool'), recipeToolInstance.id])
                redirect recipeToolInstance
            }
            '*' { respond recipeToolInstance, [status: CREATED] }
        }
    }

    def edit(RecipeTool recipeToolInstance) {
        respond recipeToolInstance
    }

    @Transactional
    def update(RecipeTool recipeToolInstance) {
        if (recipeToolInstance == null) {
            notFound()
            return
        }

        if (recipeToolInstance.hasErrors()) {
            respond recipeToolInstance.errors, view:'edit'
            return
        }

        recipeToolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RecipeTool.label', default: 'RecipeTool'), recipeToolInstance.id])
                redirect recipeToolInstance
            }
            '*'{ respond recipeToolInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RecipeTool recipeToolInstance) {

        if (recipeToolInstance == null) {
            notFound()
            return
        }

        recipeToolInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RecipeTool.label', default: 'RecipeTool'), recipeToolInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeTool.label', default: 'RecipeTool'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
