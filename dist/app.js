parcelRequire=function(e,r,n,t){var i="function"==typeof parcelRequire&&parcelRequire,o="function"==typeof require&&require;function u(n,t){if(!r[n]){if(!e[n]){var f="function"==typeof parcelRequire&&parcelRequire;if(!t&&f)return f(n,!0);if(i)return i(n,!0);if(o&&"string"==typeof n)return o(n);var c=new Error("Cannot find module '"+n+"'");throw c.code="MODULE_NOT_FOUND",c}p.resolve=function(r){return e[n][1][r]||r};var l=r[n]=new u.Module(n);e[n][0].call(l.exports,p,l,l.exports,this)}return r[n].exports;function p(e){return u(p.resolve(e))}}u.isParcelRequire=!0,u.Module=function(e){this.id=e,this.bundle=u,this.exports={}},u.modules=e,u.cache=r,u.parent=i,u.register=function(r,n){e[r]=[function(e,r){r.exports=n},{}]};for(var f=0;f<n.length;f++)u(n[f]);if(n.length){var c=u(n[n.length-1]);"object"==typeof exports&&"undefined"!=typeof module?module.exports=c:"function"==typeof define&&define.amd?define(function(){return c}):t&&(this[t]=c)}return u}({"mg8D":[function(require,module,exports) {
"use strict";const t=function(){};t.prototype.onAdd=(()=>{this.container=document.createElement("div"),this.container.className="mapboxgl-ctrl";const t={width:"96px",height:"auto",cursor:"pointer",marginLeft:"10px",marginBottom:"10px"};for(const o in t)this.container.style[o]=t[o];const o=document.createElement("img");return o.src="https://tilecloud.github.io/logo/tilecloud-256x60.png",o.style.maxWidth="100%",o.style.display="block",this.container.appendChild(o),o.addEventListener("click",()=>{window.location.href="https://tilecloud.io/"}),this.container}),t.prototype.onRemove=(()=>{this.container.parentNode.removeChild(this.container)}),t.prototype.getDefaultPosition=(()=>"bottom-left"),"undefined"!=typeof module&&void 0!==module.exports?module.exports=t:window.TileCloudControl=t;
},{}],"7bbP":[function(require,module,exports) {
"use strict";const t={},e=function(e){t.url=e.url};e.prototype.onAdd=(()=>{this.container=document.createElement("div"),this.container.className="mapboxgl-ctrl";return this.container.innerHTML='<a><img style="position: absolute; top: -149px; left: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_left_darkblue_121621.png" alt="Fork me on GitHub"></a>',this.container.querySelector("a").href=t.url,document.querySelector(".mapboxgl-ctrl-top-left").style.top="149px",this.container}),e.prototype.onRemove=(()=>{this.container.parentNode.removeChild(this.container)}),e.prototype.getDefaultPosition=(()=>"top-left"),module.exports=e;
},{}],"A2T1":[function(require,module,exports) {
"use strict";var o=require("@tilecloud/mbgl-tilecloud-control"),t=r(o),l=require("@tilecloud/mbgl-fork-me-control"),e=r(l);function r(o){return o&&o.__esModule?o:{default:o}}var n=new mapboxgl.Map({container:"map",style:"./style.json",attributionControl:!0,hash:!0});n.addControl(new mapboxgl.NavigationControl),n.addControl(new mapboxgl.GeolocateControl),n.addControl(new t.default),n.addControl(new e.default({url:"https://github.com/tilecloud/tiny-tileserver"}));
},{"@tilecloud/mbgl-tilecloud-control":"mg8D","@tilecloud/mbgl-fork-me-control":"7bbP"}]},{},["A2T1"], null)
//# sourceMappingURL=/app.map