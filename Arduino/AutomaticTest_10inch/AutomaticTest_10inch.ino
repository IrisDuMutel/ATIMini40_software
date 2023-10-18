#include "SD.h"
#include"SPI.h"
#include <Servo.h>//Using servo library to control ESC
#include <Wire.h>
#include <Adafruit_BMP280.h>
#include <Adafruit_Sensor.h>
Adafruit_BMP280 bmp; // I2C Interface



Servo esc; //Creating a servo class with name as esc
int flag = 0;
int count = 0; //7.5 seconds


void setup() {
  Serial.begin(4800);
  esc.attach(3); //Specify the esc signal pin,Here as D8
  esc.writeMicroseconds(800); //initialize the signal to 1000
  Serial.println(F("BMP280 test"));
  if  (!bmp.begin()) {
    Serial.println(F("Could not find a valid BMP280 sensor,  check wiring!"));
    while (1);
  }

  /* Default settings from datasheet.  */
  bmp.setSampling(Adafruit_BMP280::MODE_NORMAL,     /* Operating Mode. */
                  Adafruit_BMP280::SAMPLING_X2,     /* Temp. oversampling */
                  Adafruit_BMP280::SAMPLING_X16,    /* Pressure oversampling */
                  Adafruit_BMP280::FILTER_X16,      /* Filtering. */
                  Adafruit_BMP280::STANDBY_MS_500);  /* Standby time. */
  Serial.println("Start test?: y/n");
  //// Failsafe code
  while(1) {
      if(Serial.read() == 'y'){
        break;
      }
      else if(Serial.read() == 'n'){
        Serial.println("Stopping test, reload script to restart");
        while(1){};
        }    
  }
////////////////////////////////////

}



void loop() {

  int P1 = 800; // No rotation or force
  int P2 = 1370; //
  int P3 = 1500;//
  int P4 = 1572;//
  int P5 = 1637;//
  int P6 = 1678;//
  int PWM_val[] = {P1, P2, P3, P4, P5, P6};
  int delay_val = 1000;
  int num_steps = 0;
  int num_tests = 2;
  int step_iter = 1;
  int val = 800; //Creating a variable val
  unsigned int startMilis   = 0;
  unsigned int currentMilis = 0;
  unsigned int timelapse = 0;
  while(1) {
    
    currentMilis = millis();
    esc.writeMicroseconds(val); //using val as the signal to esc
    Serial.print(timelapse);
    Serial.print(' ');
    Serial.print(flag);
    Serial.print(' ');
    Serial.print(num_tests);
    Serial.print(' ');
    Serial.print(num_steps);
    Serial.print(' ');
    Serial.print(val);
    Serial.print(' ');
    Serial.print("T:");
    Serial.print(' ');
    Serial.print(bmp.readTemperature());
    Serial.print(' ');
    Serial.print("P:");
    Serial.print(' ');
    Serial.print(bmp.readPressure()/100); // In hPa
    Serial.println();
    timelapse = currentMilis - startMilis;
    
    if (timelapse>15000) {
      startMilis = millis();
      num_steps = num_steps + 1;
      val = PWM_val[num_steps];
      
      if (num_steps > 5) {
        val = P1;
        num_steps = 0;
        flag = flag + 1;
        if (flag >= num_tests) {
          esc.writeMicroseconds(800);
          exit(0);
        }
      }
    }
  }
}
