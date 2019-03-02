const comments = document.querySelector('.hideDivComments');
const contributions = document.querySelector('.hideDivContributions');
const btnShow = document.querySelector('.btn-show');
const btnHide = document.querySelector('.btn-hide');
const btnShowC = document.querySelector('.btn-show-c');
const btnHideC = document.querySelector('.btn-hide-c');



const showComments = () => {
  btnShow.addEventListener('click', () => {
    comments.style.display = 'block';
  });
};

const hideComments = () => {
  btnHide.addEventListener('click', () => {
    comments.style.display = 'none';
  });
};

const hideContributions = () => {
  btnHideC.addEventListener('click', () => {
    contributions.style.display = 'none';
    comments.style.display = 'none';
  });
};

const showContributions = () => {
  btnShowC.addEventListener('click', () => {
    contributions.style.display = 'block';
    comments.style.display = 'block';
  });
};

export { showComments };
export { hideComments };
export { showContributions };
export { hideContributions };
