
Videos CurrentVideo;

VideoSegment menuVideo, zoomVideo, video1;

ArrayList<Button> buttons = new ArrayList<Button>();

// runs once
void setup() {
  fullScreen();

  CurrentVideo = Videos.Menu;
  menuVideo = new VideoSegment(this, "menu-video.mp4", true, Videos.Menu);
  zoomVideo = new VideoSegment(this, "zoom1.mp4", true, Videos.Zoom1);
  video1 = new VideoSegment(this, "video1.mp4", true, Videos.Video1);

  buttons.add(new Button(100, 100, 100, 100, zoomVideo, Videos.Menu));

  menuVideo.movie.play();
}


// runs 60 times per second
void draw() {

  switch(CurrentVideo)
  {
  case Menu:
    menuVideo.loop();
    break;
  case Zoom1:
    zoomVideo.play(video1);
    break;
  case Video1:
    video1.play(menuVideo);
    break;
  }

  for (int i = 0; i < buttons.size(); i++) {
    buttons.get(i).Display();
  }
}


// runs when a mouse button is pressed
void mousePressed() {
  for (int i = 0; i < buttons.size(); i++) {
    if (buttons.get(i).IsMouseOver()) {
      buttons.get(i).Click();
    }
  }
}


// a collection of the different available videos. Add a new name here when a new video is added
enum Videos {
    Menu,
    Zoom1,
    Video1
}
