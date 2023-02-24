//-----------------------------------------------------------------------------
typedef int (__stdcall *DATA_HANDLER) (int DataType,void *Zapis,void *PContext);
typedef unsigned __int64 UINT64;
typedef unsigned long DWORD;
typedef unsigned char UCHAR;
//--------------------- ���� ���������
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
//--------------------- ���� ������, ������������ � ��������� ������
#define DATA_TYPE_DATA          100  // ������ (��� ��� ���)
#define DATA_TYPE_SPEED         101  // ������ (�������� � ��������)
#define DATA_TYPE_TEMPERATURA   102  // ������ (�����������)
#define DATA_TYPE_MESSAGES      103  // ������ (������ ���������)
#define DATA_TYPE_DISCONNECT    104  // ��������� � ������ ����� � ��������� ����
//--------------------- ���� ��������� (MessageNumber)
#define MESSAGE_SBOI_SYNCHRO      1 // ��������� "���� �������������"
#define MESSAGE_POLUCHEN_ID       2 // ��������� "�������� ��������� ����������!"
#define MESSAGE_OSHIBKA_ID        3 // ��������� "��������� ���������� �� ��������� �� ������"
#define MESSAGE_DATCHIK_OFF       4 // ������ ����������
#define MESSAGE_DATCHIK_ON        5 // ������ �����������
#define MESSAGE_DECODER_OFF       6 // ������� ����������
#define MESSAGE_DECODER_ON        7 // ������� �����������
#define MESSAGE_ISKAJENIA         8 // ��������� ������-��������
#define MESSAGE_OSHIBKA_IO        9 // ������ �����-������
#define MESSAGE_NET_PAUSY        10 // ��� ����� � ������
#define MESSAGE_NETWORK_OFF      11 // ��� ������� � ����
#define MESSAGE_VOSST_SYNCHRO    13 // ��������� "�������������� �������������"
#define MESSAGE_BUFFER_LOSS      15 // ������ ������ ������
#define MESSAGE_EEPROM_WRITE     16 // �������� ���������� ������ � EEPROM
#define MESSAGE_EEPROM_ERROR     17 // ������ ��� ������ � EEPROM
#define MESSAGE_ALGORITM_ERROR1  18 // ������ ���������
#define MESSAGE_MESSAGEQ_OVERFL  19 // ���� ����������� ������� ���������
#define MESSAGE_INPUT_TIMEOUT    20 // ��� ������ �� ������
#define MESSAGE_DEBUG1           21 // ��� ��������� � AddSourceBuffer
#define MESSAGE_DEBUG2           22 // ��������� ��������� ������ � ��������
#define MESSAGE_DEBUG3           23 // ��������� ��������� ������ � ���������
#define MESSAGE_ALGORITM_ERROR2  24 // ������ ���������
#define MESSAGE_ALGORITM_ERROR3  25 // ������ ���������
#define MESSAGE_VOSST_ERROR2     26
#define MESSAGE_CLIENT_START     27 // ����������� ����� ������
#define MESSAGE_CLIENT_STOP      28 // ������ ����������
#define MESSAGE_SERVER_OFF       29 // ������ ����������
#define MESSAGE_SERVER_ON        30 // ������ �����������
//--------------------- ���� ������, ������������ � ����� �� ������
#define RET_CODE_SUCCESS          0 // �������� ����������
#define RET_CODE_DECODER_OFF      1 // ������� ����������
#define RET_CODE_TRANSDUCER_OFF   2 // ������  ����������
#define RET_CODE_IO_ERROR         3 // ������ �����-������
#define RET_CODE_DATA_DISTORSION  4 // ��������� ������
#define RET_CODE_PAUSE_NIL        5 // ��� ����� � ������
#define RET_CODE_NET_INACCESSIBLE 6 // ��� ������� � ����
#define RET_CODE_NIL              7 // 
#define RET_CODE_INPUT_TIMEOUT    8 // ��� ������
#define RET_CODE_SERVER_OFF       9 // ������ ����������
#define RET_CODE_SERVER_IO_ERROR 10 // ������ �����-������ � ��������
#define RET_CODE_SERVER_TIMEOUT  11 // ������� ��� ������ � �������
#define RET_CODE_END_POTOK       44 // �������� ����� �� ������
#define RET_CODE_KOMMAND_ERR    101 // �������� �������
#define RET_CODE_CHECKSUM_ERR   102 // �������� ����������� �����
#define RET_CODE_NODATA         103 // ��� ������
//---------------------------------------------------------------------------
#define  MAX_SENSOR_NUMBER       6
#pragma pack(1)
//--------------------- ��������� ����������� ����������
struct _SpecialParametrs {
  DWORD FilterType;                   // ��� �������
  float Popravka[MAX_SENSOR_NUMBER];  // �������� �������� ���. ��������
  DWORD SpeedMeasurementPeriod;       // ������ ��������� ������� �������� 
  unsigned short int AveragingFactor; // ����������� ���������� 
  bool  VneshnDatchSkor;              // ���� ������� ������ ��������
  bool  ServerMode;                   // ����� ������� 
  int   OwnServerBasePortNumber;      // ����������� ������� ����� �����
  struct _ParamComPort *PParamComPort;// ��������� COM-����� 
  char *ServerAddress;                // ����� �������
  int   AnotherServerBasePortNumber;  // ����� �������� ����� ������� �������
  UCHAR ServerChannelNumber;          // ����� ������ ������� 
  UCHAR ComPortNumber;                // ����� COM-����� 
  UCHAR MODBUS_DeviceAddress;         // ����� ���������� � ���� MODBUS
};
//--------------------- ��������� ���������� ���-�����
struct _ParamComPort {
 int  BaudRate;   // �������� �������� ������
 char BiteSize;   // ����� ����� ������
 char Parity;     // ����� �������� ��������
 char StopBits;   // ����� �������� ���
};
//--------------------- ��������� ���������� ������
struct _SK {
  unsigned char ID_Datchik[3];
  UCHAR Temperature;
  UCHAR Korrect;
  unsigned short int K_Zub;
  UCHAR MaxSkorVr;
  UCHAR Date_Poverki[3];
  UCHAR Slug_Inf[49];
};
//--------------------- ��������� ����� ������ ������ ���������� �� �������� � ��������� ������
struct _DataFrame {
  double Vrema;
  float OsnIzmVel[MAX_SENSOR_NUMBER];
  float Temper;    // ��������� ����������� � ��������� �����!
  float Skorost;   // )
  float Moschnost; // > �� ����������, ���� ������ ���� (������������)
  char  Azimut;    // )
};
//--------------------- ��������� ����� ������ ��������� ���������� �� �������� � ��������� ������
struct _MessageFrame {
  double Vrema;
  char MessageCode;   // ��� ���������
};
//--------------------- ������ ������, ������������� ��������� ������
union _Otvet {
  char KodSoob;                // ����� - ��� ����������
  struct _SK Slug_Kanal;       // ������ ���������� ������
  struct _MessageBuffer {      // ����� �� ������ ReadMessage
    unsigned char KodSoob;     // ��� ������ = 103
    UINT64 TimeInt64;          // �����
    char Messages[1];          // ������ ����� ��������� (�� 1 �� 50) 
  } MessageBuffer;
  struct _GetCurrentTime {     // ����� �� ������ ��� ������� ��������
    UINT64 TimeInt64;          // �����
  } GetCurrentTimeStruct;
  struct _Data {               // ����� �� ������ ������� ������
    UINT64 TimeInt64;          // �����
    union _MeasuringData {     // ������ ���������
      float  OsnIzmVel;        // ������ ��� ������� READ_BASE
      float  Temper;           // ������ ��� ������� READ_TEMPER
      struct _RS {             // ������ ��� ������� READ_SPEED
        float  Skorost;        // ��������
        float  Moschnost;      // ��������
      } RS;
      struct _RC {             // ������ ��� ������� READ_COMPLEX
        float  OsnIzmVel;      // �������� ���������� �������� (������ ��� ����
        float  Temper;         // �����������  
        float  Skorost;        // ��������   
        float  Moschnost;      // ��������
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
