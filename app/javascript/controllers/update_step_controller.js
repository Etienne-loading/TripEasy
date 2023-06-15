import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-step-anchor"
export default class extends Controller {

  static targets = ["form", "content"]

  connect() {
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        // this.contentTarget.outerHTML = data
      })
  }
}
