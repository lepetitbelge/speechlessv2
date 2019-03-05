const speechText = document.querySelector(".speech-text");

const sticky = speechText.offsetTop;

const thread = document.querySelector(".thread");

const updateCurrentContributions = () => {
  if (thread) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 308) {
        thread.classList.add('thread-sticky');
      } else {
        thread.classList.remove('thread-sticky');
      }
    });
  }
};

export { updateCurrentContributions };