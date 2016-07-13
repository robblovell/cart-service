express = require('express')
router = express.Router()
config = require('../config/config')
# GET home page. */
router.get('/', (req, res, next) ->
  res.render('index', { title: config.title, description: config.description, host: config.host, scheme: config.scheme })
)

module.exports = router
