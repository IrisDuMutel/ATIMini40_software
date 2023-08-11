
#include <Time.h>

const int IR_PIN = 2;  // IR sensor input pin

volatile unsigned int counter = 0;  // Counter variable for revolutions
unsigned long previousMillis = 0;  // Variable to store previous time
unsigned long rpmtime;
float rpmfloat;
unsigned int rpm;
bool tooslow = 1;


void setup() {
  Serial.begin(115200);
  TCCR1A = 0; // Setting timer 1 control registers A and B to 0
  TCCR1B = 0;
  TCCR1B |= (1 << CS12); //Prescaler 256
  TIMSK1 |= (1 << TOIE1); //enable timer overflow
  pinMode(2, INPUT);
  attachInterrupt(digitalPinToInterrupt(2), RPM, FALLING);

}


// Counter overflow interrupt. Change occurrence by changing prescaler
ISR(TIMER1_OVF_vect){
  tooslow = 1;
  }


void loop() {
  delay(1000);
  if (tooslow == 1) {
    Serial.println("SLOW!");
  }
  else {
    rpmfloat = 60 / (rpmtime/ 62500.00);
    rpm = round(rpmfloat);
    Serial.println(rpm);
  }}


void RPM () {
  rpmtime = TCNT1;
  TCNT1 = 0;
  tooslow = 0;
}
