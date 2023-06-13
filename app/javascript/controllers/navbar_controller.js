import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
  }

  updateNavbar() {
    if (window.scrollY >= 100) {
      this.element.classList.add("navbar-white");
    } else {
      this.element.classList.remove("navbar-white");
    }
  }
}

