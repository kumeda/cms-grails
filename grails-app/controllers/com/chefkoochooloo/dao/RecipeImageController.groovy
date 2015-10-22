package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecipeImageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RecipeImage.list(params), model:[recipeImageInstanceCount: RecipeImage.count()]
    }

    def show(RecipeImage recipeImageInstance) {
        respond recipeImageInstance
    }

    def create() {
        respond new RecipeImage(params)
    }

    @Transactional
    def save(RecipeImage recipeImageInstance) {
        if (recipeImageInstance == null) {
            notFound()
            return
        }

        if (recipeImageInstance.hasErrors()) {
            respond recipeImageInstance.errors, view:'create'
            return
        }

        recipeImageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recipeImage.label', default: 'RecipeImage'), recipeImageInstance.id])
                redirect recipeImageInstance
            }
            '*' { respond recipeImageInstance, [status: CREATED] }
        }
    }

    def edit(RecipeImage recipeImageInstance) {
        respond recipeImageInstance
    }

    @Transactional
    def update(RecipeImage recipeImageInstance) {
        if (recipeImageInstance == null) {
            notFound()
            return
        }

        if (recipeImageInstance.hasErrors()) {
            respond recipeImageInstance.errors, view:'edit'
            return
        }

        recipeImageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RecipeImage.label', default: 'RecipeImage'), recipeImageInstance.id])
                redirect recipeImageInstance
            }
            '*'{ respond recipeImageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RecipeImage recipeImageInstance) {

        if (recipeImageInstance == null) {
            notFound()
            return
        }

        recipeImageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RecipeImage.label', default: 'RecipeImage'), recipeImageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeImage.label', default: 'RecipeImage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
