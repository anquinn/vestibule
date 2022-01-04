import { Controller } from "@hotwired/stimulus"
import Cleave from 'cleave.js';

export default class extends Controller {
  static targets = ["locale"]

  connect() {

    console.log(this.localeTarget.textContent)
    if (this.localeTarget.textContent == "en") {
      window.__AMOUNT_INPUT_MASK__ = {
          numeral: true,
          numeralThousandsGroupStyle: 'none',
          numeralDecimalMark: '.',
          numeralPositiveOnly: true,
      };
    }
    else {
      window.__AMOUNT_INPUT_MASK__ = {
          numeral: true,
          numeralThousandsGroupStyle: 'none',
          numeralDecimalMark: ',',
          numeralPositiveOnly: true,
      };
    }


    console.log("Mask")
    document.addEventListener("DOMContentLoaded", function(event) {
        // Input Mask
        document.querySelectorAll("input.currency-input-mask").forEach(function(el) {
            new Cleave(el, window.__AMOUNT_INPUT_MASK__);
        });
    });
  }
}
