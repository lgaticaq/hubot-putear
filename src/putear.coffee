# Description
#   Aleatoriamente putea alguien para ti
#
# Commands:
#   hubot putea (a|al) <alguien> - Putea al usaurio señalado
#   hubot putea add <puteada> - Agregar nuevas puteadas
#
# Author:
#   lgaticaq

puteadas = require "./puteadas"

module.exports = (robot) ->
  robot.respond /putea (a|al) (.*)/i, (res) ->
    _puteadas = robot.brain.get("puteadas")
    _puteadas = "[]" if _puteadas is null
    _puteadas = JSON.parse(_puteadas)
    _puteadas = _puteadas.concat(puteadas)
    puteada = res.random(_puteadas)
    res.send("oe #{res.match[2]} #{puteada}")

  robot.respond /putea add ([\w\W]+)/, (res) ->
    uri = res.match[1]
    _puteadas = robot.brain.get("puteadas")
    _puteadas = "[]" if _puteadas is null
    _puteadas = JSON.parse(_puteadas)
    _puteadas.push(uri)
    robot.brain.set("puteadas", JSON.stringify(_puteadas))
    res.send("Nueva puteada guardada :ok_hand:")
