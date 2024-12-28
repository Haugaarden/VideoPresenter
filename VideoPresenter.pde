
VideoScreen CurrentVideo;

VideoSegment MenuVideo, ZoomVideo, Video1;

ArrayList<Button> Buttons = new ArrayList<Button>();

int millis = 0;

// runs once
void setup() {
  fullScreen();

  MenuVideo = new VideoSegment(this, "menu-video.mp4", VideoScreen.Menu);
  ZoomVideo = new VideoSegment(this, "zoom1.mp4", VideoScreen.Zoom1);
  Video1 = new VideoSegment(this, "video1.mp4", VideoScreen.Video1);
  
  Buttons.add(new Button(100, 100, 100, 100, ZoomVideo, VideoScreen.Menu));

  CurrentVideo = VideoScreen.Menu;
  MenuVideo.movie.play();
}


// runs 60 times per second
void draw() {

  switch(CurrentVideo)
  {
  case Menu:
    MenuVideo.loop();
    break;
  case Zoom1:
    ZoomVideo.play(Video1);
    break;
  case Video1:
    Video1.play(MenuVideo);
    break;
  }

  for (int i = 0; i < Buttons.size(); i++) {
    Buttons.get(i).display();
  }
}


// runs when a mouse button is pressed
void mousePressed() {
  for (int i = 0; i < Buttons.size(); i++) {
    if (Buttons.get(i).isMouseOver()) {
      Buttons.get(i).click();
    }
  }
}


// a collection of the different available video screens. Add a new name here when a new video is added
enum VideoScreen {
  Menu,
    Zoom1,
    Video1
}
