class FuelComputer
{
  float fuelEconomy;
  float fuelConsumption;
  float fuelEconomyHistory;
  float range;
  
  void reset(float [] a,float [] b)
  {
  fuelEconomy=0;
  fuelConsumption=0;
  fuelEconomyHistory=0;
  range=0; 
  for (int i = 0; i < a.length; i++)
    {
      a[i] = 0;
      b[i] = 0;
    }
  }
  void fuelConsumption(float Liter, float km)
  {
    fuelConsumption = 0;
    fuelConsumption = fuelConsumption + (Liter/km)/100;
  }
  void fuelEconomy(float fuelcomp)
  {
    fuelEconomy = 0;
    fuelEconomy = 1/(fuelcomp/100);
  }
  void rangeLeft(float fueleco, float fuelleft)
  {
    range = 0;
    range = range + (fueleco)*(fuelleft);
  }
  
}
