#include <Arduino.h>

#define RX_Data_size 7

char RX_Data[RX_Data_size];
byte RX_i = 0;
int i = 0;
byte command;


void setup() {
  Serial.begin(57600);
  Serial.setTimeout(500);
}

void sendspeed(){
 RX_Data[0] = 0x2;
 RX_Data[1] = 0x30;
 RX_Data[2] = 0x2E;
 RX_Data[3] = 0x33;
 RX_Data[4] = 0x30;
 RX_Data[5] = 0x30;
 RX_Data[6] = 0x3;
 for (int i=0;i<7;i++){
  Serial.write(RX_Data[i]);
  RX_Data[i]=0;
 }
 
}

void loop () {

if (Serial.available() > 0) {
        RX_Data[i]=Serial.read();
        i++;
    } 

if(i==4){
 i = 0;
  Serial.flush();
 //if(RX_Data[0]==0xFF&&RX_Data[1]==2&&RX_Data[3]==3)
 {
  command = RX_Data[2];
  switch(command){
   case 0x4A: sendspeed();break;

  } 

 }
 /*for(int x=0;x<4;x++)
  {
   Serial.write(RX_Data[x]);
  }*/
  
}


/*
    byte b;
int n = 0;

while(Serial.available()){
  RX_Data[n] = Serial.read();
  n+=1;
  if (n>3) break;
}    
/*
for (char n = 0; n < 4; n++)
{
   while( !Serial.available()) ; // Ждём, данные получим
   RX_Data[n] = Serial.read();

}
*/
  ////////////////////////////////////////////  $FF$02$4A$03
  //if(RX_i == 0) {
  /* for(int i=0;i<=3;i++){
    Serial.write(RX_Data[i]);
   }*/
  //}
   //////////////////////////////////////////
  /*
  for (int x = 0; x <= RX_Data_size - 1; x++) 
      RX_Data[x] = 0;
   Serial.flush();
   */
  }