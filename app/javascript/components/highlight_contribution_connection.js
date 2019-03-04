const connectHighlightContribution = () => {
  document.querySelectorAll('.highlightedSelection').forEach(selection => {
    console.log(selection.getAttribute('data-uui'));
  });
};

export { connectHighlightContribution };