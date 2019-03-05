const speechText = document.querySelector(".speech-text");

const sticky = speechText.offsetTop;

const thread = document.querySelector(".thread");

// const makeCurrentsVisible = () => {
//   console.log(window.querySelectorAll(".comments"))
//   window.querySelectorAll(".comments").forEach(contributionThread => {
//     contributionThread.classList.add('is-visible');
//   });
// };

const makeAllInvisible = () => {
  document.querySelectorAll(".comments").forEach(contributionThread => {
    contributionThread.classList.remove('is-visible');
  });
};
const checkIfSpanInViewpoint = (span) => {
  const location = span.getClientRects();
  const bottomIndex = location.length - 1;
  if (location[bottomIndex].bottom >= 0 && location[0].top <= window.innerHeight) {
    // inside window
    
  } else {
    console.log('nicht drin');
  }
};

const testSpan = document.querySelector(`[data-uui="a1c96h3uj2fq10r5bzy1kk"]`);
// but the market is ...

console.log(window.scrollTop);

const updateCurrentContributions = () => {
  if (thread) {
    window.addEventListener('scroll', () => {
      makeAllInvisible();
      // makeCurrentsVisible();
      console.log(window.innerHeight);
      const location = testSpan.getClientRects();
      console.log(location)
      const bottomIndex = location.length - 1;
      console.log(location[bottomIndex].bottom)
      console.log(location[0].top)
      if (location[bottomIndex].bottom >= 0 && location[0].top <= window.innerHeight) {
        console.log('drin');
      } else {
        console.log('nicht drin');
      }

      // console.log(testSpan.getClientRects()[2].bottom >= 0);
      if (window.scrollY >= 308) {
        thread.classList.add('thread-sticky');
      } else {
        thread.classList.remove('thread-sticky');
      }
    });
  }
};

export { updateCurrentContributions };
