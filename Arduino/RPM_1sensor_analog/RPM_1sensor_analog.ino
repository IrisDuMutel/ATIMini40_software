#include <Time.h>

// These constants won't change. They're used to give names to the pins used:
const int analogInPin = A5;  // Analog input pin that the potentiometer is attached to
const int analogOutPin = A2; // Analog output pin that the LED is attached to
float t;
int sensorValue = 0;        // value read from the pot
int sensorValue2 = 0;        // value read from the pot

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600);
}

void loop() {
  // read the analog in value:
  sensorValue = analogRead(analogOutPin);
  sensorValue2 = analogRead(analogInPin);
  t = millis();
  Serial.print(t);
  Serial.print(", ");
  Serial.print(sensorValue);
  Serial.print(", ");
  Serial.println(sensorValue2);

  // wait 2 milliseconds before the next loop for the analog-to-digital
  // converter to settle after the last reading:
  delay(2);
}