mkdir tmp
mkdir tmp/small
mkdir tmp/medium
mkdir tmp/large

curl https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/10m_cultural.zip > tmp/lmarge/large.zip
curl https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/50m_cultural.zip > tmp/medium/medium.zip
curl https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/110m_cultural.zip > tmp/small/small.zip

unzip tmp/small/small.zip
unzip tmp/medium/medium.zip
unzip tmp/large/large.zip

find tmp/small -name "*.shp" | sed -e s/\.shp// | awk '{print "ogr2ogr -f geojson " $1 ".geojson " $1 ".shp\ ; "}' | bash
find tmp/medium -name "*.shp" | sed -e s/\.shp// | awk '{print "ogr2ogr -f geojson " $1 ".geojson " $1 ".shp\ ; "}' | bash
find tmp/large -name "*.shp" | sed -e s/\.shp// | awk '{print "ogr2ogr -f geojson " $1 ".geojson " $1 ".shp\ ; "}' | bash

tippecanoe -o tmp/small.mbtiles -z4 -Z0 ./tmp/small/*.geojson
tippecanoe -o tmp/medium.mbtiles -z6 -Z5 ./tmp/medium/*.geojson
tippecanoe -o tmp/large.mbtiles -z8 -Z7 ./tmp/large/10m_cultural/*.geojson

tile-join -f -o tmp/all.mbtiles ./tmp/large.mbtiles ./tmp/medium.mbtiles ./tmp/small.mbtiles
# tileserver-gl tmp/all.mbtiles
mb-util tmp/all.mbtiles tiles
rm -rf tmp
