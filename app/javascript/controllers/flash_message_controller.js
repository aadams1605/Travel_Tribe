import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-message"
export default class extends Controller {
  static targets = ["message"]
  connect() {
    setTimeout(() => {
      this.messageTargets.forEach(message => {
        message.classList.add("opacity-none")
      });
    }, 2000)
  }
}
