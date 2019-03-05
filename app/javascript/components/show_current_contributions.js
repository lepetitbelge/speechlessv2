const speechText = document.querySelector(".speech-text");

const sticky = speechText.offsetTop;

const thread = document.querySelector(".thread");

// const makeCurrentsVisible = () => {
//   console.log(window.querySelectorAll(".comments"))
//   window.querySelectorAll(".comments").forEach(contributionThread => {
//     contributionThread.classList.add('is-visible');
//   });
// };

const makeCurrentsVisible = (span) => {
  const identity = span.getAttribute('data-uui');
  const contribution = document.getElementById(`uui-${identity}`).previousSibling;
  const location = span.getClientRects();
  const bottomIndex = location.length - 1;
  if (location[bottomIndex].bottom >= 0 && location[0].top <= window.innerHeight) {
    contribution.classList.add('is-visible');
  } else {
    contribution.classList.remove('is-visible');
  }
};

// const testSpan = document.querySelector(`[data-uui="a1c96h3uj2fq10r5bzy1kk"]`);
// // but the market is ...

// console.log(window.scrollTop);

const updateCurrentContributions = () => {
  if (thread) {
    window.addEventListener('scroll', () => {
      document.querySelectorAll("span").forEach(span => {
        makeCurrentsVisible(span);
      });
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
