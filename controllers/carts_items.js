// Generated by CoffeeScript 1.10.0
(function() {
  var Resource;

  Resource = require('resourcejs');

  module.exports = function(app, model) {
    var resource;
    resource = Resource(app, '/carts/:CartsId', 'Items', model).rest({
      before: function(req, res, next) {
        req.body.project = req.params.id;
        req.modelQuery = this.model.where('cart', req.params.id);
        return next();
      }
    }).patch({
      before: function(req, res, next) {
        var result, traverse;
        traverse = require('./helpers/traverse');
        if (!((req.body != null) && (req.body[0] != null) && (req.body[0].op != null))) {
          result = traverse(req.body[0], '', []);
          req.body[0] = result[0];
        }
        return next();
      }
    });
    resource.modelName = resource.modelName.substring(0, resource.modelName.length - 1);
    return resource;
  };

}).call(this);

//# sourceMappingURL=carts_items.js.map
