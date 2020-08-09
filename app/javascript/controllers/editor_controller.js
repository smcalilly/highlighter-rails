import { Controller } from "stimulus"
import marked from 'marked'

export default class extends Controller {
  static targets = ['text', 'tags']

  get text() {
    return this.textTarget.value
  }

  get tags() {
    return this.tagsTarget.value
  }

  type() {
    this.updateMarkdownDisplay()
  }

  updateMarkdownDisplay() {
    const mdDisplay = document.querySelector("[data-target='md-display']")
    mdDisplay.innerHTML = marked(this.text)
  }

  connect() {
    this.updateMarkdownDisplay()
  }
}