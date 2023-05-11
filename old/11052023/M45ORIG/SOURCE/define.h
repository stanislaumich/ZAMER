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
//--------------------- ���� ������, ������������ � ��������� ������
#define DATA_TYPE_DATA          100  // ������ (��� ��� ���)
#define DATA_TYPE_MESSAGES      103  // ������ (������ ���������)
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
// --------------------- ��������� ����� ������ ������ ���������� �� ��������
struct _DataFrame {
  double Vrema;         //  ����� � �������
  double OsnIzmVel;     //  �������� ���������� ��������
  double Temper; 				//  �����������
  double Skorost; 			//  ��������
  double Moschnost; 		//  ��������
  UCHAR Azimut;
};
// --------------------- ��������� ����� ������ ���������, ���������� �� ��������
struct _MessageFrame {
  double Vrema;
  char MessageCode;   // ��� ���������
};
//-----------------------------------------------------------------------------

