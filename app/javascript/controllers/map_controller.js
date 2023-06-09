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
      style: "mapbox://styles/etienne26/clivu424k003g01pb8174g4uj",
      center: [2.3522, 48.8566],
      minZoom: 2.5,
      maxZoom: 15,
    });

    this.addMarkersToMap();
    this.fitMapToMarkers();
    this.getRoute();
  }

  getRoute() {
    let stepCoordinates = []

    this.markersValue.forEach(async (step) => {
      stepCoordinates.push(`${step.lng},${step.lat}`)
    });

    stepCoordinates = stepCoordinates.join(";")

    const directionUrl = `https://api.mapbox.com/directions/v5/mapbox/driving/${stepCoordinates}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`
    fetch(directionUrl, { method: 'GET' })
      .then(response => response.json())
      .then((json) => {
        // do something with the json        if (!json.routes) return;

        const data = json.routes[0];
        const route = data.geometry.coordinates;
        const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: route
          }
        };

        this.map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: geojson
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round',
          },
          paint: {
            'line-color': '#FF9D00',
            'line-width': 5,
            'line-opacity': 0.85,
            'line-dasharray': [1, 2]
          }
        });
      });
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      this.marker = new mapboxgl.Marker({ color: '#4A6947' }) // Remplacez 'red' par la couleur souhaitée
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)

      const markerElement = this.marker._element;
      markerElement.id = marker.id;
      markerElement.dataset.action = "click->marker#scrollToStep";
      return this.marker
    });

  }
}
