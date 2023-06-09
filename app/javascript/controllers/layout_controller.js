import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="layout"
export default class extends Controller {

  static targets = ["layout1", "layout2", "layout3", "layout4", "form", "form2", "col", "col2"]

  connect() {
  }

  showForm1(event){
    event.preventDefault()
    this.formTarget.classList.remove("d-none")
    this.layout1Target.classList.add("d-none")
    this.layout2Target.classList.add("d-none")
    this.layout3Target.classList.add("d-none")
    this.layout4Target.classList.add("d-none")
    this.col2Target.remove()
  }

  showForm2(event){
    event.preventDefault()
    this.form2Target.classList.remove("d-none")
    this.layout1Target.classList.add("d-none")
    this.layout2Target.classList.add("d-none")
    this.layout3Target.classList.add("d-none")
    this.layout4Target.classList.add("d-none")
    this.colTarget.remove()
  }
}
