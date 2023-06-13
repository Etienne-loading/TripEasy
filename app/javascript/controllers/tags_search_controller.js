import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input", "suggestions"];

  connect() {
    this.inputTarget.addEventListener("input", this.searchTags.bind(this));
  }

  searchTags() {
    const inputValue = this.inputTarget.value.toLowerCase();
    const suggestions = Array.from(this.suggestionsTarget.children);

    suggestions.forEach((suggestion) => {
      const tag = suggestion.textContent.toLowerCase();
      if (tag.includes(inputValue)) {
        suggestion.style.display = "block";
      } else {
        suggestion.style.display = "none";
      }
    });
  }
}
