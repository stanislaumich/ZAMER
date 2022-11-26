#include <Arduino.h>
// пакет 20 байт, 20 байт хватит всем!!!
/* описание пакета
0 - тип управления - 1 - контроллер, 2-2 компьютер, 3 - вырубить все реле, 4 - врубить реле минус, 5 - врубить реле плюс
1 - напряжение деленное на 10 а второй байт это единицы вольт 593 вольта это 59 в первом и 3 во втором
2 - эти 2 байта - желаемое напряжение
3 - десятки вольт а следующий единицы вольт, 384 вольта это 38 в первом байте и 4 во втором
4 - эти 2 байта - текущее напряжение
5 - малый шаг в сотнях миллисек, тогда 1000 мс записана как 10
6 - большой шаг аналогично малому, макс получается 25500 мсек=25,5 секунд
7 - вольты для большого шага, если разница между жел и текущ напряжением больше либо равна этого числа то большой шаг, иначе малый
8
9
10



*/
#define pinup 2
#define pindown 3


const int len = 20;
byte dataArray[len];

int bigstep,smallstep;
int Udes;
int Ucur;

void upon(){
 digitalWrite(pindown,HIGH); 
 digitalWrite(pinup,LOW);
}
void downon(){
 digitalWrite(pinup,HIGH); 
 digitalWrite(pindown,LOW);
}
void upoff(){
 digitalWrite(pinup,HIGH);
}
void downoff(){
 digitalWrite(pindown,HIGH);
}

void upstep(){


}

void downstep(){


}

void setup() {  
  Serial.begin(9600);
  pinMode(pinup,OUTPUT);
  upoff();
  pinMode(pindown,OUTPUT);
  downoff();
  Serial.print(1);
}

void loop() {

if (Serial.available() > 0) {
    Serial.readBytes(dataArray, len);
    }

  switch (dataArray[0]) {
  case 0: Serial.print(dataArray[0]); break;
  case 1: Serial.print(dataArray[0]); break;
  case 2: Serial.print(dataArray[0]); break;
  case 3: Serial.print(dataArray[0]); downoff(); upoff();break;
  case 4: Serial.print(dataArray[0]); downon();break;
  case 5: Serial.print(dataArray[0]); upon();break;
  }

}
