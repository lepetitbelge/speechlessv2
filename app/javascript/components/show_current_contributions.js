const thread = document.querySelector(".thread");

const makeCurrentsVisible = (span) => {
  const identity = span.getAttribute('data-uui');
  let contribution = document.getElementById(`uui-${identity}`);
  if (contribution) {
    contribution = contribution.parentNode;
    const location = span.getClientRects();
    const bottomIndex = location.length - 1;
    if (location[bottomIndex].bottom >= 0 && location[0].top <= window.innerHeight) {
      contribution.classList.remove('invisible');
    } else {
      contribution.classList.add('invisible');
    }
  }
}

const updateCurrentContributions = () => {
  if (thread) {
    window.addEventListener('scroll', () => {
      document.querySelectorAll("span").forEach(span => {
        makeCurrentsVisible(span);
      });
      if (window.scrollY >= 308) {
        thread.classList.add('thread-sticky');
      } else {
        thread.classList.remove('thread-sticky');
      }
    });
  }
};

export { updateCurrentContributions };
