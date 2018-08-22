import tileCloudControl from '@tilecloud/mbgl-tilecloud-control'
import ForkMeConntrol from '@tilecloud/mbgl-fork-me-control'
import jaPrefs from '@tilecloud/mbgl-japanese-prefs'

const map = new mapboxgl.Map({
    container: 'map', 
    style: './style.json',
    attributionControl: true, 
    hash: true,
    localIdeographFontFamily: ['sans-serif']
});

map.addControl(new mapboxgl.NavigationControl());
map.addControl(new mapboxgl.GeolocateControl());
map.addControl(new tileCloudControl());
map.addControl(new ForkMeConntrol({
    url: "https://github.com/tilecloud/tiny-tileserver"
}));

new jaPrefs({label: "{name}"}).addTo(map)