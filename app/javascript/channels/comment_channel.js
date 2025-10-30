import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    console.log("Connected to CommentChannel!")
  },

  disconnected() {
    console.log("Disconnected from CommentChannel!")
  },

  received(data) {
    console.log("Received data:", data)
  }
})
