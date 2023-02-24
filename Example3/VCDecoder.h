//-----------------------------------------------------------------------------
typedef int (__stdcall *DATA_HANDLER) (int DataType,void *Zapis,void *PContext);
typedef unsigned __int64 UINT64;
typedef unsigned long DWORD;
typedef unsigned char UCHAR;
//--------------------- Типы декодеров
#define USB_DECODER                   0
#define MODBUS_DECODER                1
#define COMPORT_DECODER               2
#define REMOTE_DECODER                3
#define SIMULATOR_DECODER             4
#define ETHERNET_DECODER_T37          5
#define USB_DECODER_T35               6
#define MODBUS_DECODER_T36            7
#define COMPORT_DECODER_T32           8
#define COMPORT_DECODER_T42           9
#define USB_DECODER_T45               10
#define MODBUS_DECODER_T46            11
#define USB_INDICATOR                 15
#define COMPORT_INDICATOR             16
#define MODBUS_INDICATOR              17
#define ETHERNET_INDICATOR            18
//--------------------- Типы данных, передаваемых в потоковом режиме
#define DATA_TYPE_DATA          100  // Данные (осн изм вел)
#define DATA_TYPE_SPEED         101  // Данные (скорость и мощность)
#define DATA_TYPE_TEMPERATURA   102  // Данные (температура)
#define DATA_TYPE_MESSAGES      103  // Данные (массив сообщений)
#define DATA_TYPE_DISCONNECT    104  // Сообщение о потере связи в локальной сети
//--------------------- Коды сообщений (MessageNumber)
#define MESSAGE_SBOI_SYNCHRO      1 // Сообщение "Сбой синхронизации"
#define MESSAGE_POLUCHEN_ID       2 // Сообщение "получена служебная информация!"
#define MESSAGE_OSHIBKA_ID        3 // Сообщение "служебная информация не совпадает со старой"
#define MESSAGE_DATCHIK_OFF       4 // Датчик отключился
#define MESSAGE_DATCHIK_ON        5 // Датчик подключился
#define MESSAGE_DECODER_OFF       6 // Декодер отключился
#define MESSAGE_DECODER_ON        7 // Декодер подключился
#define MESSAGE_ISKAJENIA         8 // Искажения приема-передачи
#define MESSAGE_OSHIBKA_IO        9 // Ошибка ввода-вывода
#define MESSAGE_NET_PAUSY        10 // Нет паузы в приеме
#define MESSAGE_NETWORK_OFF      11 // Нет доступа к сети
#define MESSAGE_VOSST_SYNCHRO    13 // Сообщение "Восстановление синхронизации"
#define MESSAGE_BUFFER_LOSS      15 // Потеря буфера данных
#define MESSAGE_EEPROM_WRITE     16 // Успешное завершение записи в EEPROM
#define MESSAGE_EEPROM_ERROR     17 // Ошибка при записи в EEPROM
#define MESSAGE_ALGORITM_ERROR1  18 // Ошибка алгоритма
#define MESSAGE_MESSAGEQ_OVERFL  19 // Была переполнена очередь сообщений
#define MESSAGE_INPUT_TIMEOUT    20 // Нет ответа на запрос
#define MESSAGE_DEBUG1           21 // Нет обращений к AddSourceBuffer
#define MESSAGE_DEBUG2           22 // Нарушение нумерации блоков в декодере
#define MESSAGE_DEBUG3           23 // Нарушение нумерации блоков в программе
#define MESSAGE_ALGORITM_ERROR2  24 // Ошибка алгоритма
#define MESSAGE_ALGORITM_ERROR3  25 // Ошибка алгоритма
#define MESSAGE_VOSST_ERROR2     26
#define MESSAGE_CLIENT_START     27 // Подключился новый клиент
#define MESSAGE_CLIENT_STOP      28 // Клиент отключиося
#define MESSAGE_SERVER_OFF       29 // Сервер отключился
#define MESSAGE_SERVER_ON        30 // Сервер подключился
//--------------------- Коды ошибок, возвращаемых в ответ на запрос
#define RET_CODE_SUCCESS          0 // Успешное завершение
#define RET_CODE_DECODER_OFF      1 // Декодер недоступен
#define RET_CODE_TRANSDUCER_OFF   2 // Датчик  недоступен
#define RET_CODE_IO_ERROR         3 // Ошибка ввода-вывода
#define RET_CODE_DATA_DISTORSION  4 // Искажение данных
#define RET_CODE_PAUSE_NIL        5 // Нет паузы в приеме
#define RET_CODE_NET_INACCESSIBLE 6 // Нет доступа к сети
#define RET_CODE_NIL              7 // 
#define RET_CODE_INPUT_TIMEOUT    8 // Нет данных
#define RET_CODE_SERVER_OFF       9 // Сервер отключился
#define RET_CODE_SERVER_IO_ERROR 10 // Ошибка ввода-вывода с Сервером
#define RET_CODE_SERVER_TIMEOUT  11 // Таймаут при чтении с сервера
#define RET_CODE_END_POTOK       44 // Запрошен выход из потока
#define RET_CODE_KOMMAND_ERR    101 // Неверная команда
#define RET_CODE_CHECKSUM_ERR   102 // Неверная контрольная сумма
#define RET_CODE_NODATA         103 // Нет данных
//---------------------------------------------------------------------------
#define  MAX_SENSOR_NUMBER       6
#pragma pack(1)
//--------------------- Структура специальных параметров
struct _SpecialParametrs {
  DWORD FilterType;                   // Тип фильтра
  float Popravka[MAX_SENSOR_NUMBER];  // Поправка основной изм. величины
  DWORD SpeedMeasurementPeriod;       // Период измерения частоты вращения 
  unsigned short int AveragingFactor; // Коэффициент усреднения 
  bool  VneshnDatchSkor;              // Есть внешний датчик скорости
  bool  ServerMode;                   // Режим сервера 
  int   OwnServerBasePortNumber;      // Собственный базовый номер порта
  struct _ParamComPort *PParamComPort;// Параметры COM-порта 
  char *ServerAddress;                // Адрес сервера
  int   AnotherServerBasePortNumber;  // Номер базового порта другого сервера
  UCHAR ServerChannelNumber;          // Номер канала сервера 
  UCHAR ComPortNumber;                // Номер COM-порта 
  UCHAR MODBUS_DeviceAddress;         // Номер устройства в сети MODBUS
};
//--------------------- Структура параметров Сом-порта
struct _ParamComPort {
 int  BaudRate;   // скорость передачи данных
 char BiteSize;   // число битов данных
 char Parity;     // схема контроля четности
 char StopBits;   // число стоповых бит
};
//--------------------- Структура служебного канала
struct _SK {
  unsigned char ID_Datchik[3];
  UCHAR Temperature;
  UCHAR Korrect;
  unsigned short int K_Zub;
  UCHAR MaxSkorVr;
  UCHAR Date_Poverki[3];
  UCHAR Slug_Inf[49];
};
//--------------------- Структура одной записи данных полученной от декодера в потоковом режиме
struct _DataFrame {
  double Vrema;
  float OsnIzmVel[MAX_SENSOR_NUMBER];
  float Temper;    // Положение температуры в структуре важно!
  float Skorost;   // )
  float Moschnost; // > Не передается, если датчик силы (некрутящийся)
  char  Azimut;    // )
};
//--------------------- Структура одной записи сообщений полученной от декодера в потоковом режиме
struct _MessageFrame {
  double Vrema;
  char MessageCode;   // Код сообщения
};
//--------------------- Формат буфера, возвращаемого командами чтения
union _Otvet {
  char KodSoob;                // Ответ - код завершения
  struct _SK Slug_Kanal;       // Данные служебного канала
  struct _MessageBuffer {      // Ответ на запрос ReadMessage
    unsigned char KodSoob;     // тип данных = 103
    UINT64 TimeInt64;          // время
    char Messages[1];          // Массив кодов сообщений (от 1 до 50) 
  } MessageBuffer;
  struct _GetCurrentTime {     // Ответ на запрос тек времени декодера
    UINT64 TimeInt64;          // время
  } GetCurrentTimeStruct;
  struct _Data {               // Ответ на другие запросы данных
    UINT64 TimeInt64;          // время
    union _MeasuringData {     // Данные измерений
      float  OsnIzmVel;        // Данные для команды READ_BASE
      float  Temper;           // Данные для команды READ_TEMPER
      struct _RS {             // Данные для команды READ_SPEED
        float  Skorost;        // Скорость
        float  Moschnost;      // Мощность
      } RS;
      struct _RC {             // Данные для команды READ_COMPLEX
        float  OsnIzmVel;      // основная измеренная величина (момент или сила
        float  Temper;         // Температура  
        float  Skorost;        // Скорость   
        float  Moschnost;      // Мощность
      } RC;
    } MD;
  } Data;
};
#pragma pack()
//------------------------------------------------------------------------------
typedef void *(*DECODER_CREATE)( int NKan,
                            UCHAR DecoderType,
                            DATA_HANDLER DataHandler,
                            void *PContext,
                            struct _SpecialParametrs *PSpecialParametrs);

