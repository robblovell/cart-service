Mongoose = require('mongoose')
Schema = require('mongoose').Schema

ItemSchema = new Schema({
    sku: String
    price: String
    quantity: Number
})
ItemModel = Mongoose.model("Item", ItemSchema)
module.exports = { model: ItemModel, schema: ItemSchema }
