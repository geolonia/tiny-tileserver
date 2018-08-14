# Tiny Tile Server

This is a vector tile server for CI, E2E testing or so.

## How to use

Update `sources` and `glyphs` like following in `style.json` of your project.

```json
    "sources": {
      "openmaptiles": {
        "type": "vector",
        "url": "https://tilecloud.github.io/tiny-tileserver/tiles.json"
      }
    },
    "glyphs": "https://tilecloud.github.io/tiny-tileserver/glyphs/{fontstack}/{range}.pbf",
```

Or use `style.json` in this repository on your map like following.

```html
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
<title>Vector Tile Example</title>
<link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.47.0/mapbox-gl.css' rel='stylesheet' />
<script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.47.0/mapbox-gl.js'></script>
<style>
body { 
  margin: 0; 
  padding: 0; 
}
#map
{
    position: absolute;
    top: 0;
    bottom: 0;
    width: 100%;
}
</style>
</head>
<body>

<div id="map"></div>

<script>
    var map = new mapboxgl.Map({
        container: 'map', 
        style: 'https://tilecloud.github.io/tiny-tileserver/style.json',
        attributionControl: true, 
        hash: true
    });
    map.addControl(new mapboxgl.NavigationControl());
    map.addControl(new mapboxgl.GeolocateControl());
</script>
</body>
</html>
```

## Example

https://tilecloud.github.io/tiny-tileserver/