package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecipeStepController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RecipeStep.list(params), model:[recipeStepInstanceCount: RecipeStep.count()]
    }

    def show(RecipeStep recipeStepInstance) {
        respond recipeStepInstance
    }

    def create() {
        respond new RecipeStep(params)
    }

    @Transactional
    def save(RecipeStep recipeStepInstance) {
        if (recipeStepInstance == null) {
            notFound()
            return
        }

        if (recipeStepInstance.hasErrors()) {
            respond recipeStepInstance.errors, view:'create'
            return
        }

        recipeStepInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recipeStep.label', default: 'RecipeStep'), recipeStepInstance.id])
                redirect recipeStepInstance
            }
            '*' { respond recipeStepInstance, [status: CREATED] }
        }
    }

    def edit(RecipeStep recipeStepInstance) {
        respond recipeStepInstance
    }

    @Transactional
    def update(RecipeStep recipeStepInstance) {
        if (recipeStepInstance == null) {
            notFound()
            return
        }

        if (recipeStepInstance.hasErrors()) {
            respond recipeStepInstance.errors, view:'edit'
            return
        }

        recipeStepInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RecipeStep.label', default: 'RecipeStep'), recipeStepInstance.id])
                redirect recipeStepInstance
            }
            '*'{ respond recipeStepInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RecipeStep recipeStepInstance) {

        if (recipeStepInstance == null) {
            notFound()
            return
        }

        recipeStepInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RecipeStep.label', default: 'RecipeStep'), recipeStepInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeStep.label', default: 'RecipeStep'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
