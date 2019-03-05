const transitionToWordcloud = () => {
  const videoPlayer = document.querySelector("video")
  const homePageBanner = document.querySelector(".video_banner")

  videoPlayer.addEventListener("ended", (event) => {
    homePageBanner.setAttribute("id", "photo_banner");
    homePageBanner.removeChild(videoPlayer);
  });
};

export { transitionToWordcloud };
