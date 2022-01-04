import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["close"]

  connect() {
    const closeElement = this.closeTarget
    // Lock the scroll and save current scroll position
    this.lockScroll();
  }

  dismiss() {
  	//allow for transition animation and then remove the element
  	//make sure the timeout matched the tansition timing in css +10ms for cover
    document.querySelector('#welcome-modal-background').style.opacity="0";
    document.querySelector('#welcome-modal').style.opacity="0";
    
    setTimeout(() => { 
      document.querySelector('#welcome-modal-background').style.display = 'none'; 
      document.querySelector('#welcome-modal').style.display = 'none'; 
      this.unlockScroll();
    }, 200);
  }

  lockScroll() {
    // Add right padding to the body so the page doesn't shift
    // when we disable scrolling
    const scrollbarWidth = window.innerWidth - document.documentElement.clientWidth;
    document.body.style.paddingRight = `${scrollbarWidth}px`;

    // Save the scroll position
    this.saveScrollPosition();

    // Add classes to body to fix its position
    document.body.classList.add('fixed', 'inset-x-0', 'overflow-hidden');

    // Add negative top position in order for body to stay in place
    document.body.style.top = `-${this.scrollPosition}px`;
  }

  unlockScroll() {
    // Remove tweaks for scrollbar
    document.body.style.paddingRight = null;

    // Remove classes from body to unfix position
    document.body.classList.remove('fixed', 'inset-x-0', 'overflow-hidden');

    // Restore the scroll position of the body before it got locked
    this.restoreScrollPosition();

    // Remove the negative top inline style from body
    document.body.style.top = null;
  }

  saveScrollPosition() {
    this.scrollPosition = window.pageYOffset || document.body.scrollTop;
  }

  restoreScrollPosition() {
    document.documentElement.scrollTop = this.scrollPosition;
  }

}