typedef int (*DECODER_OPEN)(void *PDecoder, bool DataStream);
typedef int (*DECODER_READ_TRANSDUCER_PARAM)(void *PDecoder,struct _SK *PTranducerParametrs,char *StrokaDatchikID);
typedef int (*DECODER_SET_CURRENT_TIME)(void *PDecoder, UINT64 DecoderCurrentTime);
typedef int (*DECODER_GET_CURRENT_TIME)(void *PDecoder, UINT64 *PDecoderCurrentTime);
typedef int (*DECODER_SET_PARAMETRS)(void *PDecoder, unsigned short AveragingFactor,DWORD SpeedMeasurementPeriod,float Popravka[MAX_SENSOR_NUMBER]);
typedef int (*DECODER_GET_MESSAGE)(void *PDecoder,char *PBuffer,DWORD *PrealSize);
typedef int (*DECODER_READ_BASE)(void *PDecoder,char *OtvetServera,DWORD *PBytesRead);
typedef int (*DECODER_READ_SPEED)(void *PDecoder,char *OtvetServera,DWORD *PBytesRead);
typedef int (*DECODER_READ_TEMPERATURE)(void *PDecoder,char *OtvetServera,DWORD *PBytesRead);
typedef int (*DECODER_READ_COMPLEX)(void *PDecoder,char *OtvetServera,DWORD *PBytesRead);
//typedef int (*DECODER_READ_BASE2)(void *PDecoder,char *OtvetServera,DWORD *PBytesRead);
typedef int (*DECODER_CLOSE)(void *PDecoder);
//------------------------------------------------------------------------------
void *GetEntryPointAddress(HMODULE HM, LPCSTR EntryPointName);
DATA_HANDLER DataHandlerAddress;
//------------------------------------------------------------------------------
#ifdef VCDECODER_EXPORTS
#define VCDECODER_API extern "C" __declspec(dllexport)
#else
#define VCDECODER_API extern "C" __declspec(dllimport)
#endif

