import processing.video.Movie;

public class VideoSegment {
  public Movie movie;
  public VideoScreen videoEnum;

  /**
   Constructs a VideoSegment object.
   parent is the calling PApplet. Needed to create and render video.
   fileName is the name of the video file to be loaded from the sketch's "data" folder
   videoScreen is the screen this video is attached to. It is used when switching to the next video.
   */
  VideoSegment(PApplet parent, String fileName, VideoScreen videoScreen) {
    this.videoEnum = videoScreen;

    movie = new Movie(parent, fileName);
  }


  /**
   Plays the video once, and then starts playing the nextVideo
   */
  public void play(VideoSegment nextVideo) {
    image(movie, 0, 0, width, height);

    if (movie.isPlaying() == false) {
      CurrentVideo = nextVideo.videoEnum;
      nextVideo.movie.jump(0);
      nextVideo.movie.play();
    }
  }


  /**
   Plays the movie infinitely. Can only proceed to another video if a button is pressed
   */
  public void loop() {
    image(movie, 0, 0, width, height);

    if (movie.isPlaying() == false) {
      movie.jump(0);
      movie.play();
    }
  }


  /**
   Stops the video and rewinds it
   */
  void stop() {
    movie.stop();
    movie.jump(0);
  }
}


/**
 Called everytime a new frame is ready to be read
 */
void movieEvent(Movie m) {
  m.read();
}
