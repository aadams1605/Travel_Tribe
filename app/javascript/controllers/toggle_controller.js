import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "text", "event"]
  connect() {

  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");

    if (this.togglableElementTarget.classList.contains("d-none")) {
      this.textTarget.textContent = "Show on map";
    } else {
      const event = new CustomEvent("showMap");
      window.dispatchEvent(event);
      this.textTarget.textContent = "Close map";
    }
  }

  display(){
    this.togglableElementTarget.classList.toggle("d-none")
  }

  show() {
    this.eventTargets.forEach(e => {
      e.classList.toggle("d-none")
    });
  }

}
