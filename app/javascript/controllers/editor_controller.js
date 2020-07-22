import { Controller } from "stimulus"
import showdown from 'showdown'

export default class extends Controller {
  static targets = ['body']

  get bodyText() {
    return this.bodyTarget.value
  }

  type() {
    this.updateDisplay()
  }

  updateDisplay() {
    // const mdDisplay = document.querySelector("[data-target='md-display']")
    // console.log('md display')
    // console.log(mdDisplay)
    let converter = new showdown.Converter(),
    html = converter.makeHtml(this.bodyText);

    const mdDisplay = document.querySelector("[data-target='md-display']")
    console.log('md display')
    console.log(mdDisplay)
    mdDisplay.innerHTML = html
  }

  

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }
}