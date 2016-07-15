express = require('express')
router = express.Router()
config = require('../config/configuration')
# GET home page. */
router.get('/', (req, res, next) ->
  res.render('index', { title: config.title, description: config.description, host: config.scheme+"://"+config.host})

)

module.exports = router
