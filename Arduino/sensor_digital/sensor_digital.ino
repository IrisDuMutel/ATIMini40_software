
#include <Time.h>

const int IR_PIN = 2;  // IR sensor input pin

volatile unsigned int counter = 0;  // Counter variable for revolutions
unsigned long previousMillis = 0;  // Variable to store previous time
unsigned int rpm = 0;  // Variable to store RPM value



void IRinterrupt() {

  counter++;

}



void setup() {
  Serial.begin(115200);
  TCCR1A = 0;
  TCCR1B = 0;
  TCCR1B |= (1<<CS10);
  TIMSK1 |= (1<<TOIE1);
  pinMode(IR_PIN, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(IR_PIN), IRinterrupt, FALLING);
  

}



void loop() {

  unsigned long currentMillis = millis();


  if (currentMillis - previousMillis >= 1000) {
    detachInterrupt(digitalPinToInterrupt(IR_PIN));
    rpm = (counter / 2) * 60;  // Calculate RPM
    Serial.println(rpm);
    counter = 0;
    attachInterrupt(digitalPinToInterrupt(IR_PIN), IRinterrupt, FALLING);
    previousMillis = currentMillis;

  }

} 