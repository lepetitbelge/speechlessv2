const speech = document.querySelector('.speech-text');

const generateRandomToken = () => {
  return Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
};

const removeTooltips = () => {
  const toolTips = document.querySelectorAll('.highlightMenu');
  toolTips.forEach(toolTip => toolTip.remove());
};

const popOver = () => {
  return (
    `<div class="highlightMenu-inner">
      <div class="highlight-tools">
        <i class="fas fa-comment-alt"></i>
      </div>
    </div>
    <div class="highlightMenu-arrowClip">
      <span class="highlightMenu-arrow"></span>
    </div>`
  );
};

const createTooltip = (range) => {
  const rectList = range.getClientRects();

  const div = document.createElement('div');
  div.innerHTML = popOver();
  div.classList.add('highlightMenu');
  div.style.position = 'fixed';
  div.style.top = (rectList[0].top - 54) + 'px';
  div.style.left = ((rectList[0].left - 20) + (rectList[0].width / 2)) + 'px';
  document.body.appendChild(div);
};

const displayForm = () => {
  const form = document.getElementById('new_contribution');
  const textInput = form.querySelector('textarea');
  console.log(textInput)
  form.classList.toggle('hidden');
  // form.classList.add('is-visible');

  textInput.setSelectionRange(0, 0);
  console.log(textInput)
  textInput.focus();
};

const highlightSelection = (range, start, end) => {
  const token = generateRandomToken();
  const span = document.createElement('span');
  console.log(span)
  span.classList.add('highlightedSelection');
  span.dataset.uui = token;

  if (start.isEqualNode(end)) {
    range.surroundContents(span);
  } else {
    range.setEndAfter(start);
    range.surroundContents(span);
  }
  setHighlightPosition(range, token);
  removeTooltips();
};

const bindTooltipEvents = (range, start, end) => {
  // const highlight = document.querySelector('.fa-highlighter');
  const comment = document.querySelector('.fa-comment-alt');


  comment.addEventListener('click', () => {
    displayForm();
    highlightSelection(range, start, end);
    }
  );
  // highlight.addEventListener('click', () => highlightSelection(range, start, end));
};

const setHighlightPosition = (range, token) => {
  const paragraphIndex = range.startContainer.dataset.index;
  console.log(paragraphIndex)
  const paragraphInput = document.getElementById('contribution_paragraph');
  console.log(paragraphInput)
  paragraphInput.value = paragraphIndex;

  const uuiInput = document.getElementById('contribution_selection_uui');
  uuiInput.value = token;
  console.log(uuiInput)

  const speechHtmlInput = document.getElementById('speech_html');
  speechHtmlInput.value = speech.innerHTML;
};

const logSelection = (event) => {
  removeTooltips();
  const selection = window.getSelection();
  const start = selection.getRangeAt(0).startContainer.parentNode;
  const end = selection.getRangeAt(0).endContainer.parentNode;
  const range = selection.getRangeAt(0);

  if (range.collapsed) return
  createTooltip(range);
  bindTooltipEvents(range, start, end);
};

const initHighlighter = function() {

  if (speech) {
    speech.addEventListener('mouseup', logSelection);
  }
};

export { initHighlighter };
