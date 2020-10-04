import GeoloniaControl from '@geolonia/mbgl-geolonia-control'
import ForkMeControl from '@geolonia/mbgl-fork-me-control'

const map = new mapboxgl.Map({
    container: 'map',
    style: './style.json',
    attributionControl: true,
    hash: true,
    localIdeographFontFamily: ['sans-serif']
});

map.addControl(new mapboxgl.NavigationControl());
map.addControl(new mapboxgl.GeolocateControl());
map.addControl(new GeoloniaControl());
map.addControl(new ForkMeControl({
    url: "https://github.com/geolonia/tiny-tileserver"
}));
