#include <Arduino.h>
#define F_CPU 16000000UL  


#include <Arduino.h>

#define pinup 3
#define pindown 2
#define speed 115200
#define pinbeep 9


int inChar;

void beep(int t1,int t2){
  #ifdef pinbeep
   unsigned long h;
   h=millis();
   while (millis()-h<(unsigned int)(t1)){
    digitalWrite(pinbeep,HIGH);
    delayMicroseconds(t2);
    digitalWrite(pinbeep,LOW);
    delayMicroseconds(t2);
   }
   digitalWrite(pinbeep,LOW);
  #endif
 }
void shortbeep(void){
  beep(50,100);
 }
void longbeep(void){
  beep(250,1000);
 }
void dshortbeep(void){
  shortbeep();
  delay(50);
  shortbeep(); 
 } 


void upoff(){
 digitalWrite(pinup,HIGH);
}
void downoff(){
 digitalWrite(pindown,HIGH);
}
void upon(){
 digitalWrite(pinup,LOW);
}
void downon(){
 digitalWrite(pindown,LOW);
}

void setup() {  
  Serial.begin(speed);
  pinMode(pinup,OUTPUT);
  upoff();  
  pinMode(pindown,OUTPUT);
  downoff();
  pinMode(pinbeep,OUTPUT);
  beep(250,1000);
}

void loop() {
if (Serial.available()) {
 inChar = Serial.read();
 Serial.write(inChar);
}
  switch (inChar) {
  case 48:  upoff();downoff();Serial.print("0");inChar = 255;break;
  case 49:  upoff();downon();Serial.print("1");inChar = 255;break;
  case 50:  downoff();upon();Serial.print("2");inChar = 255;break;
  case 51:  longbeep();Serial.print("3");inChar = 255;break;
  case 52:  longbeep();Serial.print("4");inChar = 255;break;
  case 53:  longbeep();Serial.print("5");inChar = 255;break;
  }
}
