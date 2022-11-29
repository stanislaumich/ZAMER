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
#define pinup 2
#define pindown 3

#define speed 115200

const int len = 10;
/*static*/ byte dataArray[len];

int bigstep,smallstep;
int Udes;
int Ucur;

void upoff(){
 digitalWrite(pinup,HIGH);
 dataArray[12] = 48;
}
void downoff(){
 digitalWrite(pindown,HIGH);
 dataArray[11] = 48;
}

void upon(){
 digitalWrite(pindown,HIGH);
 dataArray[11] = 48;
 digitalWrite(pinup,LOW);
 dataArray[12] = 49;
}
void downon(){
 digitalWrite(pinup,HIGH);
 dataArray[12] = 48;
 digitalWrite(pindown,LOW);
 dataArray[11] = 49;
}


void upstep(){
 upon();
 delay(dataArray[1]*100);
 upoff();
}

void downstep(){
 downon();
 delay(dataArray[1]*100);
 downoff();
}

void sendpacket(){
   Serial.write(dataArray,20);
}

void setup() {  
  Serial.begin(speed);
  pinMode(pinup,OUTPUT);
  upoff();
  pinMode(pindown,OUTPUT);
  downoff();
}

void loop() {

if (Serial.available() > 0) {
    Serial.readBytes(dataArray, len);
    }

  switch (dataArray[0]) {
  case 48:  sendpacket();break;
  case 49:  sendpacket();break;
  case 50:  sendpacket();break;
  case 51:  downoff(); upoff();sendpacket();break;
  case 52:  downon();sendpacket();break;
  case 53:  upon();sendpacket();break;
  
  case 55:  downstep();sendpacket();break;
  case 56:  upstep();sendpacket();break;


  }
  // очищаем чобы не слал постоянно а ждал запроса
  dataArray[0]=255;



}
