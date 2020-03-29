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

tippecanoe -pC -o tmp/small.mbtiles -z4 -Z0 ./tmp/small/*.geojson
tippecanoe -pC -o tmp/medium.mbtiles -z6 -Z5 ./tmp/medium/*.geojson
tippecanoe -pC -o tmp/large.mbtiles -z8 -Z7 ./tmp/large/10m_cultural/*.geojson

tile-join -f -o tmp/all.mbtiles ./tmp/large.mbtiles ./tmp/medium.mbtiles ./tmp/small.mbtiles
# tileserver-gl tmp/all.mbtiles
mb-util tmp/all.mbtiles tiles --image_format=pbf

find ./tiles -name "*.pbf" | cut -d"." -f2 | awk '{print "mv ."$1".pbf ."$1".mvt.gz"}' | sh
find ./tiles -name "*.mvt.gz" | xargs -I {} gunzip {}

# Layers

# tmp/small/ne_110m_admin_0_boundary_lines_land.geojson
# tmp/small/ne_110m_admin_0_countries.geojson
# tmp/small/ne_110m_admin_0_countries_lakes.geojson
# tmp/small/ne_110m_admin_0_map_units.geojson
# tmp/small/ne_110m_admin_0_pacific_groupings.geojson
# tmp/small/ne_110m_admin_0_scale_rank.geojson
# tmp/small/ne_110m_admin_0_sovereignty.geojson
# tmp/small/ne_110m_admin_0_tiny_countries.geojson
# tmp/small/ne_110m_admin_1_states_provinces.geojson
# tmp/small/ne_110m_admin_1_states_provinces_lakes.geojson
# tmp/small/ne_110m_admin_1_states_provinces_lines.geojson
# tmp/small/ne_110m_admin_1_states_provinces_scale_rank.geojson
# tmp/small/ne_110m_populated_places.geojson
# tmp/small/ne_110m_populated_places_simple.geojson

# tmp/medium/ne_50m_admin_0_boundary_lines_disputed_areas.geojson
# tmp/medium/ne_50m_admin_0_boundary_lines_land.geojson
# tmp/medium/ne_50m_admin_0_boundary_lines_maritime_indicator.geojson
# tmp/medium/ne_50m_admin_0_boundary_map_units.geojson
# tmp/medium/ne_50m_admin_0_breakaway_disputed_areas.geojson
# tmp/medium/ne_50m_admin_0_breakaway_disputed_areas_scale_rank.geojson
# tmp/medium/ne_50m_admin_0_countries.geojson
# tmp/medium/ne_50m_admin_0_countries_lakes.geojson
# tmp/medium/ne_50m_admin_0_map_subunits.geojson
# tmp/medium/ne_50m_admin_0_map_units.geojson
# tmp/medium/ne_50m_admin_0_pacific_groupings.geojson
# tmp/medium/ne_50m_admin_0_scale_rank.geojson
# tmp/medium/ne_50m_admin_0_sovereignty.geojson
# tmp/medium/ne_50m_admin_0_tiny_countries.geojson
# tmp/medium/ne_50m_admin_0_tiny_countries_scale_rank.geojson
# tmp/medium/ne_50m_admin_1_states_provinces.geojson
# tmp/medium/ne_50m_admin_1_states_provinces_lakes.geojson
# tmp/medium/ne_50m_admin_1_states_provinces_lines.geojson
# tmp/medium/ne_50m_admin_1_states_provinces_scale_rank.geojson
# tmp/medium/ne_50m_airports.geojson
# tmp/medium/ne_50m_populated_places.geojson
# tmp/medium/ne_50m_populated_places_simple.geojson
# tmp/medium/ne_50m_ports.geojson
# tmp/medium/ne_50m_urban_areas.geojson

# tmp/large/10m_cultural/ne_10m_admin_0_antarctic_claim_limit_lines.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_antarctic_claims.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_boundary_lines_disputed_areas.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_boundary_lines_land.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_boundary_lines_map_units.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_countries.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_countries_lakes.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_disputed_areas.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_disputed_areas_scale_rank_minor_islands.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_label_points.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_map_subunits.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_map_units.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_pacific_groupings.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_scale_rank.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_scale_rank_minor_islands.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_seams.geojson
# tmp/large/10m_cultural/ne_10m_admin_0_sovereignty.geojson
# tmp/large/10m_cultural/ne_10m_admin_1_label_points.geojson
# tmp/large/10m_cultural/ne_10m_admin_1_label_points_details.geojson
# tmp/large/10m_cultural/ne_10m_admin_1_seams.geojson
# tmp/large/10m_cultural/ne_10m_admin_1_states_provinces.geojson
# tmp/large/10m_cultural/ne_10m_admin_1_states_provinces_lakes.geojson
# tmp/large/10m_cultural/ne_10m_admin_1_states_provinces_lines.geojson
# tmp/large/10m_cultural/ne_10m_admin_1_states_provinces_scale_rank.geojson
# tmp/large/10m_cultural/ne_10m_admin_1_states_provinces_scale_rank_minor_islands.geojson
# tmp/large/10m_cultural/ne_10m_airports.geojson
# tmp/large/10m_cultural/ne_10m_parks_and_protected_lands_area.geojson
# tmp/large/10m_cultural/ne_10m_parks_and_protected_lands_line.geojson
# tmp/large/10m_cultural/ne_10m_parks_and_protected_lands_point.geojson
# tmp/large/10m_cultural/ne_10m_parks_and_protected_lands_scale_rank.geojson
# tmp/large/10m_cultural/ne_10m_populated_places.geojson
# tmp/large/10m_cultural/ne_10m_populated_places_simple.geojson
# tmp/large/10m_cultural/ne_10m_ports.geojson
# tmp/large/10m_cultural/ne_10m_railroads.geojson
# tmp/large/10m_cultural/ne_10m_railroads_north_america.geojson
# tmp/large/10m_cultural/ne_10m_roads.geojson
# tmp/large/10m_cultural/ne_10m_roads_north_america.geojson
# tmp/large/10m_cultural/ne_10m_time_zones.geojson
# tmp/large/10m_cultural/ne_10m_urban_areas.geojson
# tmp/large/10m_cultural/ne_10m_urban_areas_landscan.geojson
