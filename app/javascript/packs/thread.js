const comments = document.querySelector('.hidediv');
const btnShow = document.querySelector('.btn-show');
const btnHide = document.querySelector('.btn-hide');


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

export { showComments };
export { hideComments };
