#include"SPI.h"

#include <Time.h>
#include <Adafruit_BMP280.h>

Adafruit_BMP280 bmp; // I2C Interface
const int IR_PIN1 = 2;  // IR sensor input pin
const int IR_PIN2 = 3;  // IR sensor input pin
const int IR_PIN3 = 18;  // IR sensor input pin
const int IR_PIN4 = 19;  // IR sensor input pin
unsigned long actualMillis = 0;  // Variable to store previous time
unsigned long previousMillis = 0;  // Variable to store previous time
float timeee;
unsigned long rpmtime1;
unsigned long rpmtime2;
unsigned long rpmtime3;
unsigned long rpmtime4;
volatile float rpmfloat1;
volatile float rpmfloat2;
volatile float rpmfloat3;
volatile float rpmfloat4;
float rpm1;
float rpm2;
float rpm3;
float rpm4;



void setup() {
  Serial.begin(115200);
//  Serial.println(F("BMP280 test"));
//  if  (!bmp.begin()) {
//    Serial.println(F("Could not find a valid BMP280 sensor,  check wiring!"));
//    while (1);
//  }
//
//  /* Default settings from datasheet.  */
//  bmp.setSampling(Adafruit_BMP280::MODE_NORMAL,     /* Operating Mode. */
//                  Adafruit_BMP280::SAMPLING_X2,     /* Temp. oversampling */
//                  Adafruit_BMP280::SAMPLING_X16,    /* Pressure oversampling */
//                  Adafruit_BMP280::FILTER_X16,      /* Filtering. */
//                  Adafruit_BMP280::STANDBY_MS_500);  /* Standby time. */



  pinMode(IR_PIN1, INPUT);
  pinMode(IR_PIN2, INPUT);
  pinMode(IR_PIN3, INPUT);
  pinMode(IR_PIN4, INPUT);
  attachInterrupt(digitalPinToInterrupt(IR_PIN1), RPM1, FALLING);
  attachInterrupt(digitalPinToInterrupt(IR_PIN2), RPM2, FALLING);
  attachInterrupt(digitalPinToInterrupt(IR_PIN3), RPM3, FALLING);
  attachInterrupt(digitalPinToInterrupt(IR_PIN4), RPM4, FALLING);

}



void loop() {
  delay(1000);
  noInterrupts();
  actualMillis = millis();
  timeee = (actualMillis - previousMillis);
  rpmfloat1 = 60000 * (rpmtime1/timeee);
  rpm1 = rpmfloat1;
  rpmfloat2 = 60000 * (rpmtime2/timeee);
  rpm2 = rpmfloat2;
  rpmfloat3 = 60000 * (rpmtime3/timeee);
  rpm3 = rpmfloat3;
  rpmfloat4 = 60000 * (rpmtime4/timeee);
  rpm4 = rpmfloat4;
  Serial.print(rpm1);
  Serial.print(", ");
  Serial.print(rpm2);
  Serial.print(", ");
  Serial.print(rpm3);
  Serial.print(", ");
  Serial.println(rpm4);
//  Serial.print(", ");
//  Serial.print(bmp.readTemperature());
//  Serial.print(", ");
//  Serial.println(bmp.readPressure()/100); // In hPa
  rpmtime1 = 0;
  rpmtime2 = 0;
  rpmtime3 = 0;
  rpmtime4 = 0;
//  Serial.print(timeee, 5);
//  Serial.print("RPM: ");

  previousMillis = actualMillis;
  interrupts();

  
}

void RPM1 () {
  rpmtime1 ++;
}

void RPM2 () {
  rpmtime2 ++;
}

void RPM3 () {
  rpmtime3 ++;
}

void RPM4 () {
  rpmtime4 ++;
}
