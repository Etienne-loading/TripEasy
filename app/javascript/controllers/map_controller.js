import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static targets = ["container"];
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.containerTarget,
      style: "mapbox://styles/etienne26/cliizmii400dg01r07pxmegp3",
      center: [2.3522, 48.8566],
      minZoom: 2.5,
      maxZoom: 15,
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }

  findMapButton() {
    return this.element.querySelector("[data-action='click->map#toggleMapVisibility']");
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map);
    });
  }
}
