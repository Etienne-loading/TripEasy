import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-step"
export default class extends Controller {
  connect() {
    console.log('oiezrfj');
  }
  static targets = ["button", "form"]

  revealCreateForm(event) {
    event.preventDefault()
    this.formTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("d-none")
  }
}
