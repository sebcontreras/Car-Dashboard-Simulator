class SensorDataProvider
{  
  String filePath;
  Table dataTable;
  TableRow row;
  TableRow row2;
  TableRow rowA;
  TableRow rowB;
  int currentIndex;
  float holder;
  float holder2;
  float holder3;
  float holder4;
  float wheelRadius;
  float tankSize;
  
  void Initialize(float wheel, float tank) 
  {
  filePath = a;
  dataTable = loadTable(filePath, "header");
  wheelRadius = wheel;
  tankSize = tank;
  }

  void readNext()
  {
   if (currentIndex < 599)
    currentIndex++;
  }
 
  int readRPM()
  {
    row = dataTable.getRow(currentIndex);
    return row.getInt("RPM");
  }

  float readFuelLevel()
  {
    row = dataTable.getRow(currentIndex);
    return row.getFloat("Fuel Level (liter)");
  }
  
  float readFuelPerSecond()
  {
    row = dataTable.getRow(currentIndex);
    holder = row.getFloat("Fuel Level (liter)");
    row2 = dataTable.getRow(currentIndex+1);
    return holder2 - holder; 
   //return holder - holder2;
  }
  
  float readFuelUsed()
  {
    rowA = dataTable.getRow(currentIndex);
    holder3 = rowA.getFloat("Fuel Level (liter)");
    rowB = dataTable.getRow(currentIndex+1);
    holder4 = rowB.getFloat("Fuel Level (liter)");
    return holder3 - holder4;
  }
  
  float readRatio()
  {
    row = dataTable.getRow(currentIndex);
    return row.getFloat("Gear Ratio");
  }
  
  float readX()
  {
    row = dataTable.getRow(currentIndex);
    return row.getFloat("X");
  }
  
  float readY()
  {
    row = dataTable.getRow(currentIndex);
    return row.getFloat("Y");
  }
  int readTime()
  {
    row = dataTable.getRow(currentIndex);
    return row.getInt("Time");
  }
  float readSpeed()
  {
    row = dataTable.getRow(currentIndex);
    float RPM = row.getFloat("RPM");
    float gearRatio = row.getFloat("Gear Ratio");
    float speed = (RPM/60)*(1/gearRatio)*2*PI*wheelRadius;
    return speed = (speed/1000)*3600;
  }
}


  
