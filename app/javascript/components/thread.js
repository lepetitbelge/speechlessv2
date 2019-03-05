const btnShowC = document.querySelectorAll('.btn-show-c');

const toggleVisibility = (element) => {
  element.classList.toggle('is-visible');
};

const bindCommentsBnt = (btn) => {
  btn.addEventListener('click', () => {
    const parent = btn.closest('.comments');
    const comments = parent.querySelector('.hideDivComments');
    toggleVisibility(comments);
  });
};

function initThreads () {
  if (btnShowC) {
    const btnShow = document.querySelectorAll('.btn-show');
    btnShow.forEach(btn => bindCommentsBnt(btn));
  }
};

export { initThreads };
