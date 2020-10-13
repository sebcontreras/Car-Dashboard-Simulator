class FuelTank
{
  float tankCapacity;
  float fuelLevelPast;
  float fuelLevel;
  float fuelUsed;

  void reset()
  {
    tankCapacity=0;
    fuelLevelPast=0;
    fuelLevel=0;
    fuelUsed=0;
  }
  void getPastFuel(float a)
  {
    fuelLevelPast = a;
  }
  void getConsumedFuel(float b)
  {
    fuelLevel = fuelLevel +(fuelLevelPast - b);
  }
}
