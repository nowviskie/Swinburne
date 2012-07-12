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
    var products = []
    var product = null
    var currentTag = null

    parser.onclosetag = function (tagName) {
      if (tagName === "lg") {
        products.push(product)
        currentTag = product = null
        return
      }
      if (currentTag && currentTag.parent) {
        var p = currentTag.parent
        delete currentTag.parent
        currentTag = p
      }
    }

    parser.onopentag = function (tag) {
      if (tag.name !== "lg" && !product) return
      if (tag.name === "lg") {
        product = tag
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
      var out = util.inspect(products, false, 3, true)
      res.writeHead(200, {"content-type":"application/json"})
      //res.end("{\"ok\":true}")
      res.end(JSON.stringify(products))

      //console.log(products)
    }

    parser.write(xmlstr).end()
  }).listen(1337)
})
