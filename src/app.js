import tileCloudControl from '@tilecloud/mbgl-tilecloud-control'
import ForkMeConntrol from '@tilecloud/mbgl-fork-me-control'

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