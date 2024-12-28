

public class Button {
  private int _x, _y, _sizeX, _sizeY;
  private VideoSegment _video;
  private VideoScreen _videoScreen;

  /**
   Constructs a button object.
   videoTarget is the video that will play when you press the button.
   videoScreen is the screen on which the button is displayed and can be clicked.
   */
  Button(int x, int y, int sizeX, int sizeY, VideoSegment videoTarget, VideoScreen videoScreen) {
    _x = x;
    _y = y;
    _sizeX = sizeX;
    _sizeY = sizeY;
    _video = videoTarget;
    _videoScreen = videoScreen;
  }

  /**
   Displays the button if the button's videoScreen is the current video
   */
  public void display() {
    if (CurrentVideo == _videoScreen) {
      // TODO: Improve the design of the button. Right now it is just a white rectangle
      rect(_x, _y, _sizeX, _sizeY);
    }
  }

  /**
   True if the mouse cursor is inside the button, and the videoScreen is the current video being shown
   */
  public boolean isMouseOver() {
    if (CurrentVideo != _videoScreen) {
      return false;
    }
    if (mouseX >= _x && mouseX <= _x+_sizeX &&
      mouseY >= _y && mouseY <= _y+_sizeY) {
      return true;
    } else {
      return false;
    }
  }

  /**
   Stops the menu video and plays the button's target video
   */
  public void click() {
    MenuVideo.stop();
    _video.movie.jump(0);
    _video.movie.play();
    CurrentVideo = _video.videoEnum;
  }
}
