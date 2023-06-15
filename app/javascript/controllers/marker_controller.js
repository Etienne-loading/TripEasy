import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="marker"
export default class extends Controller {
  connect() {
  }

  scrollToStep(event) {
    const markerId = event.currentTarget.id; // 1. Je récupère la valeur de l'id du marker sur lequel je viens de cliquer
    console.log(markerId);

    const step = document.getElementById(markerId); // 2. Je cherche la step du blog correspondant à cet id

    if (step) {
      window.scrollTo(0,step.offsetTop);
    }
  }
}
