#include <Arduino.h>
// пакет 20 байт, 20 байт хватит всем!!!
/* описание пакета
0 - тип управления - 1 - контроллер, 2-2 компьютер, 3 - вырубить все реле, 4 - врубить реле минус, 
    5 - врубить реле плюс, 6 -получить состояние контроллера
1 - 
2 - 
3 - 
4 - 

5 - 
6 - 

7 - 
8 - 
9 - 
10- 
*/
#define pinup 3
#define pindown 2
#define speed 115200

int inChar;

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

//void sendpacket(){
//   Serial.write(dataArray,len);/
//}

void setup() {  
  Serial.begin(speed);
  pinMode(pinup,OUTPUT);
  upoff();  
  pinMode(pindown,OUTPUT);
  downoff();
  /*
  upon();
  delay(1000);
  downon();
  delay(1000);
  upoff();
  delay(1000);
  downoff();
  */
}

void loop() {

if (Serial.available()) {
 inChar = Serial.read();
}
  switch (inChar) {
  case 48:  upoff();downoff();Serial.print("0");inChar = 255;break;
  case 49:  downon();Serial.print("1");inChar = 255;break;
  case 50:  upon();Serial.print("2");inChar = 255;break;
  case 51:  Serial.print("3");inChar = 255;break;
  }
  // очищаем чобы не слал постоянно а ждал запроса
  //dataArray[0]=255;



}
