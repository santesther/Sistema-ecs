const { environment } = require('@rails/webpacker')
const { resolve } = require('path')

environment.config.set('entry', {
  application: resolve(__dirname, '../../app/javascript/controllers/application.js')
})

module.exports = environment
