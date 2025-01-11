A project for presenting videos on interactive info screens.

A video can be looping indefinitely, ex. a menu video waiting for a user to tap on a button.
A video can also play once and thereafter start playing the next video in a sequence.

The project is made with Processing4. See documentation and download the IDE here: https://processing.org/

The videos are from various sample video sites.



## How to add new video segments
Here is a guide on how to add new videos to the Video Presenter.

We will add a zoom video which we will call `ZoomVideo2`, and we will add an informative video which we will call `Video2`.

We will also be adding a new button on the `MenuVideo` which will start playing `ZoomVideo2`.


The end result will be a flow that looks like this:

**`MenuVideo` plays in a loop &#8594; User clicks new button &#8594; `ZoomVideo2` plays &#8594; `Video2` plays &#8594; Back to playing `MenuVideo` in a loop**

1. Copy/Paste your video files to the _data_ folder
   - Alternatively you can just drag the files into the Processing window and they will be added to the folder
2. Add two new VideoScreen enums in the bottom of the VideoPresenter.pde file. These are used to keep track of which video is playing
``` Processing
  enum VideoScreen {
    Menu,
    Zoom1,
    Video1,
    Zoom2,  // New Zoom2 video screen
    Video2, // New Video2 video screen
  }
```
3. Create a new VideoSegment object in the code VideoPresente.pde file. The "filename.mp4" must match the filenames you have in the data folder
``` Processing
  // In the top of the file  
  VideoSegment ZoomVideo2, Video2;

  // In the setup() function
  ZoomVideo2 = new VideoSegment(this, "zoom2.mp4", VideoScreen.Zoom2);
  Video2 = new VideoSegment(this, "video2.mp4", VideoScreen.Video2);
```
4. Add the new VideoSegments to the switch statement in the draw() function. This is the logic that handles which video is being played at the moment
``` Processing
  // In the draw() function
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
    case Zoom2:
      ZoomVideo2.play(Video2);    // Plays ZoomVideo2. When it is over it starts playing Video2.
      break;
    case Video2:
      Video2.play(MenuVideo); // Plays Video2. When it is over it starts playing MenuVideo.
      break;
  }
```
5. Add a new button on the Menu screen that will start playing `ZoomVideo2` when pressed
``` Processing
  // In the setup() function
  Buttons.add(new Button(200, 300, 100, 100, ZoomVideo2, VideoScreen.Menu));

  // Here is what values the Button constructor takes:
  // Button(X Coordinate, Y Coordinate, Width, Height, The Video It Will Start Playing, The VideoScreen Where The Button Will Be Shown)
```
6. Test out the new button and videos

You are now ready to test that your new videos are working.
Hit the run button in the top left corner and click the button you just added (there should be two of them now).

Repeat this process for however many video and buttons you need :) 
