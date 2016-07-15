// Generated by CoffeeScript 1.10.0
(function() {
  var CartSchema, Mongoose, ObjectId, Schema;

  Mongoose = require('mongoose');

  Schema = require('mongoose').Schema;

  ObjectId = Mongoose.Schema.Types.ObjectId;

  CartSchema = new Schema({
    items: [
      {
        type: ObjectId,
        ref: 'Item'
      }
    ],
    total: {
      type: Number,
      index: false
    }
  }, {
    strict: false
  });

  module.exports = {
    model: Mongoose.model("Cart", CartSchema),
    schema: CartSchema
  };

}).call(this);

//# sourceMappingURL=cart.js.map
