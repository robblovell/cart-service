Mongoose = require('mongoose')
Schema = require('mongoose').Schema
#ObjectId = Mongoose.Schema.Types.ObjectId

ItemSchema = new Schema(
    {
        price: { type: Number, index: false }
        quantity: { type: Number, index: false }
        sku: { type: String, index: true }
    },
    { strict: false }
)

CartSchema = new Schema(
    {
        items: [ItemSchema],
        total: { type: Number, index: false }
    },
    { strict: false }
)
module.exports = { model: Mongoose.model("Cart", CartSchema), schema: CartSchema }