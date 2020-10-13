class TripComputer
{
  float RPM;
  float gearRatio;
  float gear;
  float totalTravelledDistance;
  float speed;
  float time;
  float currentDistance;
  
  float pastWEvector;
  float pastNSvector;
  float currentWEvector;
  float currentNSvector;
  String direction;
  float WE;
  float NS;

  void reset()
  {
  RPM=0;
  gearRatio=0;
  gear=0;
  totalTravelledDistance=0;
  speed=0;
  time=0;
  currentDistance=0;
  
  pastWEvector=0;
  pastNSvector=0;
  currentWEvector=0;
  currentNSvector=0;
  direction="";
  WE=0;
  NS=0;
  }
  void addDistance(float a)
  {
    float counter = (a/3600);
    totalTravelledDistance = totalTravelledDistance+counter;
  }
  void currentDistance(float speed)
  {
    currentDistance = speed/3600;
  }
  void getPastDirectionVector(float westeast, float northsouth)
  {
    pastWEvector = westeast;
    pastNSvector = northsouth;
  }
  void getCurrentDirectionVector(float westeast, float northsouth)
  {
    currentWEvector = westeast;
    currentNSvector = northsouth;
    getDirection();
  }
  void getDirection()
  {
    direction = "";
    WE = 0;
    NS = 0;
    WE = WE + (currentWEvector - pastWEvector);
    NS = NS + (currentNSvector - pastNSvector);
    if (NS >= 0)
    direction = direction + "N";
    else 
    direction = direction + "S";
    if (WE >= 0)
    direction = direction + "E";
    else
    direction = direction + "W";
  }
  void setGear(float a)
  {
    gearRatio = a;

    if (gearRatio >= 3)
    {
      gear = 1;
    }
    if (gearRatio < 3.81 && gearRatio >= 2.2)
    {
      gear = 2;
    }
    if (gearRatio < 2.2 && gearRatio >= 1.4) {
      gear = 3;
    }
    if (gearRatio < 1.4 && gearRatio >= 1)
    {
      gear = 4;
    }
  }
}
