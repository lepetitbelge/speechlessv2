const contributions = document.querySelector('.hideDivContributions');
const comments = document.querySelector('.hideDivComments');
const btnShowC = document.querySelector('.btn-show-c');
const btnShow = document.querySelector('.btn-show');

const hideShowContributions = () => {
  btnShowC.addEventListener('click', () => {
    if (btnShowC.innerText === 'Hide contribution') {
      btnShowC.innerText = 'Show contribution';
      contributions.style.display = 'none';
      comments.style.display = 'none';
      btnShow.innerText = 'Show comments';
    } else {
      contributions.style.display = 'block';
      btnShowC.innerText = 'Hide contribution';
    }
  });
};

const hideShowComments = () => {
  btnShow.addEventListener('click', () => {
    if (btnShow.innerText === 'Hide comments') {
      btnShow.innerText = 'Show comments';
      comments.style.display = 'none';
    } else {
      comments.style.display = 'block';
      btnShow.innerText = 'Hide comments';
    }
  });
};


export { hideShowContributions };
export { hideShowComments };
