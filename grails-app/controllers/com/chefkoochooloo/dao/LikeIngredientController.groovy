package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LikeIngredientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LikeIngredient.list(params), model:[likeIngredientInstanceCount: LikeIngredient.count()]
    }

    def show(LikeIngredient likeIngredientInstance) {
        respond likeIngredientInstance
    }

    def create() {
        respond new LikeIngredient(params)
    }

    @Transactional
    def save(LikeIngredient likeIngredientInstance) {
        if (likeIngredientInstance == null) {
            notFound()
            return
        }

        if (likeIngredientInstance.hasErrors()) {
            respond likeIngredientInstance.errors, view:'create'
            return
        }

        likeIngredientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'likeIngredient.label', default: 'LikeIngredient'), likeIngredientInstance.id])
                redirect likeIngredientInstance
            }
            '*' { respond likeIngredientInstance, [status: CREATED] }
        }
    }

    def edit(LikeIngredient likeIngredientInstance) {
        respond likeIngredientInstance
    }

    @Transactional
    def update(LikeIngredient likeIngredientInstance) {
        if (likeIngredientInstance == null) {
            notFound()
            return
        }

        if (likeIngredientInstance.hasErrors()) {
            respond likeIngredientInstance.errors, view:'edit'
            return
        }

        likeIngredientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LikeIngredient.label', default: 'LikeIngredient'), likeIngredientInstance.id])
                redirect likeIngredientInstance
            }
            '*'{ respond likeIngredientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LikeIngredient likeIngredientInstance) {

        if (likeIngredientInstance == null) {
            notFound()
            return
        }

        likeIngredientInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LikeIngredient.label', default: 'LikeIngredient'), likeIngredientInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'likeIngredient.label', default: 'LikeIngredient'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
