#include <Arduino.h>
#define F_CPU 16000000UL  // указываем частоту в герцах


#include <Arduino.h>
// пакет 20 байт, 20 байт хватит всем!!!
/* описание пакета
0 - тип управления - 1 - контроллер, 2-2 компьютер, 3 - вырубить все реле, 4 - врубить реле минус, 
    5 - врубить реле плюс, 6 -получить состояние контроллера
 
*/
#define pinup 2
#define pindown 3
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
  }
  // очищаем чобы не слал постоянно а ждал запроса
  //dataArray[0]=255;



}
