#include "SD.h"
#include"SPI.h"
#include <Servo.h>//Using servo library to control ESC
#include <Wire.h>

Servo esc; //Creating a servo class with name as esc
int flag = 0;


void setup() {
  esc.attach(3); //Specify the esc signal pin,Here as D8
  esc.writeMicroseconds(800); //initialize the signal to 1000
  Serial.begin(4800);
}



void loop() {
  int P1 = 800; // No rotation or force
  int P2 = 1200; //
  int P3 = 1300;//
  int P4 = 1400;//
  int P5 = 1500;//
  int PWM_val[] = {P1, P2, P3, P4, P5};
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
    Serial.println();
    timelapse = currentMilis - startMilis;
    
    if (timelapse>10000) {
      startMilis = millis();
      num_steps = num_steps + 1;
      val = PWM_val[num_steps];
      
      if (num_steps > 4) {
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
