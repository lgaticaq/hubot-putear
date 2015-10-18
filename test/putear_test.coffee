Helper = require("hubot-test-helper")
expect = require("chai").expect
puteadas = require("../src/puteadas")

helper = new Helper("./../src/putear.coffee")

describe "putear", ->
  room = null

  beforeEach ->
    room = helper.createRoom()

  afterEach ->
    room.destroy()

  context "obtener una puteada", ->

    beforeEach ->
      room.user.say("pepito", "hubot putea a @juanito")

    it "se espera que la puteada este en el listado de puteadas", ->
      expect(room.messages[0]).to.eql(["pepito", "hubot putea a @juanito"])
      r = /^oe @juanito (.+)$/g
      msg = r.exec(room.messages[1][1])
      expect(puteadas).to.include(msg[1])
