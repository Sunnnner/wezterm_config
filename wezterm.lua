local Config = require('config')

return Config:init()
    :append(require('config.ui'))
    :append(require('config.keys'))
    :append(require('config.status')).options
