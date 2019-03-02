const comments = document.querySelector('.hidediv');
const btnShow = document.getElementById('btn-show');
const btnHide = document.getElementById('btn-hide');


const showComments = () => {
  btnShow.addEventListener('click', () => {
    hidediv.style.display = 'block';
  });
};

const hideComments = () => {
  btnHide.addEventListener('click', () => {
    hidediv.style.display = 'none';
  });
};

export { showComments };
export { hideComments };
