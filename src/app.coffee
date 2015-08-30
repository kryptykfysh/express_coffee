express     = require 'express'
app         = express()
routes      = require './routes'

app.get '/', routes.index
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

server = app.listen 3000, ->
  host = server.address().address
  port = server.address().port

  console.log 'Example app listening at http://%s:%s', host, port
