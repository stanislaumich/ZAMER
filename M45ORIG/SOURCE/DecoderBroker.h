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
// --------------------- Типы данных, передаваемых в потоковом режиме
#define DATA_TYPE_DATA          100  // Данные (осн изм вел)
#define DATA_TYPE_SPEED         101  // Данные (скорость и мощность)
#define DATA_TYPE_TEMPERATURA   102  // Данные (температура)
#define DATA_TYPE_MESSAGES      103  // Данные (массив сообщений)
#define DATA_TYPE_DISCONNECT    104  // Сообщение о потере связи в локальной сети
// --------------------- Коды сообщений (MessageNumber)
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
// #define MESSAGE_MARKER         12 // Маркер времени
#define MESSAGE_VOSST_SYNCHRO    13 // Сообщение "Восстановление синхронизации"
// #define MESSAGE_TIME_ERROR     14
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
// --------------------- Коды ошибок, возвращаемых в ответ на запрос
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
// ---------------------------------------------------------------------------
#define  MAX_SENSOR_NUMBER       6

// --------------------- Структура специальных параметров
struct _SpecialParametrs {
	DWORD FilterType; // Тип фильтра
	float Popravka[MAX_SENSOR_NUMBER];
	DWORD SpeedMeasurementPeriod; // Период измерения частоты вращения
	unsigned short int AveragingFactor; // Коэффициент усреднения
	bool VneshnDatchSkor; // Есть внешний датчик скорости
	bool ServerMode; // Режим сервера
	int OwnServerBasePortNumber; // Собственный базовый номер порта
	struct _ParamComPort *PParamComPort;
	char *ServerAddress;
	int AnotherServerBasePortNumber;
	UCHAR ServerChannelNumber;
	UCHAR ComPortNumber;
	UCHAR MODBUS_DeviceAddress;
};
#ifndef __DLL__

// --------------------- Структура параметров Сом-порта
struct _ParamComPort {
	int BaudRate; // скорость передачи данных
	char BiteSize; // число битов данных
	char Parity; // схема контроля четности
	char StopBits; // число стоповых бит
};

// --------------------- Структура служебного канала
struct _SK {
	unsigned char ID_Datchik[3];
	UCHAR Temperature;
	UCHAR Korrect;
	unsigned short int K_Zub;
	UCHAR MaxSkorVr;
	UCHAR Date_Poverki[3];
	UCHAR Slug_Inf[49];
};

// --------------------- Структура одной записи данных полученной от декодера
struct _DataFrame {
	double Vrema;
	float OsnIzmVel[MAX_SENSOR_NUMBER];
	float Temper; // Положение температуры в структуре важно!
	float Skorost; // )
	float Moschnost; // > Не передается, если датчик силы (некрутящийся)
	char Azimut; // )
};

// --------------------- Структура одной записи сообщений полученной от декодера
struct _MessageFrame {
	double Vrema;
	char MessageCode; // Код сообщения
};
// --------------------- Формат буфера, возвращаемого командами Read
#define KOLIZM_OUTPUT_STD 60  // Для Т26 и Т36

// #define KOLIZM_OUTPUT_STD 12  // Для Т35
// #define KOLIZM_OUTPUT_STD 48  // Для Т37
union _Otvet {
	char KodSoob; // Ответ - код завершения
	struct _SK Slug_Kanal; // Данные служебного канала

	struct _MessageBuffer {
		unsigned char KodSoob; // тип данных (код сообщения)
		UINT64 TimeInt64;
		char Messages[50];
	} MessageBuffer;

	struct _GetCurrentTime { // Ответ на запрос тек времени декодера
		unsigned long TimeLow; // время
		unsigned long TimeHigh; // время
	} GetCurrentTimeStruct;

	struct _RB2 { // Данные для команды READ_BASE2
		unsigned char KodSoob; // тип данных (код ссобщения)
		unsigned int TimeLow; // время (младшая часть)
		unsigned int TimeHigh; // время (старшая часть)
		float MasOsnIzmVel[KOLIZM_OUTPUT_STD];
		// Массив значений осн изм величины
		unsigned char Count; // Номер блока
		unsigned char NQueue; // Номер очереди
	} RB2;

	struct _Data { // Ответ на запрос данных
		unsigned int TimeLow; // время
		unsigned int TimeHigh; // время

		union _MeasuringData { // Данные измерений
			float OsnIzmVel; // Данные для команды READ_BASE
			float Temper; // Данные для команды READ_TEMPER

			struct _RS { // Данные для команды READ_SPEED
				float Skorost;
				float Moschnost;
			} RS;

			struct _RC { // Данные для команды READ_COMPLEX
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
