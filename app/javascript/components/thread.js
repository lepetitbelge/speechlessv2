const btnShowC = document.querySelectorAll('.btn-show-c');

const toggleVisibility = (element) => {
  element.classList.toggle('is-visible');
};

// const bindContributionBnt = (btn) => {
//   btn.addEventListener('click', () => {
//     const parent = btn.parentNode;
//     const contribution = parent.querySelector('.hideDivContributions');
//     const comments = parent.querySelector('.hideDivComments');
//     if (contribution.classList.contains('is-visible')) {
//       comments.classList.remove('is-visible');
//     }
//     toggleVisibility(contribution);
//   });
// };

const bindCommentsBnt = (btn) => {
  btn.addEventListener('click', () => {
    const parent = btn.closest('.comments');
    const comments = parent.querySelector('.hideDivComments');
    toggleVisibility(comments);
  });
};

function initThreads () {
  if (btnShowC) {
    // btnShowC.forEach(btn => bindContributionBnt(btn));
    const btnShow = document.querySelectorAll('.btn-show');
    btnShow.forEach(btn => bindCommentsBnt(btn));
  }
};

export { initThreads };
