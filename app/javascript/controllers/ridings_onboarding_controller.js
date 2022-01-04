import { Controller } from "@hotwired/stimulus"
import Shepherd from 'shepherd.js';
import Polyglot from 'node-polyglot'
// // import 'shepherd.js/dist/css/shepherd.css';
window.Shepherd = Shepherd;

// var polyglot = new Polyglot();

var polyglot = new Polyglot({phrases: window.polyglot});

export default class extends Controller {
  connect() {
  	// console.log("shep");

  	console.log(polyglot);
  
  	document.getElementsByTagName("html")[0].setAttribute("style", "scroll-behavior: smooth;");

	const tour = new Shepherd.Tour({
	  defaultStepOptions: {
	  	cancelIcon: {
	      enabled: true
	    },
	    classes: 'shadow-lg',
	    scrollTo: { 
	    	behavior: 'smooth',
	    	block: 'center'
	    }
	  } 
	});

	tour.on("complete", scrollToTop);

	window.tour = tour;

	// tour.addStep({
	//   id: 'get_started',
	//   title: 'Getting started',
	//   text: "Welcome! Let's get started creating your first quiz.",
	//   buttons: [
	//   	{
	//     	text: 'Seen this before? Skip the tips',
	//     	secondary: true,
	//     	action: tour.complete
	//     },
	//     {
	//       text: 'Get started',
	//       action: tour.next
	//     },
	//   ],
	//   scrollTo: false,
	//   classes: 'p-10 shepherd-welcome',
	// });

	tour.addStep({
	  id: 'locale_toggle',
	  title: polyglot.t("locale_toggle_title"),
	  // text: "See some facts about your riding.",
	  text: polyglot.t("locale_toggle_step"),
	  attachTo: {
	    element: '#locale_toggle',
	    on: 'right'
	  },
	  popperOptions: {
	  	modifiers: [{ name: 'offset', options: { offset: [0, 50] } }]
	  },
	  buttons: [
	    {
	      text: polyglot.t("next"),
	      action: tour.next
	    },
	  ],
	  scrollTo: false
	});

	tour.addStep({
	  id: 'ridings_menu',
	  title: polyglot.t("ridings_menu_title"),
	  // text: "See some facts about your riding.",
	  text: polyglot.t("ridings_menu_step"),
	  attachTo: {
	    element: '#ridings_menu',
	    on: 'right'
	  },
	  popperOptions: {
	  	modifiers: [{ name: 'offset', options: { offset: [0, 50] } }]
	  },
	  buttons: [
	    {
	      text: polyglot.t("next"),
	      action: tour.next
	    },
	  ],
	  scrollTo: false
	});

	tour.addStep({
	  id: 'reports_menu',
	  title: polyglot.t("reports_menu_title"),
	  // text: "See some facts about your riding.",
	  text: polyglot.t("reports_menu_step"),
	  attachTo: {
	    element: '#reports_menu',
	    on: 'right'
	  },
	  popperOptions: {
	  	modifiers: [{ name: 'offset', options: { offset: [0, 30] } }]
	  },
	  buttons: [
	    {
	      text: polyglot.t("next"),
	      action: tour.next
	    },
	  ],
	  scrollTo: false
	});

	tour.addStep({
	  id: 'riding_details',
	  title: polyglot.t("riding_details_title"),
	  // text: "See some facts about your riding.",
	  text: polyglot.t("riding_details_step"),
	  attachTo: {
	    element: '#riding_details',
	    on: 'bottom'
	  },
	  popperOptions: {
	  	modifiers: [{ name: 'offset', options: { offset: [0, 20] } }]
	  },
	  buttons: [
	    {
	      text: polyglot.t("next"),
	      action: tour.next
	    },
	  ],
	  scrollTo: false
	});

	tour.addStep({
	  id: 'riding_stats',
	  title: polyglot.t("riding_stats_title"),
	  text: polyglot.t("riding_stats_step"),
	  attachTo: {
	    element: '#riding_stats',
	    on: 'top'
	  },
	  popperOptions: {
	  	modifiers: [{ name: 'offset', options: { offset: [0, 0] } }]
	  },
	  buttons: [
	    {
	      text: polyglot.t("next"),
	      action: tour.next
	    },
	  ]
	});

	tour.addStep({
	  id: 'email_plan',
	  title: polyglot.t("email_plan_title"),
	  text: polyglot.t("email_plan_step"),
	  attachTo: {
	    element: '#email_plan',
	    on: 'top'
	  },
	  scrollTo: { 
    	behavior: 'smooth',
    	block: 'end'
	  },
	  popperOptions: {
	  	modifiers: [{ name: 'offset', options: { offset: [0, -20] } }]
	  },
	  buttons: [
	    {
	      text: polyglot.t("next"),
	      action: tour.next
	    },
   	]
	});

	tour.addStep({
	  id: 'reports',
	  title: polyglot.t("reports_title"),
	  text: polyglot.t("reports_step"),
	  attachTo: {
	    element: '#reports',
	    on: 'top'
	  },
	  popperOptions: {
	  	modifiers: [{ name: 'offset', options: { offset: [20, 0] } }]
	  },
	  buttons: [
	    {
	      text: polyglot.t("next"),
	      action: tour.next
	    },
	  ]
	});

	tour.addStep({
	  id: 'tools',
	  title: polyglot.t("tools_title"),
	  text: polyglot.t("tools_step"),
	  attachTo: {
	    element: '#tools',
	    on: 'top'
	  },
	  popperOptions: {
	  	modifiers: [{ name: 'offset', options: { offset: [20, 0] } }]
	  },
	  buttons: [
	    {
	      text: polyglot.t("get_started"),
	      action: tour.complete
	    }
	  ]
	});

	function scrollToTop() {
		// tour.complete();
		console.log("complete");
		// window.focus();
		document.getElementById('header').scrollIntoView({ 
		  behavior: 'smooth' 
		});
		// window.scrollTo(0,0);
	}

  }
}