#include <Arduino.h>

// Терминальный генератор меандра от 1 Гц до 8 Мгц
// Автор dimax 2017 год
// Записать скетч в arduino
// Запустить терминал. Установить скорость 9600.
// Из терминала послать требуемую частоту в герцах. Только цифру.
// В ответ в терминал будет выведена частота в герцах.
// D9 и GND - выход генератора частоты.
void setup() {
Serial.begin(9600);
pinMode (9,OUTPUT); // выход генератора
TCCR1A=0;TCCR1B=0;
}
void loop() {
static uint32_t reqfreq=0; //переменная запроса частоты
uint32_t ocr=OCR1A;  uint16_t divider=1;  float freq;
if (Serial.available() > 0){ reqfreq = Serial.parseInt();
if (reqfreq==0 || reqfreq>F_CPU/2) {return;}
 ocr = (F_CPU / reqfreq /2 /divider);
  byte shifts[] = {3,3,2,2};
   for(byte i = 0; i < 4; i++){
     if (ocr > 65536) { divider <<= shifts[i];
       ocr = F_CPU / reqfreq /2 /divider; }
      else { TCCR1B = (i+1)|(1<<WGM12);  break; }  } //Mode4 (CTC)
     OCR1A=ocr-1; TCCR1A=1<<COM1A0;
    freq= (float) F_CPU/2 / (OCR1A+1) /divider;
  Serial.print(freq,3);Serial.println(" Hz ");
 }
}