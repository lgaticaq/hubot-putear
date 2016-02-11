# Description
#   Aleatoriamente putea alguien para ti
#
# Commands:
#   hubot putea (a|al) <alguien> - Putea al usaurio señalado
#
# Author:
#   lgaticaq

puteadas = require "./puteadas"

module.exports = (robot) ->
  robot.respond /putea (a|al) (.*)/i, (msg) ->
    puteada = msg.random puteadas
    msg.send "oe #{msg.match[2]} #{puteada}"
