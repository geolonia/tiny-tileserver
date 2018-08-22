const fs = require('fs')
const jaPrefs = require('@tilecloud/mbgl-japanese-prefs')

const prefs = new jaPrefs()
const geojson = prefs.getGeoJSON()
fs.writeFileSync("prefs.json" , JSON.stringify(geojson))

const style = fs.readFile("./style.json", {encoding: 'utf-8'}, (err, data) => {
  const json = JSON.parse(data)
  const layers = []
  for (let i = 0; i < json.layers.length; i++) {
    if ('japanese-prefectures' === json.layers[i].id) {
        continue;
    }
    layers.push(json.layers[i])
  }

  const newLayer = []
  for (let i = 0; i < layers.length; i++) {
    if ('place_country_other' === layers[i].id) {
        newLayer.push(prefs.getLayer())
    }
    newLayer.push(layers[i])
  }

  json.layers = newLayer

  fs.writeFileSync("style.json.bak" , data)
  fs.writeFileSync("style.json" , JSON.stringify(json))
})