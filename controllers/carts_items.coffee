Resource = require('resourcejs')

module.exports = (app, model) ->
    resource = Resource(app, '/carts/:CartsId', 'Items', model).rest({
        before: (req, res, next) ->
            req.body.project = req.params.id
            req.modelQuery = this.model.where('cart', req.params.id)
            next()
    }).patch({
        before: (req, res, next) ->
            traverse = require('./helpers/traverse')

            if not(req.body? and req.body[0]? and req.body[0].op?)
                result = traverse(req.body[0],'', [])
                req.body[0] = result[0]
            next()
    })
    resource.modelName = resource.modelName.substring(0,resource.modelName.length-1)
    return resource
