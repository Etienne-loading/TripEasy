import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="back-to-top"
export default class extends Controller {
  static targets = ["button"]


  connect() {
  }

  scroll(event) {
    event.preventDefault();
    this.buttonTarget.classList.remove("d-none")
    if (document.documentElement.scrollTop == 0) {
      this.buttonTarget.classList.add("d-none")
    }
  }
  // When the user clicks on the button, scroll to the top of the document

   backToTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
}
