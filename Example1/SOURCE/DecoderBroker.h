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
#define USB_INDICATOR                 15
#define COMPORT_INDICATOR             16
#define MODBUS_INDICATOR              17
#define ETHERNET_INDICATOR            18
// --------------------- Types of data transmitted in streaming mode
#define DATA_TYPE_DATA            100 // Data (as amended)
#define DATA_TYPE_SPEED           101 // Data (speed and power)
#define DATA_TYPE_TEMPERATURA     102 // Data (temperature)
#define DATA_TYPE_MESSAGES        103 // Data (message array)
#define DATA_TYPE_DISCONNECT      104 // Report loss of connection on the local network
// --------------------- Message Codes (MessageNumber)
#define MESSAGE_SBOI_SYNCHRO      1 // Message "Sync failed"
#define MESSAGE_POLUCHEN_ID       2 // Message "service information received!"
#define MESSAGE_OSHIBKA_ID        3 // Message "service information does not match the old"
#define MESSAGE_DATCHIK_OFF       4 // Sensor disconnected
#define MESSAGE_DATCHIK_ON        5 // Sensor connected
#define MESSAGE_DECODER_OFF       6 // Decoder disconnected
#define MESSAGE_DECODER_ON        7 // Decoder connected
#define MESSAGE_ISKAJENIA         8 // Transmission-distortion
#define MESSAGE_OSHIBKA_IO        9 // I / O Error
#define MESSAGE_NET_PAUSY         10 // There is no pause in reception
#define MESSAGE_NETWORK_OFF       11 // No network access
// # define MESSAGE_MARKER          12 // Time Marker
#define MESSAGE_VOSST_SYNCHRO     13 // Message "Restore Sync"
// # define MESSAGE_TIME_ERROR      14
#define MESSAGE_BUFFER_LOSS       15 // Loss of data buffer
#define MESSAGE_EEPROM_WRITE      16 // Successfully complete writing to EEPROM
#define MESSAGE_EEPROM_ERROR      17 // Error writing to EEPROM
#define MESSAGE_ALGORITM_ERROR1   18 // Algorithm Error
#define MESSAGE_MESSAGEQ_OVERFL   19 // The message queue was full
#define MESSAGE_INPUT_TIMEOUT     20 // No response to the request
#define MESSAGE_DEBUG1            21 // No calls to AddSourceBuffer
#define MESSAGE_DEBUG2            22 // Violation of block numbering in the decoder
#define MESSAGE_DEBUG3            23 // Violation of block numbering in the program
#define MESSAGE_ALGORITM_ERROR2   24 // Algorithm Error
#define MESSAGE_ALGORITM_ERROR3   25 // Algorithm Error
#define MESSAGE_VOSST_ERROR2      26
#define MESSAGE_CLIENT_START      27 // A new client has connected
#define MESSAGE_CLIENT_STOP       28 // Client disconnected
#define MESSAGE_SERVER_OFF        29 // Server disconnected
#define MESSAGE_SERVER_ON         30 // Server connected
// --------------------- Error codes returned in response to a request
#define RET_CODE_SUCCESS          0 // Successful completion
#define RET_CODE_DECODER_OFF      1 // Decoder not available
#define RET_CODE_TRANSDUCER_OFF   2 // Sensor not available
#define RET_CODE_IO_ERROR         3 // I / O Error
#define RET_CODE_DATA_DISTORSION  4 // Data distortion
#define RET_CODE_PAUSE_NIL        5 // There is no pause in reception
#define RET_CODE_NET_INACCESSIBLE 6 // No network access
#define RET_CODE_NIL 7 //
#define RET_CODE_INPUT_TIMEOUT    8 // No data
#define RET_CODE_SERVER_OFF       9 // Server disconnected
#define RET_CODE_SERVER_IO_ERROR  10 // I / O Error with Server
#define RET_CODE_SERVER_TIMEOUT   11 // Timeout when reading from the server
#define RET_CODE_END_POTOK        44 // Request to exit the stream
#define RET_CODE_KOMMAND_ERR      101 // Invalid command
#define RET_CODE_CHECKSUM_ERR     102 // Invalid checksum
#define RET_CODE_NODATA           103 // No data
// ---------------------------------------------------------------------------
#define  MAX_SENSOR_NUMBER        6

// --------------------- Structure of special parameters
struct _SpecialParametrs {
	DWORD FilterType; // Filter Type
	float Popravka[MAX_SENSOR_NUMBER];
	DWORD SpeedMeasurementPeriod; // Period of measurement of speed
	unsigned short int AveragingFactor; // Averaging coefficient
	bool VneshnDatchSkor; // There is an external speed sensor
	bool ServerMode; // server mode
	int OwnServerBasePortNumber; // Own base port number
	struct _ParamComPort * PParamComPort;
	char * ServerAddress;
	int AnotherServerBasePortNumber;
	UCHAR ServerChannelNumber;
	UCHAR ComPortNumber;
	UCHAR MODBUS_DeviceAddress;
	char EthernetProtocolType;
};
#ifndef __DLL__

// --------------------- The structure of the parameters of the Som port
struct _ParamComPort {
	int BaudRate; // data rate
	char BiteSize; // number of data bits
	char Parity; // parity scheme
	char StopBits; // number of stop bits
};

// --------------------- Service channel structure
struct _SK {
	unsigned char ID_Datchik[3];
	UCHAR Temperature;
	UCHAR Korrect;
	unsigned short int K_Zub;
	UCHAR MaxSkorVr;
	UCHAR Date_Poverki[3];
	UCHAR Slug_Inf[49];
};

// --------------------- The structure of one data record received from the decoder
struct _DataFrame {
	double Vrema;
	float OsnIzmVel[MAX_SENSOR_NUMBER];
	float Temper;
	// The position of the temperature in the structure is important!
	float Skorost; // )
	float Moschnost; // > Not transmitted if the force sensor (non-spinning)
	char Azimut; // )
};

// --------------------- The structure of one message record received from the decoder
struct _MessageFrame {
	double Vrema;
	char MessageCode; // Message Code
};
// --------------------- The format of the buffer returned by Read commands
#define KOLIZM_OUTPUT_STD 60 // For T26 and T36

// # define KOLIZM_OUTPUT_STD 12 // For T35
// # define KOLIZM_OUTPUT_STD 48 // For T37
union _Otvet {
	char KodSoob; // Answer - exit code
	struct _SK Slug_Kanal; // Service channel data

	struct _MessageBuffer {
		unsigned char KodSoob; // data type (message code)
		UINT64 TimeInt64;
		char Messages[50];
	} MessageBuffer;

	struct _GetCurrentTime { // Response to the decoder tech time request
		unsigned long TimeLow; // time
		unsigned long TimeHigh; // time
	} GetCurrentTimeStruct;

	struct _RB2 { // Data for the READ_BASE2 command
		unsigned char KodSoob; // data type (message code)
		unsigned int TimeLow; // time (junior part)
		unsigned int TimeHigh; // time (oldest part)
		float MasOsnIzmVel[KOLIZM_OUTPUT_STD]; // Array of values
		unsigned char Count; // block number
		unsigned char NQueue; // queue number
	} RB2;

	struct _Data { // Response to the data request
		unsigned int TimeLow; // time
		unsigned int TimeHigh; // time

		union _MeasuringData { // Measurement data
			float OsnIzmVel; // Data for the READ_BASE command
			float Temper; // Data for the READ_TEMPER command

			struct _RS { // Data for the READ_SPEED command
				float Skorost;
				float Moschnost;
			} RS;

			struct _RC { // Data for the READ_COMPLEX command
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
