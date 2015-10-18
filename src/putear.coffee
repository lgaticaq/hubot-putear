# Description
#   Aleatoriamente putea alguien para ti
#
# Commands:
#   hubot putea a <@user | Internet Explorer | Justin Bieber> - oe @user <puteada random>
#   hubot putea al <@user | Internet Explorer | Justin Bieber> - oe @user <puteada random>
#
# Author:
#   lgaticaq

puteadas = require("./puteadas")

module.exports = (robot) ->
  robot.respond /putea (a|al) (.*)/i, (msg) ->
    puteada = msg.random puteadas
    msg.send "oe #{msg.match[2]} #{puteada}"
