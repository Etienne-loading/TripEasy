import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="layout"
export default class extends Controller {

  static targets = ["layout1", "layout2", "layout3", "layout4", "form", "form2", "form3", "form4", "col", "col2", "col3", "col4"]

  connect() {
  }

  showForm1(event){
    event.preventDefault()
    this.formTarget.classList.remove("d-none")
    this.layout1Target.classList.add("d-none")
    this.layout2Target.classList.add("d-none")
    this.layout3Target.classList.add("d-none")
    this.layout4Target.classList.add("d-none")
    this.colTarget.classList.remove("col-6")
    this.col2Target.remove()
    this.col3Target.remove()
    this.col4Target.remove()
  }

  showForm2(event){
    event.preventDefault()
    this.form2Target.classList.remove("d-none")
    this.layout1Target.classList.add("d-none")
    this.layout2Target.classList.add("d-none")
    this.layout3Target.classList.add("d-none")
    this.layout4Target.classList.add("d-none")
    this.col2Target.classList.remove("col-6")
    this.colTarget.remove()
    this.col3Target.remove()
    this.col4Target.remove()
  }

  showForm3(event){
    event.preventDefault()
    this.form3Target.classList.remove("d-none")
    this.layout1Target.classList.add("d-none")
    this.layout2Target.classList.add("d-none")
    this.layout3Target.classList.add("d-none")
    this.layout4Target.classList.add("d-none")
    this.col3Target.classList.remove("col-6")
    this.colTarget.remove()
    this.col2Target.remove()
    this.col4Target.remove()
  }

  showForm4(event){
    event.preventDefault()
    this.form4Target.classList.remove("d-none")
    this.layout1Target.classList.add("d-none")
    this.layout2Target.classList.add("d-none")
    this.layout3Target.classList.add("d-none")
    this.layout4Target.classList.add("d-none")
    this.col4Target.classList.remove("col-6")
    this.colTarget.remove()
    this.col2Target.remove()
    this.col3Target.remove()
  }
}
