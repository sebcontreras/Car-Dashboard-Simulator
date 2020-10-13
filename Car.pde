class Car
{
  float wheelSize;
  float tankCapacity;
  
  float maxRPM=2400;
  float minRPM=700;
  
  float maxSpeed;
  float minSpeed;
  String nowPlaying;
  String nowArtist;
  
  void fontback()
  {
    myFontSmallLED = createFont("The Led Display St.ttf", 25);
    myFontBigLED = createFont("The Led Display St.ttf", 60);
    myFontTinyDIG = createFont("digital-7.ttf", 20);
    myFontBigDIG = createFont("digital-7.ttf", 75);
    myFontMedDIG = createFont("digital-7.ttf", 35);
    myFontMedLED = createFont("The Led Display St.ttf", 50);
    myFontChart = createFont("AndaleMono-10.vlw", 10);

    img = loadImage("1.jpg");
    img.resize(1400, 790);
    
    Beamer = loadImage("eurp-1107-01+2009-bmw-335i-yoo-tube+cover.jpg");
    Beamer.resize(1400, 790);
  }
}
