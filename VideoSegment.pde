import processing.video.*;

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
