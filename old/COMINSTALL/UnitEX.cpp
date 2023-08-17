#include "mserial.h"
.....................................

    // ƒл€ проверки работоспособности данного класса MSerial
    // вы можете просто соеденить выходы компорта TxD и RxD
    // то есть вы сразу и отправите и получите сообщение

    char bufin[100];
    MSerial Comport;
    // откроем порт COM1 на скорости 115200 бод, 8 бит данных, 1 стоповый бит
    // нет проверки на четность
    if(Comport.Open("COM1", BaudRate_115200, Data8Bit, NonParity, OneStopBit))
    {
       Comport.Write("ѕривет! ѕишу сам себе!\0",25);
       Comport.Read(bufin,25);
       MessageBox(NULL, bufin, "ѕолучено сообщение" , MB_OK);
       // почистим буферы дл€ красивого выхода :)
       Comport.ResetRB();
       Comport.ResetWB();
       Comport.Close();
    }
      else MessageBox(NULL, "COM1 невозможно открыть!", "ќшибка!" , MB_OK);
