
#include <Time.h>

const int IR_PIN = 2;  // IR sensor input pin

volatile unsigned int counter = 0;  // Counter variable for revolutions
unsigned long previousMillis = 0;  // Variable to store previous time
unsigned int rpm = 0;  // Variable to store RPM value




void setup() {
  Serial.begin(115200);
  TCCR1A = 0; // Setting timer 1 control registers A and B to 0
  TCCR1B = 0;
  TCCR1B |= (1<<CS10);
  TIMSK1 |= (1<<TOIE1);
//  pinMode(IR_PIN, INPUT_PULLUP);
//  attachInterrupt(digitalPinToInterrupt(IR_PIN), IRinterrupt, FALLING);
  

}


// Counter overflow interrupt. Change occurrence by changing prescaler
ISR(TIMER1_OVF_vect){
  Serial.println(millis());
  }


void loop() {}
