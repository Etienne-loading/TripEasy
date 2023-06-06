import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static targets = ["container"];
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.containerTarget,
      style: "mapbox://styles/etienne26/cliizmii400dg01r07pxmegp3",
      center: [2.3522, 48.8566],
      minZoom: 4, // Échelle minimale
      maxZoom: 15, // Échelle maximale
    })
    this.#addMarkersToMap()
  }

  toggleMapVisibility() {
    this.containerTarget.classList.toggle("d-none");
    this.map.resize();

    const button = this.findMapButton();
    if (this.containerTarget.classList.contains("d-none")) {
      button.textContent = "Show map";
    } else {
      button.textContent = "Hide map";
    }
  }

  findMapButton() {
    return this.element.querySelector("[data-action='click->map#toggleMapVisibility']");
  }

  greet() {
    if (this.containerTarget.classList.contains("d-none")) {
      this.containerTarget.classList.remove("d-none");
    }
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }
}
