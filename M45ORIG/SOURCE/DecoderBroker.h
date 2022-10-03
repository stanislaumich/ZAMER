// ---------------------------------------------------------------------------
#ifndef DecoderBrokerH
#define DecoderBrokerH
// ---------------------------------------------------------------------------
typedef int(__stdcall*DATA_HANDLER)(int DataType, void *Zapis, void *PContext);
typedef unsigned __int64 UINT64;
// ---------------------------------------------------------------------------
bool EstDebug = false;
// -----------------------------------------------------------------------------
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
// --------------------- ���� ������, ������������ � ��������� ������
#define DATA_TYPE_DATA          100  // ������ (��� ��� ���)
#define DATA_TYPE_SPEED         101  // ������ (�������� � ��������)
#define DATA_TYPE_TEMPERATURA   102  // ������ (�����������)
#define DATA_TYPE_MESSAGES      103  // ������ (������ ���������)
#define DATA_TYPE_DISCONNECT    104  // ��������� � ������ ����� � ��������� ����
// --------------------- ���� ��������� (MessageNumber)
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
// #define MESSAGE_MARKER         12 // ������ �������
#define MESSAGE_VOSST_SYNCHRO    13 // ��������� "�������������� �������������"
// #define MESSAGE_TIME_ERROR     14
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
// --------------------- ���� ������, ������������ � ����� �� ������
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
// ---------------------------------------------------------------------------
#define  MAX_SENSOR_NUMBER       6

// --------------------- ��������� ����������� ����������
struct _SpecialParametrs {
	DWORD FilterType; // ��� �������
	float Popravka[MAX_SENSOR_NUMBER];
	DWORD SpeedMeasurementPeriod; // ������ ��������� ������� ��������
	unsigned short int AveragingFactor; // ����������� ����������
	bool VneshnDatchSkor; // ���� ������� ������ ��������
	bool ServerMode; // ����� �������
	int OwnServerBasePortNumber; // ����������� ������� ����� �����
	struct _ParamComPort *PParamComPort;
	char *ServerAddress;
	int AnotherServerBasePortNumber;
	UCHAR ServerChannelNumber;
	UCHAR ComPortNumber;
	UCHAR MODBUS_DeviceAddress;
};
#ifndef __DLL__

// --------------------- ��������� ���������� ���-�����
struct _ParamComPort {
	int BaudRate; // �������� �������� ������
	char BiteSize; // ����� ����� ������
	char Parity; // ����� �������� ��������
	char StopBits; // ����� �������� ���
};

// --------------------- ��������� ���������� ������
struct _SK {
	unsigned char ID_Datchik[3];
	UCHAR Temperature;
	UCHAR Korrect;
	unsigned short int K_Zub;
	UCHAR MaxSkorVr;
	UCHAR Date_Poverki[3];
	UCHAR Slug_Inf[49];
};

// --------------------- ��������� ����� ������ ������ ���������� �� ��������
struct _DataFrame {
	double Vrema;
	float OsnIzmVel[MAX_SENSOR_NUMBER];
	float Temper; // ��������� ����������� � ��������� �����!
	float Skorost; // )
	float Moschnost; // > �� ����������, ���� ������ ���� (������������)
	char Azimut; // )
};

// --------------------- ��������� ����� ������ ��������� ���������� �� ��������
struct _MessageFrame {
	double Vrema;
	char MessageCode; // ��� ���������
};
// --------------------- ������ ������, ������������� ��������� Read
#define KOLIZM_OUTPUT_STD 60  // ��� �26 � �36

// #define KOLIZM_OUTPUT_STD 12  // ��� �35
// #define KOLIZM_OUTPUT_STD 48  // ��� �37
union _Otvet {
	char KodSoob; // ����� - ��� ����������
	struct _SK Slug_Kanal; // ������ ���������� ������

	struct _MessageBuffer {
		unsigned char KodSoob; // ��� ������ (��� ���������)
		UINT64 TimeInt64;
		char Messages[50];
	} MessageBuffer;

	struct _GetCurrentTime { // ����� �� ������ ��� ������� ��������
		unsigned long TimeLow; // �����
		unsigned long TimeHigh; // �����
	} GetCurrentTimeStruct;

	struct _RB2 { // ������ ��� ������� READ_BASE2
		unsigned char KodSoob; // ��� ������ (��� ���������)
		unsigned int TimeLow; // ����� (������� �����)
		unsigned int TimeHigh; // ����� (������� �����)
		float MasOsnIzmVel[KOLIZM_OUTPUT_STD];
		// ������ �������� ��� ��� ��������
		unsigned char Count; // ����� �����
		unsigned char NQueue; // ����� �������
	} RB2;

	struct _Data { // ����� �� ������ ������
		unsigned int TimeLow; // �����
		unsigned int TimeHigh; // �����

		union _MeasuringData { // ������ ���������
			float OsnIzmVel; // ������ ��� ������� READ_BASE
			float Temper; // ������ ��� ������� READ_TEMPER

			struct _RS { // ������ ��� ������� READ_SPEED
				float Skorost;
				float Moschnost;
			} RS;

			struct _RC { // ������ ��� ������� READ_COMPLEX
				float OsnIzmVel;
				float Temper;
				float Skorost;
				float Moschnost;
			} RC;
		} MD;
	} Data;
};
#endif
// ---------------------------------------------------------------------------
#ifdef __DLL__
#define DLL_EI __declspec(dllexport)
#else
#define DLL_EI __declspec(dllimport)
#endif

// ---------------------------------------------------------------------------
class TDecoder;
// ---------------------------------------------------------------------------
extern "C" {
	DLL_EI void *DecoderCreate(int NKan, UCHAR DecoderType,
		DATA_HANDLER DataHandler, void *PContext,
		struct _SpecialParametrs *PSpecialParametrs);

	DLL_EI int DecoderOpen(void *PDecoder, bool DataStream);
	DLL_EI int DecoderClose(void *PDecoder);
	DLL_EI int DecoderGetCurrentTime(void *PDecoder,
		double *PDecoderCurrentTime);
	DLL_EI int DecoderSetCurrentTime(void *PDecoder, double DecoderCurrentTime);
	DLL_EI int DecoderSetParametrs(void *PDecoder,
		unsigned short AveragingFactor, DWORD SpeedMeasurementPeriod,
		float Popravka[MAX_SENSOR_NUMBER]);
	DLL_EI int DecoderReadTranducerParametrs(void *PDecoder,
		struct _SK *PTranducerParametrs, char *StrokaDatchikID);
	DLL_EI int DecoderGetMessage(void *PDecoder, char *PBuffer,
		DWORD *PrealSize);
	DLL_EI int DecoderReadBase(void *PDecoder, char *OtvetServera,
		DWORD *PBytesRead);
	DLL_EI int DecoderReadSpeed(void *PDecoder, char *OtvetServera,
		DWORD *PBytesRead);
	DLL_EI int DecoderReadTemperature(void *PDecoder, char *OtvetServera,
		DWORD *PBytesRead);
	DLL_EI int DecoderReadComplex(void *PDecoder, char *OtvetServera,
		DWORD *PBytesRead);
}
// ---------------------------------------------------------------------------
#endif
