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
    console.log(directionUrl);

    fetch(directionUrl, { method: 'GET' })
      .then(response => response.json())
      .then((json) => {
        // do something with the json
        console.log(json.routes);
        if (!json.routes) return;

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
            'line-color': '#FCB84B',
            'line-width': 5,
            'line-opacity': 0.75,
            'line-dasharray': [1, 2]
          }
        });
      });
  }

  fitMapToMarkers() {
    console.log(this.markersValue)
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker({ color: '#4A6947' }) // Remplacez 'red' par la couleur souhaitée
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

}
