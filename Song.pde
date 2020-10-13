class Song {
  
  void playDRIP()
  {
    Art = loadImage("DripArt.jpg");
    Art.resize(180,180);
    car.nowPlaying = "drip too hard";
    car.nowArtist = "Gunna x lil baby";
    
    music = minim.loadFile("Drip_Too_Hard copy.WAV");
    music.play();
  }
  
  void playZEZE()
  {
    Art = loadImage("ZEZEArt.jpg");
    Art.resize(180,180);
    car.nowPlaying = "zeze feat. offset";
    car.nowArtist = "kodak x travis scott";
    
    music = minim.loadFile("ZEZE.WAV");
    music.play();
  }
  void playREX()
  {
    Art = loadImage("rexalbumart.jpg");
    Art.resize(180,180);
    car.nowPlaying = "loving is easy";
    car.nowArtist = "rex orange county";
    
    music = minim.loadFile("Rex Orange County _Lovin' Is Easy.WAV");
    music.play();
  }

  void stop() {
    music.close();
    //minim.stop();
  }
}
