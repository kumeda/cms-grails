package com.chefkoochooloo.dao



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LikeToolController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LikeTool.list(params), model:[likeToolInstanceCount: LikeTool.count()]
    }

    def show(LikeTool likeToolInstance) {
        respond likeToolInstance
    }

    def create() {
        respond new LikeTool(params)
    }

    @Transactional
    def save(LikeTool likeToolInstance) {
        if (likeToolInstance == null) {
            notFound()
            return
        }

        if (likeToolInstance.hasErrors()) {
            respond likeToolInstance.errors, view:'create'
            return
        }

        likeToolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'likeTool.label', default: 'LikeTool'), likeToolInstance.id])
                redirect likeToolInstance
            }
            '*' { respond likeToolInstance, [status: CREATED] }
        }
    }

    def edit(LikeTool likeToolInstance) {
        respond likeToolInstance
    }

    @Transactional
    def update(LikeTool likeToolInstance) {
        if (likeToolInstance == null) {
            notFound()
            return
        }

        if (likeToolInstance.hasErrors()) {
            respond likeToolInstance.errors, view:'edit'
            return
        }

        likeToolInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LikeTool.label', default: 'LikeTool'), likeToolInstance.id])
                redirect likeToolInstance
            }
            '*'{ respond likeToolInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LikeTool likeToolInstance) {

        if (likeToolInstance == null) {
            notFound()
            return
        }

        likeToolInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LikeTool.label', default: 'LikeTool'), likeToolInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'likeTool.label', default: 'LikeTool'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
