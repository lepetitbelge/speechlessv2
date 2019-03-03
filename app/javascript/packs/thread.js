// const contributions = document.querySelector('.hideDivContributions');
// const comments = document.querySelector('.hideDivComments');
// const btnShowC = document.querySelectorAll('.btn-show-c');
// const btnShow = document.querySelector('.btn-show');


// const bindContributionBnt = (btn) => {
//   btn.addEventListener('click', () => {
//     console.log(btn.nextSibling());
//   });
// };

// function initContributionsWidget () {

//   if (btnShowC) {
//     btnShowC.forEach(btn => bindContributionBnt(btn));
//   }

// }:

// export { initContributionsWidget };

// const hideShowContributions = () => {
//   btnShowC.addEventListener('click', () => {
//     if (btnShowC.innerText === 'Hide contribution') {
//       btnShowC.innerText = 'Show contribution';
//       contributions.style.display = 'none';
//       comments.style.display = 'none';
//       btnShow.innerText = 'Show comments';
//     } else {
//       contributions.style.display = 'block';
//       btnShowC.innerText = 'Hide contribution';
//     }
//   });
// };

// const hideShowComments = () => {
//   btnShow.addEventListener('click', () => {
//     if (btnShow.innerText === 'Hide comments') {
//       btnShow.innerText = 'Show comments';
//       comments.style.display = 'none';
//     } else {
//       comments.style.display = 'block';
//       btnShow.innerText = 'Hide comments';
//     }
//   });
// };


// const contributions = document.querySelectorAll('.hideDivContributions');
// const comments = document.querySelectorAll('.hideDivComments');
// const btnShowC = document.querySelectorAll('.btn-show-c');
// const btnShow = document.querySelectorAll('.btn-show');

// const hideShowContributions = () => {
//   btnShowC.forEach((b) => {
//     b.addEventListener('click', () => {
//       if (b.innerText === 'Hide contribution') {
//         b.innerText = 'Show contribution';
//         contributions.style.display = 'none';
//         comments.style.display = 'none';
//         btnShow.children.innerText = 'Show comments';
//       } else {
//         contributions.style.display = 'block';
//         b.innerText = 'Hide contribution';
//       }
//     });
//   });
// };

// const hideShowComments = () => {
//   btnShow.forEach((b) => {
//     b.addEventListener('click', () => {
//       if (b.innerText === 'Hide comments') {
//         b.innerText = 'Show comments';
//         comments.style.display = 'none';
//       } else {
//         comments.style.display = 'block';
//         b.innerText = 'Hide comments';
//       }
//     });
//   });
// };

// export { hideShowContributions };
// export { hideShowComments };
