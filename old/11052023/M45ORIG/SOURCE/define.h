//-----------------------------------------------------------------------------
#define USB_DECODER       		0
#define MODBUS_DECODER    		1
#define COM_DECODER       		2
#define REMOTE_DECODER    		3
#define SIMULATOR_DECODER			4
#define ETHERNET_DECODER_T37 	5
#define USB_DECODER_T35		  	6
#define MODBUS_DECODER_T36  	7
#define COM_DECODER_T32	    	8
#define NIL_DECODER      	    9
//--------------------- Типы данных, передаваемых в потоковом режиме
#define DATA_TYPE_DATA          100  // Данные (осн изм вел)
#define DATA_TYPE_MESSAGES      103  // Данные (массив сообщений)
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
/// ---------------------------------------------------------------------------
class TDecoder;
// ---------------------------------------------------------------------------
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
  double Vrema;         //  время в деодере
  double OsnIzmVel;     //  основная измеряемая величина
  double Temper; 				//  температура
  double Skorost; 			//  скорость
  double Moschnost; 		//  мощность
  UCHAR Azimut;
};
// --------------------- Структура одной записи сообщений, полученной от декодера
struct _MessageFrame {
  double Vrema;
  char MessageCode;   // Код сообщения
};
//-----------------------------------------------------------------------------

