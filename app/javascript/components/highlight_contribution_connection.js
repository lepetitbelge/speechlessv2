const connectHighlightContribution = () => {
  document.querySelectorAll('.highlightedSelection').forEach(selection => {
    let identity = selection.getAttribute('data-uui');
    selection.addEventListener('click', () => {
      document.getElementById(`uui-${identity}`).classList.toggle('is-visible');
      }
    );
    // console.log(selection.getAttribute('data-uui'));
  });
};

export { connectHighlightContribution };

const ide = 'uui-lzo0ce0vun4tdxyu4ko5p';