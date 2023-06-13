import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme-color"
export default class extends Controller {
  static targets = ["title_step", "button-red", "button-blue", "button-yellow"]

  connect() {
  }

  switch_title_red(event) {
    event.preventDefault();
    this.title_stepTargets.forEach((elem) => { elem.style.color = "#B70404" } );
  }

  switch_title_blue(event) {
    event.preventDefault();
    this.title_stepTargets.forEach((elem) => { elem.style.color = "#0077b6" } );
  }

  switch_title_yellow(event) {
    event.preventDefault();
    this.title_stepTargets.forEach((elem) => { elem.style.color = "#ffc300" } );
  }
}
