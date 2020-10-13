class Gauge
{
  float CurrentValue;
  float Minimum;
  float Maximum;
  String Units;

  float positionX;
  float positionY;
  int size;
  float sizeX;
  float sizeY;
  
  color colour;

  void setRPM(int a, float b, float c, String d, float e, float f)
  {
    Minimum = b;
    Maximum = c;
    colour = #EA1A1A;
    if ( a >= 0 && a <= 5000)
    {
      CurrentValue = a;
    }
    if (CurrentValue <= Minimum*1.15 || CurrentValue >=Maximum*0.85)
    {
      colour = #F3F71E;
    }
    size = 300;
    Units = d;
    positionX = e;
    positionY = f;
  }
  void setFuelLevel(float a, float b, float c, String d, float e, float f)
  {
    Minimum = b;
    Maximum = c;
    colour = #EA1A1A;
    if ( a >= Minimum && a <= Maximum)
      CurrentValue = a;
    if (CurrentValue <= Minimum*1.15 || CurrentValue >=Maximum*0.85)
    {
      colour = #F3F71E;
    }
    size = 300;
    Units = d;
    positionX = e;
    positionY = f;
  }
  void setSpeed(float a, float b, float c, String d, float e, float f)
  {
    Minimum = b;
    Maximum = c;
    colour = #EA1A1A;
    if ( a >= Minimum && a <= Maximum)
      CurrentValue = a;
    if (CurrentValue <= Minimum*1.15 || CurrentValue >=Maximum*0.85)
    {
      colour = #F3F71E;
    }
    size = 300;
    Units = d;
    positionX = e;
    positionY = f;
  }
  void setDistance(float a, float b, float c, float d, float e, String f)
  {
    CurrentValue = a;
    positionX = b;
    positionY = c;
    sizeX = d;
    sizeY = e;
    Units = f;
  }
  void Gear(float a, String b, int c, int d, int e)
  {
    CurrentValue = a;
    Units = b;
    positionX = c;
    positionY = d;
    size = e;
  }
  void setfuelConsumption(float a, float b, float c, float d, float e, String f)
  {
    CurrentValue = a;
    positionX = b;
    positionY = c;
    sizeX = d;
    sizeY = e;
    Units = f;
  }
  void setfuelEconomy(float a, float b, float c, float d, float e, String f)
  {
    CurrentValue = a;
    positionX = b;
    positionY = c;
    sizeX = d;
    sizeY = e;
    Units = f;
  }
  void setDirection(float a, String b, float c, float d, int e)
  {
    CurrentValue = a;
    positionX = c;
    positionY = d;
    size = e;
    Units = b;
  }

  void display()            //circle gauges
  {
    stroke(#CECECE);        //draws circle
    strokeWeight(10);
    fill(0);
    ellipse(positionX, positionY, size, size);
     
     fill(colour);                         //draws Units
    //fill(#EA1A1A);
    textFont(myFontSmallLED);
    textAlign(CENTER, CENTER);
    text(Units, positionX, positionY+size/4.2);

    //textSize(15);        //draws data
    //fill(0);
    String num =nf(CurrentValue, 0, 1);
    //textFont(myFontBigDIG);
    textFont(myFontBigLED);
    textAlign(CENTER, CENTER);
    text(num, positionX, positionY-30);
  }
  void displayOdo()            //rectangle computer readings
  {
    stroke(#CECECE);       //rectangle computer
    strokeWeight(5);
    fill(0);
    rect(positionX, positionY, sizeX, sizeY);

    String num =nf(CurrentValue, 0, 1); //odometer
    fill(#6CF05C);
    textFont(myFontTinyDIG);
    textAlign(LEFT);
    text(Units, positionX+10, positionY+190);
    textAlign(RIGHT);
    text(num+" km", positionX+260, positionY+190);
  }
  void displayGear()            //circle gauges
  {
    stroke(#CECECE);        //draws circle
    strokeWeight(5);
    fill(0);
    ellipse(positionX, positionY, size, size);

    //textSize(15);        //draws Units
    fill(#EA1A1A);
    textFont(myFontSmallLED);
    textAlign(CENTER, CENTER);
    text(Units, positionX, positionY+size/4.2);

    //textSize(15);        //draws data
    //fill(255);
    String num =nf(CurrentValue, 0, 0);
    textFont(myFontBigLED);
    textAlign(CENTER, CENTER);
    text(num, positionX, positionY-30);
  }
  void displayFuelCons()            //rectangle computer readings
  {
    stroke(#CECECE);       //rectangle computer
    strokeWeight(5);
    noFill();
    rect(positionX, positionY, sizeX, sizeY);

    String num =nf(-CurrentValue, 0, 1); //fuel comp
    fill(#6CF05C);
    textFont(myFontTinyDIG);
    textAlign(LEFT);
    text(Units, positionX+10, positionY+230);
    textAlign(RIGHT);
    text(num+" L/100km", positionX+260, positionY+230);
  }
  void displayFuelEco()            //rectangle computer readings
  {
    stroke(#CECECE);       //rectangle computer
    strokeWeight(5);
    noFill();
    rect(positionX, positionY, sizeX, sizeY);

    String num =nf(-CurrentValue, 0, 1); //fuel econ
    fill(#6CF05C);
    textFont(myFontTinyDIG);
    textAlign(LEFT);
    text(Units, positionX+10, positionY+270);
    textAlign(RIGHT);
    text(num+" KM/L", positionX+260, positionY+270);
  }
  void display6()            //rectangle computer readings
  {
    stroke(#CECECE);       //rectangle computer
    strokeWeight(5);
    fill(0);
    rect(positionX, positionY, sizeX, sizeY);

    String num =nf(-CurrentValue, 0, 1); //fuel econ
    fill(#6CF05C);
    textFont(myFontTinyDIG);
    textAlign(LEFT);
    text(Units, positionX+10, positionY+310);
    textAlign(RIGHT);
    text(num+" KM", positionX+260, positionY+310);
  }
  void displayRange()
  {
    stroke(#CECECE);       //rectangle computer
    strokeWeight(5);
    fill(0);
    rect(positionX, positionY, sizeX, sizeY);

    String num =nf(-CurrentValue, 0, 1);//range
    fill(255);
    textFont(myFontBigDIG);
    textAlign(CENTER, CENTER);
    text(num, positionX+130, positionY+50);

    fill(#980808);
    textFont(myFontMedDIG);
    textAlign(CENTER, CENTER);
    text(Units, positionX+135, positionY+100);
  }
  void displayDirection()            //circle gauges
  {
    stroke(#CECECE);        //draws circle
    strokeWeight(5);
    fill(0);
    ellipse(positionX, positionY, size, size);

    //textSize(15);        //draws Units
    fill(#EA1A1A);
    textFont(myFontMedLED);
    textAlign(CENTER, CENTER);
    text(Units, positionX+5, positionY-10);
  }
}
