// // When the user scrolls the page, execute myFunction


// // Get the navbar
// var navbar = document.querySelector(".navbar-lewagon");

// // Get the offset position of the navbar
// var sticky = navbar.offsetTop;

// // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
// function navbarSticky() {
//   if (window.pageYOffset >= sticky) {
//     navbar.classList.add("sticky")
//   } else {
//     navbar.classList.remove("sticky");
//   }
// }

// export { navbarSticky };

const speechText = document.querySelector(".speech-text");

const sticky = speechText.offsetTop;

const thread = document.querySelector(".thread");

const updateCurrentContributions = () => {
  if(window.pageYOffset >= sticky) {
    thread.classList.add("thread-sticky");
  } else {
    thread.classListremove("thread-sticky");
  }
};

export { updateCurrentContributions };