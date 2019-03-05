const removeComments = () => {
  document.querySelectorAll('.hideDivComments').forEach(comments => {
    comments.classList.remove('is-visible');
  });
};

const toggleSelection = (selection, contributionBox) => {
  if (contributionBox.classList.contains('is-visible')) {
    contributionBox.classList.remove('is-visible');
    removeComments();
    selection.classList.remove('currentSelection');
  } else {
    document.querySelectorAll('.is-visible').forEach(old_selection => {
      old_selection.classList.remove('is-visible');
      removeComments();
    });
    document.querySelectorAll('.currentSelection').forEach(old_selection => {
      old_selection.classList.remove('currentSelection');
    });
    contributionBox.classList.add('is-visible');
    selection.classList.add('currentSelection');
  };
};

const clickOnSelection = () => {
  document.querySelectorAll('.highlightedSelection').forEach(selection => {
    selection.addEventListener('click', () => {
      const identity = selection.getAttribute('data-uui');
      const contributionBox = document.getElementById(`uui-${identity}`);
      toggleSelection(selection, contributionBox);
      }
    );
  });
};

const clickOnContribution = () => {
  document.querySelectorAll('.btn-show-c').forEach(contribution => {
    contribution.addEventListener('click', () => {
      const contributionBox = contribution.nextSibling.nextSibling
      const identity = contributionBox.id.substring(4);
      const selection = document.querySelector(`[data-uui="${identity}"]`);
      toggleSelection(selection, contributionBox);
      }
    );
  });
}


const connectHighlightContribution = () => {
  clickOnSelection();
  clickOnContribution();
};

export { connectHighlightContribution };
