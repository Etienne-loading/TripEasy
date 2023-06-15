// app/javascript/controllers/address_autocomplete_controller.js
import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    console.log("hello");
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    this.#setPlaceholder()
    this.#killMinus()
  }

  #setPlaceholder() {
    const placeholders = document.querySelectorAll(".mapboxgl-ctrl-geocoder--input")
    placeholders.forEach((placeholder) => {
      placeholder.placeholder = "Address"
    })

  }

  #killMinus() {
    const minus = document.querySelectorAll(".mapboxgl-ctrl-geocoder--pin-right")
    minus.forEach((minu) => {
      minu.classList.add("d-none")
    })
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}
