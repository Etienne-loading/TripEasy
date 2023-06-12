import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-intro-blog"
export default class extends Controller {
  static targets = ["content", "button", "form"]
  connect() {}

  revealEditForm(event) {
    event.preventDefault()
    this.formTarget.classList.toggle("d-none")
    this.contentTarget.classList.add("d-none")
    this.buttonTarget.classList.add("d-none")
  }
}
