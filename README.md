# Tiny Tile Server

This is a vector tile server for CI, E2E testing or so.

## How to use

Update `sources` and `glyphs` like following in `style.json` of your project.

```
    "sources": {
      "openmaptiles": {
        "type": "vector",
        "url": "https://tilecloud.github.io/tiny-tileserver/tiles.json"
      }
    },
    "glyphs": "https://tilecloud.github.io/tiny-tileserver/glyphs/{fontstack}/{range}.pbf",
```