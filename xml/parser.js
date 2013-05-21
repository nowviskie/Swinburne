var sax = require("sax")
var fs = require("fs")
var path = require("path")
var xmlFile = path.resolve(__dirname, "base.xml")
var util = require("util")
var http = require("http")

console.log(xmlFile)

fs.readFile(xmlFile, function (er, d) {
  http.createServer(function (req, res) {
    if (er) throw er
    var xmlstr = d.toString("utf8")

    var parser = sax.parser(true)
    var linegroups = []
    var line = null
    var currentTag = null

    parser.onclosetag = function (tagName) {
      if (tagName === "lg") {
        linegroups.push(line)
        currentTag = line = null
        return
      }
      if (currentTag && currentTag.parent) {
        var p = currentTag.parent
        delete currentTag.parent
        currentTag = p
      }
    }

    parser.onopentag = function (tag) {
      if (tag.name !== "lg" && !line) return
      if (tag.name === "lg") {
        line = tag
      }
      tag.parent = currentTag
      tag.children = []
      tag.parent && tag.parent.children.push(tag)
      currentTag = tag
    }

    parser.ontext = function (text) {
      if (currentTag) currentTag.children.push(text)
    }

    parser.onend = function () {
      var out = util.inspect(linegroups, false, 3, true)
      res.writeHead(200, {"content-type":"application/json"})
      //res.end("{\"ok\":true}")
      res.end(JSON.stringify(linegroups))

      //console.log(linegroups)
    }

    parser.write(xmlstr).end()
  }).listen(1337)
})
