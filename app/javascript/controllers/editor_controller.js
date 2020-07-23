import { Controller } from "stimulus"
import showdown from 'showdown'

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
    let converter = new showdown.Converter(),
    html = converter.makeHtml(this.text);
    const mdDisplay = document.querySelector("[data-target='md-display']")
    mdDisplay.innerHTML = html
  }

  save() {
    const headers = {
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      'Content-Type': 'text/html'
    }

    const note = {
      'body': this.text,
      'tag_list': this.tags
    }
    console.log('saved')
    fetch(window.location, {
      method: 'PATCH',
      credentials: 'include',
      headers: headers,
      body: JSON.stringify({ note })
    }).then((response) => {
      console.log(response)
      response.json()
    }).catch(error => {
      console.log(error)
    })
  }

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }
}