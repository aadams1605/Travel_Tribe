import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["form", "messages", "messageInput"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  sendMessage(event) {

    if (event.type === "keyup") {
      if (event.keyCode !== 13) {
        return
      } else {
        event.preventDefault()
        const url = this.formTarget.action
        fetch(url, {
          method: "POST",
          body: new FormData(this.formTarget)
        })
      }
    }

    const message = this.messageInputTarget.value.trim();
    console.log("ENTER")
    console.log(message)
    if (message !== "") {
      this.channel.send({ message: message });
      this.messageInputTarget.value = "";
    }
  }
}
