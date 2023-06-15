import {
  Controller
} from "@hotwired/stimulus"

// Connects to data-controller="edit-step-blog"
export default class extends Controller {
  static targets = ["content", "button", "form", "tipform", "tipbutton", "buttons"]
  connect() {}

  revealEditForm(event) {
    event.preventDefault()
    this.formTarget.classList.toggle("d-none")
    this.contentTarget.classList.toggle("d-none")
    this.buttonsTarget.classList.toggle("d-none")
  }

  revealTipForm(event) {
    event.preventDefault()
    this.tipformTarget.classList.toggle("d-none")
  }
}
