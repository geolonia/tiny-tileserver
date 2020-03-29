const fs = require("fs");
const metadata = require("../tiles/metadata.json");

const base = {
  format: "pbf",
  name: "OpenMapTiles",
  attribution:
    '<a href="https://www.openstreetmap.org/copyright/" target="_blank">&copy; OpenStreetMap Contributors</a>',
  description:
    "A tileset showcasing all layers in OpenMapTiles. http://openmaptiles.org",
  maxzoom: 5,
  id: "openmaptiles",
  center: [139.691706, 35.689488, 10],
  tilejson: "2.0.0",
  tiles: ["http://127.0.0.1:8080/tiles/{z}/{x}/{y}.mvt"]
};

const { vector_layers } = JSON.parse(metadata.json);

delete metadata.generator_options;
delete metadata.generator;
delete metadata.json;

fs.writeFileSync(
  "./tiles.json",
  JSON.stringify({ ...metadata, ...base, vector_layers }, null, 2)
);
