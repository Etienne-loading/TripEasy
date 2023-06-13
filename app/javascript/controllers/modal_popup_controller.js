import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-popup"
export default class extends Controller {
  connect() {
    var modal = new bootstrap.Modal(this.element);
    modal.show();
  }
}
