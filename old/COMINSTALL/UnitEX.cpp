#include "mserial.h"
.....................................

    // ��� �������� ����������������� ������� ������ MSerial
    // �� ������ ������ ��������� ������ �������� TxD � RxD
    // �� ���� �� ����� � ��������� � �������� ���������

    char bufin[100];
    MSerial Comport;
    // ������� ���� COM1 �� �������� 115200 ���, 8 ��� ������, 1 �������� ���
    // ��� �������� �� ��������
    if(Comport.Open("COM1", BaudRate_115200, Data8Bit, NonParity, OneStopBit))
    {
       Comport.Write("������! ���� ��� ����!\0",25);
       Comport.Read(bufin,25);
       MessageBox(NULL, bufin, "�������� ���������" , MB_OK);
       // �������� ������ ��� ��������� ������ :)
       Comport.ResetRB();
       Comport.ResetWB();
       Comport.Close();
    }
      else MessageBox(NULL, "COM1 ���������� �������!", "������!" , MB_OK);
