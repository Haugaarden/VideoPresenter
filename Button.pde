

class Button {
  int x, y, sizeX, sizeY;
  VideoSegment video;
  Videos videoScreen;

/**
   Constructs a button object. 
   videoTarget is the video that will play when you press the button.
   videoScreen is the screen on which the button is displayed and can be clicked.
*/ 
  Button(int x, int y, int sizeX, int sizeY, VideoSegment videoTarget, Videos videoScreen) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.video = videoTarget;
    this.videoScreen = videoScreen;
  }

/**
   Displays the button if the button's videoScreen is the current video
*/ 
  void Display() {
    if (CurrentVideo == videoScreen) {
      // TODO: Improve the design of the button. Right now it is just a white rectangle
      rect(x, y, sizeX, sizeY);
    }
  }

/**
   True if the mouse cursor is inside the button, and the videoScreen is the current video being shown
*/ 
  boolean IsMouseOver() {
    if (CurrentVideo != videoScreen) {
      return false;
    }
    if (mouseX >= x && mouseX <= x+sizeX &&
      mouseY >= y && mouseY <= y+sizeY) {
      return true;
    } else {
      return false;
    }
  }

/**
   Stops the menu video and plays the button's target video
*/ 
  void Click() {
    menuVideo.stop();
    video.movie.jump(0);
    video.movie.play();
    CurrentVideo = video.videoEnum;
  }
}
