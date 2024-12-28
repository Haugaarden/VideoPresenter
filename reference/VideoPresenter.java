import processing.video.*;

import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;
import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

/** Processing Sketch VideoPresenter */
public class VideoPresenter {

Videos CurrentVideo;

VideoSegment menuVideo, zoomVideo, video1;

ArrayList<Button> buttons = new ArrayList<Button>();

// runs once
void setup() {
  fullScreen();

  CurrentVideo = Videos.Menu;
  menuVideo = new VideoSegment(this, "15MB.mp4", true, Videos.Menu);
  zoomVideo = new VideoSegment(this, "SampleVideo_1280x720_1mb.mp4", true, Videos.Zoom1);
  video1 = new VideoSegment(this, "sample-5s.mp4", true, Videos.Video1);

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


class Button {
  int x, y, sizeX, sizeY;
  VideoSegment video;
  Videos videoScreen;

  Button(int x, int y, int sizeX, int sizeY, VideoSegment video, Videos videoScreen) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.video = video;
    this.videoScreen = videoScreen;
  }

/**
   Displays the button if the button's videoScreen is the current video
*/ 
  void Display() {
    if (CurrentVideo == videoScreen) {
      rect(x, y, sizeX, sizeY);
    }
  }

/**
   True if the mouse cursor is inside the button, and the videoScreen is the current video
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

class VideoSegment {
  boolean loop;
  String fileName;
  Movie movie;
  Videos videoEnum;
  
  VideoSegment(PApplet parent, String fileName, boolean playInLoop, Videos videoEnum) {
    loop = playInLoop;
    this.fileName = fileName;
    this.videoEnum = videoEnum;
    
    movie = new Movie(parent, fileName);
  }
  
  void play(VideoSegment nextVideo) {
    image(movie, 0, 0, width, height);
    
    if(movie.isPlaying() == false) {
      println("Not playing");
      CurrentVideo = nextVideo.videoEnum;
      nextVideo.movie.jump(0);
      nextVideo.movie.play();
    }
  }
  
  void loop() {
    image(movie, 0, 0, width, height);
    
    if(movie.isPlaying() == false) {
      movie.jump(0);
      movie.play();
    }
  }
  
  void stop() {
    movie.stop();
    movie.jump(0);
  }
}

void movieEvent(Movie m) {
    m.read();
}

}

