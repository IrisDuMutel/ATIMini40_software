
#include <Time.h>

const int IR_PIN = 2;  // IR sensor input pin

volatile unsigned int counter = 0;  // Counter variable for revolutions
unsigned long previousMillis = 0;  // Variable to store previous time
unsigned long rpmtime;
unsigned long rpmtime2;
volatile float rpmfloat;
volatile float rpmfloat2;
unsigned int rpm;
unsigned int rpm2;
bool tooslow  = 1;
bool tooslow2 = 1;


void setup() {
  Serial.begin(115200);
  TCCR1A = 0; // Setting timer 1 control registers A and B to 0
  TCCR1B = 0;
  TCCR3A = 0;
  TCCR3B = 0;
  TCCR1B |= (1 << CS12); //Prescaler 256
  TCCR3B |= (1 << CS32); //Prescaler 256
//  TIMSK1 |= (1 << TOIE1); //enable timer overflow
//  TIMSK3 |= (1 << TOIE1); //enable timer overflow
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  attachInterrupt(digitalPinToInterrupt(2), RPM, FALLING);
  attachInterrupt(digitalPinToInterrupt(3), RPMM, FALLING);

}


// Counter overflow interrupt. Change occurrence by changing prescaler
//ISR(TIMER3_OVF_vect) {
//  tooslow = 1;
//}
// Counter overflow interrupt. Change occurrence by changing prescaler
//ISR(TIMER1_OVF_vect) {
//  tooslow2 = 1;
//}

void loop() {
  delay(500);
  rpmfloat = 60 / (rpmtime / 62500.00);
  rpm = round(rpmfloat);
  Serial.print("RPM1: ");
  Serial.println(rpm);
  rpmfloat2 = 60 / (rpmtime2 / 62500.00);
  rpm2 = round(rpmfloat2);
  Serial.print("RPM2: ");
  Serial.println(rpm2);
  
}
void RPMM () {
  rpmtime2 = TCNT3;
  TCNT3 = 0;
  tooslow2 = 0;
}

void RPM () {
  rpmtime = TCNT1;
  TCNT1 = 0;
  tooslow = 0;
}
