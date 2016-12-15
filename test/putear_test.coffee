Helper = require("hubot-test-helper")
expect = require("chai").expect
puteadas = require("../src/puteadas")

helper = new Helper("./../src/index.coffee")

describe "putear", ->
  room = null

  beforeEach ->
    room = helper.createRoom()

  afterEach ->
    room.destroy()

  context "obtener una puteada con redis", ->

    beforeEach ->
      room.robot.brain.data._private["puteadas"] = JSON.stringify([
        "http://i.giphy.com/8mLnkS2xcqtdm.gif"])
      room.user.say("pepito", "hubot putea a @juanito")

    it "se espera que la puteada este en el listado de puteadas", ->
      expect(room.messages[0]).to.eql(["pepito", "hubot putea a @juanito"])
      r = /^oe @juanito (.+)$/g
      msg = r.exec(room.messages[1][1])
      expect(puteadas).to.include(msg[1])

  context "obtener una puteada sin redis", ->

    beforeEach ->
      room.user.say("pepito", "hubot putea a @juanito")

    it "se espera que la puteada este en el listado de puteadas", ->
      expect(room.messages[0]).to.eql(["pepito", "hubot putea a @juanito"])
      r = /^oe @juanito (.+)$/g
      msg = r.exec(room.messages[1][1])
      expect(puteadas).to.include(msg[1])

  context "agregar una puteada con redis", ->
    beforeEach ->
      room.user.say(
        "pepito", "hubot putea add http://i.giphy.com/8mLnkS2xcqtdm.gif")

    it "se espera que la puteada este en el listado de puteadas", ->
      expect(room.messages).to.eql([
        ["pepito", "hubot putea add http://i.giphy.com/8mLnkS2xcqtdm.gif"],
        ["hubot", "Nueva puteada guardada :ok_hand:"]
      ])
      brain = JSON.parse(room.robot.brain.data._private["puteadas"])
      expect(brain).to.eql(["http://i.giphy.com/8mLnkS2xcqtdm.gif"])

  context "agregar una puteada sin redis", ->
    beforeEach ->
      room.robot.brain.data._private["puteadas"] = JSON.stringify([
        "http://i.giphy.com/8mLnkS2xcqtdm.gif"])
      room.user.say(
        "pepito", "hubot putea add http://i.giphy.com/Ebu8aRL2qxMzK.gif")

    it "se espera que la puteada este en el listado de puteadas", ->
      expect(room.messages).to.eql([
        ["pepito", "hubot putea add http://i.giphy.com/Ebu8aRL2qxMzK.gif"],
        ["hubot", "Nueva puteada guardada :ok_hand:"]
      ])
      brain = JSON.parse(room.robot.brain.data._private["puteadas"])
      expect(brain).to.eql([
        "http://i.giphy.com/8mLnkS2xcqtdm.gif",
        "http://i.giphy.com/Ebu8aRL2qxMzK.gif"
      ])
