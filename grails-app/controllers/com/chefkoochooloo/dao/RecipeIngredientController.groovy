package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecipeIngredientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RecipeIngredient.list(params), model:[recipeIngredientInstanceCount: RecipeIngredient.count()]
    }

    def show(RecipeIngredient recipeIngredientInstance) {
        respond recipeIngredientInstance
    }

    def create() {
        respond new RecipeIngredient(params)
    }

    @Transactional
    def save(RecipeIngredient recipeIngredientInstance) {
        if (recipeIngredientInstance == null) {
            notFound()
            return
        }

        if (recipeIngredientInstance.hasErrors()) {
            respond recipeIngredientInstance.errors, view:'create'
            return
        }

        recipeIngredientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), recipeIngredientInstance.id])
                redirect recipeIngredientInstance
            }
            '*' { respond recipeIngredientInstance, [status: CREATED] }
        }
    }

    def edit(RecipeIngredient recipeIngredientInstance) {
        respond recipeIngredientInstance
    }

    @Transactional
    def update(RecipeIngredient recipeIngredientInstance) {
        if (recipeIngredientInstance == null) {
            notFound()
            return
        }

        if (recipeIngredientInstance.hasErrors()) {
            respond recipeIngredientInstance.errors, view:'edit'
            return
        }

        recipeIngredientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RecipeIngredient.label', default: 'RecipeIngredient'), recipeIngredientInstance.id])
                redirect recipeIngredientInstance
            }
            '*'{ respond recipeIngredientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RecipeIngredient recipeIngredientInstance) {

        if (recipeIngredientInstance == null) {
            notFound()
            return
        }

        recipeIngredientInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RecipeIngredient.label', default: 'RecipeIngredient'), recipeIngredientInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