VCDECODER_API void * __cdecl DecoderCreate(int NKan,
                                      UCHAR DecoderType,
                                      DATA_HANDLER DataHandler,
                                      void *PContext,
                                      struct _SpecialParametrs *PSpecialParametrs);

VCDECODER_API int __cdecl DecoderOpen(void *PDecoder, bool DataStream);
VCDECODER_API int __cdecl DecoderClose(void *PDecoder);
VCDECODER_API int __cdecl DecoderGetCurrentTime(void *PDecoder, UINT64 *PDecoderCurrentTime);
VCDECODER_API int __cdecl DecoderSetCurrentTime(void *PDecoder, UINT64 DecoderCurrentTime);
VCDECODER_API int __cdecl DecoderSetParametrs(void *PDecoder, unsigned short AveragingFactor0,DWORD SpeedMeasurementPeriod0,
                                              float Popravka0[MAX_SENSOR_NUMBER]);
VCDECODER_API int __cdecl DecoderReadTranducerParametrs(void *PDecoder,struct _SK *PTranducerParametrs,char *StrokaDatchikID);
VCDECODER_API int __cdecl DecoderGetMessage(void *PDecoder,char *PBuffer,DWORD *PrealSize);
VCDECODER_API int __cdecl DecoderReadBase(void *PDecoder,char *OtvetServera,DWORD *PBytesRead);
VCDECODER_API int __cdecl DecoderReadSpeed(void *PDecoder,char *OtvetServera, DWORD *PBytesRead);
VCDECODER_API int __cdecl DecoderReadTemperature(void *PDecoder,char *OtvetServera, DWORD *PBytesRead);
VCDECODER_API int __cdecl DecoderReadComplex(void *PDecoder,char *OtvetServera, DWORD *PBytesRead);
//VCDECODER_API int __cdecl DecoderReadBase2(void *PDecoder,char *OtvetServera,DWORD *PBytesRead);
//------------------------------------------------------------------------------
