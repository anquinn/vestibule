// Example usage:
// <div data-controller="tooltip" data-tooltip-content-value="Hello world" data-tooltip-position-value="right"></div>
// data-tooltip-position-value is optional

import { Controller } from "@hotwired/stimulus"
import tippy from "tippy.js";

export default class extends Controller {
  static values = {
    content: String,
    position: String
  }

  connect() {
    let options = {}
    if (this.hasContentValue) {
      options['content'] = this.contentValue
    }
    if (this.hasPositionValue) {
      options['placement'] = this.positionValue
    }
    this.tippy = tippy(this.element, options);
  }

  disconnect() {
    this.tippy.destroy();
  }
}