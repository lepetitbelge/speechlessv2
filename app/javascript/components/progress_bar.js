// const progressBarLocation = "container-progressbar"
// const contentToTrack = "speech-background"

function createProgressBar() {

  // Create the container div
  let progressContElement = document.createElement("div");
  progressContElement.id = "progress-cont";

  // Create the progress bar itself
  let progressBarElement = document.createElement("div");
  progressBarElement.id = "progress-bar";
  progressBarElement.style.width = "0%";

  progressContElement.appendChild(progressBarElement);
  let locationObject = document.querySelector("#container-progressbar");

  if (locationObject.children === undefined) {
    locationObject.appendChild(progressContElement);
  } else {
    locationObject.insertBefore(progressContElement, locationObject.firstChild);
  }

  // Event handler that updates the width of the progress bar based
  // on how far the contentToTrack elemt has been scrolled
  window.onscroll = function(event) {
    var pageHeight = window.innerHeight;
    var container = document.querySelector("#speech-background");

    var adjustedHeight = container.clientHeight - pageHeight;

    var progress = ((window.pageYOffset / adjustedHeight) * 100);

    progressBarElement.style.width = progress + "%";
  }
}

export { createProgressBar };
