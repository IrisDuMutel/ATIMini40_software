
#include <Time.h>

const int IR_PIN1 = 2;  // IR sensor input pin
const int IR_PIN2 = 3;  // IR sensor input pin
const int IR_PIN3 = 18;  // IR sensor input pin
unsigned long actualMillis = 0;  // Variable to store previous time
unsigned long previousMillis = 0;  // Variable to store previous time
float timeee;
unsigned long rpmtime1;
unsigned long rpmtime2;
unsigned long rpmtime3;
volatile float rpmfloat1;
volatile float rpmfloat2;
volatile float rpmfloat3;
float rpm1;
float rpm2;
float rpm3;
int potValue;  // value from the analog pin



void setup() {
  Serial.begin(115200);
//  TCCR1A = 0; // Setting timer 1 control registers A and B to 0
//  TCCR1B = 0;
//  TCCR3A = 0;
//  TCCR3B = 0;
//  TCCR4A = 0;
//  TCCR4B = 0;
//    TCCR1B |= (1 << CS12); //Prescaler 256
//  TCCR3B |= (1 << CS32); //Prescaler 256
//  TCCR4B |= (1 << CS42); //Prescaler 256
//  TIMSK1 |= (1 << TOIE1); //enable timer overflow
//  TIMSK3 |= (1 << TOIE3); //enable timer overflow
//  TIMSK4 |= (1 << TOIE4); //enable timer overflow
//  ESC.attach(9); // (pin, min pulse width, max pulse width in microseconds) 
//  ESC.writeMicroseconds(800); //initialize the signal to 800
  pinMode(IR_PIN1, INPUT);
  pinMode(IR_PIN2, INPUT);
  pinMode(IR_PIN3, INPUT);
  attachInterrupt(digitalPinToInterrupt(IR_PIN1), RPM1, FALLING);
  attachInterrupt(digitalPinToInterrupt(IR_PIN2), RPM2, FALLING);
  attachInterrupt(digitalPinToInterrupt(IR_PIN3), RPM3, FALLING);

}



void loop() {
  delay(1000);
  noInterrupts();
  actualMillis = millis();
  timeee = (actualMillis - previousMillis);
  rpmfloat1 = 60000 * (rpmtime1/timeee);
  rpm1 = rpmfloat1;
  rpmfloat2 = 1000 * (rpmtime2/timeee);
  rpm2 = rpmfloat2;
  rpmfloat3 = 1000 * (rpmtime3/timeee);
  rpm3 = rpmfloat3;
  rpmtime1 = 0;
  rpmtime2 = 0;
  rpmtime3 = 0;
  Serial.print(timeee, 5);
  Serial.print("RPM: ");
  Serial.println(rpm1);
  Serial.print(", ");
  Serial.print(rpm2);
  Serial.print(", ");
  Serial.println(rpm3);
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

// Counter overflow interrupt. Change occurrence by changing prescaler
//ISR(TIMER1_OVF_vect){
//  rpmtime1 = 0;
//  rpmtime2 = 0;
//  rpmtime3 = 0;
//  }
