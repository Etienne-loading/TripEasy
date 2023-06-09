import {
  Controller
} from "@hotwired/stimulus"

// Connects to data-controller="create-step"
export default class extends Controller {

  static targets = ["button", "form"]

  connect() {}

  revealCreateForm(event) {
    event.preventDefault()
    // this.formTarget.classList.remove("d-none")
    // this.buttonTarget.classList.add("d-none")
  }
}
