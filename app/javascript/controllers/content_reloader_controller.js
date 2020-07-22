import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.load()
  }

  load() {
    console.log(window.location.pathname)
    const id = window.location.pathname.split('/').pop()
    fetch(`${window.location}.json`, { credentials: 'include' })
      .then(response => {
        console.log(response)
        response.text()})
      // .then(html => {
      //   this.element.innerHTML = html
      // })
  }
}