# Description
#   Aleatoriamente putea alguien para ti
#
# Commands:
#   hubot putea <@user | Internet Explorer | Justin Bieber> - oe @user, <puteada random>
#
# Author:
#   lgaticaq

puteadas = require("./puteadas")

module.exports = (robot) ->
  robot.respond /putea (.*)/i, (msg) ->
    puteada = msg.random puteadas
    msg.send "oe #{msg.match[1]} #{puteada}"
