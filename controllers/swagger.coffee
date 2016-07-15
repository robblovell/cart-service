_ = require('lodash')

module.exports = (app, resources, spec='/spec', config) ->
    paths = {}
    definitions = {}
    _.each(resources, (resource) ->

        swagger = resource.swagger()
        if (swagger.paths["/carts"]?)
            swagger.paths["/carts"].get.parameters.push({
                    name: 'query',
                    in: 'query',
                    description: 'Query by example. Pass a JSON object to find, for example: {"Id": "someid"}.',
                    type: 'string',
                    required: false,
                    default: ''
                }
            )
        # hack for the cart id being a member id...
        newPaths = []
        for key,value of swagger.paths
            newKey = key.replace('CartsId','Id')
            newPaths[newKey] = value

        paths = _.assign(paths, newPaths)
        definitions = _.assign(definitions, swagger.definitions)
    )
#    for path,verbs of paths
#        if verbs?
#            for key, verb of verbs
#                if verb.parameters
#                    for parameter,i in verb.parameters
#                        if parameter.name? and parameter.name is 'count'
#                            verb.parameters.splice(i, 1)
#                            break
    # Define the specification.
    specification = {
        swagger: '2.0',
        info: {
            description: config.description,
            version: config.version,
            title: config.title,
            contact: {
                name: config.author
            },
#            license: {
#                name: 'MIT',
#                url: 'http://opensource.org/licenses/MIT'
#            }
        },
        host: config.host,
        basePath: config.basepath,
        schemes: [config.scheme],
        definitions: definitions,
        paths: paths
#        authorizations: {
#            oauth2: [
#                {scope: "full"
#                }
#            ]
#        }
    }

    # Show the specification at the URL.
    app.get(spec, (req, res, next) ->
        res.json(specification)
    )