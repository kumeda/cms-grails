package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LikeRecipeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LikeRecipe.list(params), model:[likeRecipeInstanceCount: LikeRecipe.count()]
    }

    def show(LikeRecipe likeRecipeInstance) {
        respond likeRecipeInstance
    }

    def create() {
        respond new LikeRecipe(params)
    }

    @Transactional
    def save(LikeRecipe likeRecipeInstance) {
        if (likeRecipeInstance == null) {
            notFound()
            return
        }

        if (likeRecipeInstance.hasErrors()) {
            respond likeRecipeInstance.errors, view:'create'
            return
        }

        likeRecipeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'likeRecipe.label', default: 'LikeRecipe'), likeRecipeInstance.id])
                redirect likeRecipeInstance
            }
            '*' { respond likeRecipeInstance, [status: CREATED] }
        }
    }

    def edit(LikeRecipe likeRecipeInstance) {
        respond likeRecipeInstance
    }

    @Transactional
    def update(LikeRecipe likeRecipeInstance) {
        if (likeRecipeInstance == null) {
            notFound()
            return
        }

        if (likeRecipeInstance.hasErrors()) {
            respond likeRecipeInstance.errors, view:'edit'
            return
        }

        likeRecipeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LikeRecipe.label', default: 'LikeRecipe'), likeRecipeInstance.id])
                redirect likeRecipeInstance
            }
            '*'{ respond likeRecipeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LikeRecipe likeRecipeInstance) {

        if (likeRecipeInstance == null) {
            notFound()
            return
        }

        likeRecipeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LikeRecipe.label', default: 'LikeRecipe'), likeRecipeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'likeRecipe.label', default: 'LikeRecipe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
