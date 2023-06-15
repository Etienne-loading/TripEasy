import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["bar"]

  connect() {
    this.barTarget.style.width = `0`
  }

  scroll() {
    const height = document.documentElement.scrollHeight - document.documentElement.clientHeight
    const width = Math.round((window.scrollY / height) * 100)
    this.barTarget.style.width = `${width}%`
  }
}
