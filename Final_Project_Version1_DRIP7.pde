import ddf.minim.*;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer music;
Minim minim;
Song song;

int test = 0;
String a = "";
int c =0;

SensorDataProvider sensor = new SensorDataProvider();
Gauge G = new Gauge ();
TripComputer Trip = new TripComputer();
FuelTank Tank = new FuelTank();
FuelComputer FuelComp = new FuelComputer();
Car car = new Car();

PFont myFontBigLED;
PFont myFontMedLED;
PFont myFontSmallLED;
PFont myFontTinyDIG;
PFont myFontBigDIG;
PFont myFontMedDIG;
PFont myFontChart;

PImage img;
PImage Beamer;
PImage Logo;
PImage Art;

int i = 0;
float [] savedConsumption = new float [40];
float [] savedEconomy = new float [40];

void setup ()
{
  sensor.Initialize(car.wheelSize, car.tankCapacity);
  car.fontback();

  song = new Song();
  minim = new Minim(this);

  size (1400, 790);
  frameRate(30);
}
void keyPressed()
{
  if (key == 49) {
    a = "car_status_BMW_323i.csv";
    test = 1;
    car.wheelSize = 0.23;
    car.tankCapacity = 60;
    car.maxSpeed = 183;
    car.minSpeed = 14;
    song.playDRIP();
    Logo = loadImage("BMW-logo-2000-2048x2048.png");
    Logo.resize(250, 250);
    c=0;
  } else if (key == 50) {
    a = "car_status_Truck_F150.csv";
    test = 1;
    car.wheelSize = 0.254;
    car.tankCapacity = 80;
    car.maxSpeed = 152;
    car.minSpeed = 14;
    song.playZEZE();
    Logo = loadImage("Ford-logo-2003-1366x768.png");
    Logo.resize(500, 250);
    c=50;
  } else if (key == 52) {
    song.stop();
    song.playZEZE();
  } else if (key == 53) {
    song.stop();
    song.playDRIP();
    } else if (key == 54) {
    song.stop();
    song.playREX();
  } else if (key == 51) {
    exit();
  }
  setup();
}

void draw ()
{
  if (test == 0)
  {
    background(Beamer);
    stroke(#CECECE);
    strokeWeight(10);
    fill(0);
    rect(480, 220, 530, 400);
    fill(#6CF05C);
    textAlign(LEFT);
    textFont(myFontBigDIG);
    text("Press key:", 500, height/2-100);
    text("1 - BMW 323i", 500, height/2);
    text("2 - Ford F150", 500, height/2+100);
    text("3 - Quit Program", 500, height/2+200);
  } else if (test == 1) {
    
    background(img);

    fill(0); // show now playing
    rect(1180, 20, 200, 235);
    image(Art, 1190, 25);
    fill(#6CF05C);
    textFont(myFontTinyDIG);
    textAlign(CENTER, CENTER);
    text(car.nowPlaying, 1290, 220);
    text(car.nowArtist, 1290, 240);

    fill(0);
    rect(1210, 280, 160, 95);

    fill(#6CF05C);
    textAlign(LEFT);
    text("Press 4 for zeze", 1220, 310);
    text("Press 5 for drip", 1220, 335);
    text("Press 6 for rex", 1220, 360);

    image(Logo, 20-c, 20-c);


    G.setRPM(sensor.readRPM(), car.minRPM, car.maxRPM, "RPM", 700, 170); //displayrpm
    G.display(); //display rpm

    G.setFuelLevel(sensor.readFuelLevel(), 1, car.tankCapacity, "Fuel (liter)", 1000, 300);
    G.display(); //display fuel level

    G.setSpeed(sensor.readSpeed(), car.minSpeed, car.maxSpeed, "Speed (km/h)", 400, 300);
    G.display(); //display speed

    Trip.addDistance(sensor.readSpeed());
    G.setDistance(Trip.totalTravelledDistance, 565, 350, 270, 350, "ODOMETER: ");
    G.displayOdo(); //display odometer

    Trip.setGear(sensor.readRatio());
    G.Gear(Trip.gear, "Gear", 480, 75, 130);
    G.displayGear(); //display gear

    Trip.currentDistance(sensor.readSpeed());
    FuelComp.fuelConsumption(sensor.readFuelPerSecond(), Trip.currentDistance);
    G.setfuelConsumption(FuelComp.fuelConsumption, 565, 350, 270, 350, "Fuel Consumption: "); 
    G.displayFuelCons(); //display fuel consumption (L/100km)

    FuelComp.fuelEconomy(FuelComp.fuelConsumption);
    G.setfuelEconomy(FuelComp.fuelEconomy, 565, 350, 270, 350, "Fuel Economy: ");
    G.displayFuelEco(); //display fuel economy (km/L)

    FuelComp.rangeLeft(FuelComp.fuelEconomy, Tank.fuelLevelPast);
    G.setfuelEconomy(FuelComp.range, 565, 350, 270, 150, "Range (km)");
    G.displayRange(); //display range (km)

    Tank.getPastFuel(sensor.readFuelLevel()); 
    Trip.getPastDirectionVector(sensor.readX(), sensor.readY());

    fill(0);
    rect(30, 480, 500, 220);
    import org.gicentre.utils.stat.*;
    BarChart barChart2;
    savedEconomy[i] = -(FuelComp.fuelEconomy);
    barChart2 = new BarChart(this);
    barChart2.setData(savedEconomy);
    // Scaling
    barChart2.setMinValue(0);
    barChart2.setMaxValue(20);
    // Axis appearance
    textFont(createFont("Serif", 5), 10);
    barChart2.showValueAxis(true); 
    barChart2.setValueFormat("#"); 
    barChart2.showCategoryAxis(true);
    // Bar colours and appearance
    barChart2.setBarColour(color(250, 100, 20, 200)); 
    barChart2.setBarGap(3);
    barChart2.draw(35, 480, 495, 190);
    // title
    textFont(myFontTinyDIG);
    fill(#6CF05C);
    textAlign(CENTER, CENTER);
    text("Average Fuel Economy (kilometer/Liter)", 280, 680);

    fill(0);
    rect(870, 480, 500, 220);
    import org.gicentre.utils.stat.*;
    BarChart barChart;
    savedConsumption[i] = -(FuelComp.fuelConsumption);
    barChart = new BarChart(this);
    barChart.setData(savedConsumption);
    // Scaling
    barChart.setMinValue(0);
    barChart.setMaxValue(30);
    // Axis appearance
    textFont(createFont("Serif", 5), 10);
    barChart.showValueAxis(true); 
    barChart.setValueFormat("#"); 
    barChart.showCategoryAxis(true);
    // Bar colours and appearance
    barChart.setBarColour(color(250, 100, 20, 200)); 
    barChart.setBarGap(3);
    barChart.draw(875, 480, 500, 190);
    // title
    textFont(myFontTinyDIG);
    fill(#6CF05C);
    textAlign(CENTER, CENTER);
    text("Fuel consumption (Liter/second)", 1120, 680);

    i++;
    if (i >=40)
    {
      i = 0;
    }

    sensor.readNext();

    Tank.getConsumedFuel(sensor.readFuelLevel());
    Trip.getCurrentDirectionVector(sensor.readX(), sensor.readY());
    G.setDirection(0, Trip.direction, 920, 75, 130);
    G.displayDirection(); //dsiplay direction
    if (sensor.currentIndex == 599)
    {
      sensor.currentIndex = 0;
      Trip.reset();
      FuelComp.reset(savedEconomy, savedConsumption);
      Tank.reset();
      song.stop();
      test = 0;
    }
  }
}
