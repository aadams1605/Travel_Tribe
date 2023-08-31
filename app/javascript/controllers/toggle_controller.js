import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "text"]
  connect() {
    console.log("helloooooo")
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");

    if (this.togglableElementTarget.classList.contains("d-none")) {
      this.textTarget.textContent = "Show on map";
    } else {
      this.textTarget.textContent = "Close map";
    }
  }
}