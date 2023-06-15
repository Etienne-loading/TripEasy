import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";
// Connects to data-controller="autocomplete"
export default class extends Controller {
  connect() {
    console.log("hello")
    new TomSelect(this.element,{
      plugins: {
        remove_button:{
          title:'Remove this item',
        }
      },
      persist: false,
      createOnBlur: true,
      create: true
    })
  }
}
