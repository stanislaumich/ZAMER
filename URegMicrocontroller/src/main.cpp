#include <Arduino.h>
// пакет 20 байт, 20 байт хватит всем!!!
/* описание пакета
0 - тип управления - 1 - контроллер, 2-2 компьютер, 3 - вырубить все реле, 4 - врубить реле минус, 
    5 - врубить реле плюс, 6 -получить состояние контроллера
1 - напряжение деленное на 10 а второй байт это единицы вольт 593 вольта это 59 в первом и 3 во втором
2 - эти 2 байта - желаемое напряжение

3 - десятки вольт а следующий единицы вольт, 384 вольта это 38 в первом байте и 4 во втором
4 - эти 2 байта - текущее напряжение

5 - малый шаг в сотнях миллисек, тогда 1000 мс записана как 10
6 - большой шаг аналогично малому, макс получается 25500 мсек=25,5 секунд

7 - вольты для большого шага, если разница между жел и текущ напряжением больше либо равна этого числа то большой шаг, иначе малый

8 - 
9 - 
10- 

11- состояние реле минус 0 или 1 тут данные по принятой команде либо текущему состоянию
12- состояние реле плюс 0 или 1


*/
#define pinup 2
#define pindown 3


const int len = 20;
static byte dataArray[len];

int bigstep,smallstep;
int Udes;
int Ucur;

void upon(){
 digitalWrite(pindown,HIGH); 
 digitalWrite(pinup,LOW);
 dataArray[12] = 1;
}
void downon(){
 digitalWrite(pinup,HIGH); 
 digitalWrite(pindown,LOW);
 dataArray[11] = 1;
}
void upoff(){
 digitalWrite(pinup,HIGH);
 dataArray[12] = 0;
}
void downoff(){
 digitalWrite(pindown,HIGH);
 dataArray[11] = 0;
}

void upstep(){

}

void downstep(){

}

void sendpacket(){
  //for(int i=0;i<19;i++){
   Serial.write(dataArray,20);
  //}
  //Serial.print("12345678901234567890");
}

void setup() {  
  Serial.begin(9600);
  pinMode(pinup,OUTPUT);
  upoff();
  pinMode(pindown,OUTPUT);
  downoff();
  //Serial.print(1);
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

  }
  dataArray[0]=255;
  //for(int i=0;i<19;i++){
  // dataArray[i]=0;
  //}
}
