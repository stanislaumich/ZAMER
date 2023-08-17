#include <windows.h>

// констатнты скоростей приема-передачи данных
#define BaudRate_110  			CBR_110
#define BaudRate_300 			CBR_300
#define BaudRate_600  			CBR_600
#define BaudRate_1200 	          	CBR_1200
#define BaudRate_2400           	CBR_2400
#define BaudRate_4800           	CBR_4800
#define BaudRate_9600           	CBR_9600
#define BaudRate_14400          	CBR_14400
#define BaudRate_19200          	CBR_19200
#define BaudRate_38400          	CBR_38400
#define BaudRate_56000          	CBR_56000
#define BaudRate_57600          	CBR_57600
#define BaudRate_115200 		CBR_115200
#define BaudRate_128000         	CBR_128000
#define BaudRate_256000 	        CBR_256000

// число информационных бит в передаваемом - принимаемом символе
#define    Data5Bit                     5
#define    Data6Bit                     6
#define    Data7Bit                     7
#define    Data8Bit                     8

// константы четности
#define    NonParity                    0
#define    OddParity                    1
#define    EvenParity                   2
#define    MarkParity                   3
#define    SpaceParity                  4

// количество стоповых битов
#define    OneStopBit                   0
#define    One5StopBit                  1
#define    TwoStopBit                   2

// размер буферов приема - передачи
#define    SizeBuffer 			2048

//  онстанты тайм-аутов в миллисекундах
#define    TimeoutInterval    10
              // максимальный интервал между двум€ символами
#define    TimeoutChar        1
             // максимальное врем€ на прин€тие одного символа
#define    TimeOutWait        100
             // максимальное врем€ ожидани€ посылки



class MSerial
{
   public:

      boolean Open(wchar_t *port/*char port[]*/, DWORD BaudRate, BYTE ByteSize,
                                                BYTE Parity, BYTE StopBits);
      // возвращает TRUE если порт открылс€ нормально

      void Close(void);

      void ResetRB(void); // очистка буфера приема
      void ResetWB(void); // очистка буфера передачи

      unsigned short Read(BYTE *buffer, unsigned short numbytes);
      // возвращает количество считанных байт
      unsigned short Write(BYTE *buffer, unsigned short numbytes);
      // возвращает количество переданных байт

      unsigned short MSerial::GetRBSize(void);
      // возвращает число прин€тых символов в буфере приема
      // (еще не считанных функцией Read)
      unsigned short GetWBSize(void);
      // возвращает число еще не переданных символов в буфере передачи

   private:

      HANDLE           handle;
      COMMTIMEOUTS     CommTimeOuts;
      DCB              dcb;
      COMSTAT          ComState;
      OVERLAPPED       Overlap;

};


boolean MSerial::Open(wchar_t *port /*char port[]*/, DWORD BaudRate, BYTE ByteSize,
                                                   BYTE Parity, BYTE StopBits)
{

	handle = CreateFile
                    (
                     port,
                     GENERIC_READ | GENERIC_WRITE,
                     NULL,
                     NULL,
                     OPEN_EXISTING,
                     FILE_FLAG_OVERLAPPED,
                     NULL
                    );

    if(handle == INVALID_HANDLE_VALUE) {return FALSE; }
    if(!SetupComm(handle, SizeBuffer, SizeBuffer)) {return FALSE; }
    if(!GetCommState(handle, &dcb)) {return FALSE; }

    dcb.BaudRate           = BaudRate;
    dcb.fBinary            = TRUE;
    dcb.fOutxCtsFlow       = FALSE;
    dcb.fOutxDsrFlow       = FALSE;
    dcb.fDtrControl        = DTR_CONTROL_DISABLE;
    dcb.fDsrSensitivity    = FALSE;
    dcb.fNull              = FALSE;
    dcb.fRtsControl        = RTS_CONTROL_DISABLE;
    dcb.fAbortOnError      = FALSE;
    dcb.ByteSize           = ByteSize;
    dcb.Parity	           = Parity;
    dcb.StopBits           = StopBits;

    if(!SetCommState(handle, &dcb)){return FALSE; }
    if(!GetCommTimeouts(handle, &CommTimeOuts)) {return FALSE; }

    CommTimeOuts.ReadIntervalTimeout         = TimeoutInterval;
    CommTimeOuts.ReadTotalTimeoutMultiplier  = TimeoutChar;
    CommTimeOuts.ReadTotalTimeoutConstant    = TimeOutWait;
    CommTimeOuts.WriteTotalTimeoutMultiplier = 0;
    CommTimeOuts.WriteTotalTimeoutConstant   = 0;

    if(!SetCommTimeouts(handle, &CommTimeOuts)) {return FALSE; }

    ResetRB();
    ResetWB();
    return TRUE;
};

void MSerial::Close(void)
{
    CloseHandle(handle);
}

unsigned short MSerial::Read(BYTE *buffer, unsigned short numbytes)
{
    DWORD temp;
    ClearCommError(handle, &temp, &ComState);
    if (!temp)
    {
        boolean result=ReadFile(handle,buffer, numbytes, &temp, &Overlap);
        if(result)
        {
           return (unsigned short)temp;
        }
    }
    return 0;
}

unsigned short MSerial::Write(BYTE *buffer, unsigned short numbytes)
{
    DWORD temp;
    if(numbytes)
    {
        ClearCommError(handle, &temp, &ComState);
		boolean result=WriteFile(handle, buffer, numbytes, &temp, &Overlap);
        if(result)
        {
           return (unsigned short)temp;
        }
    }
    return 0;
}

void MSerial::ResetRB(void)
{
    PurgeComm(handle, PURGE_RXCLEAR);
}

void MSerial::ResetWB(void)
{
    PurgeComm(handle, PURGE_TXCLEAR);
}

unsigned short MSerial::GetWBSize(void)
{
   DWORD temp;
   ClearCommError(handle, &temp, &ComState);
   return (unsigned short) ComState.cbOutQue;
}

unsigned short MSerial::GetRBSize(void)
{
   DWORD temp;
   ClearCommError(handle, &temp, &ComState);
   return (unsigned short) ComState.cbInQue;
}


