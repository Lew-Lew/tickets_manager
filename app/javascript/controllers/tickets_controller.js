import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tickets"
export default class extends Controller {
  connect() {
    console.log("hello from the tickets controller")
  }

  changeTicketStatut(event) {
    event.preventDefault()
    console.log(event)
    this.element.innerText = "close"
  }
}
