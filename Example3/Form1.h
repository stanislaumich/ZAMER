//-----------------------------------------------------------------------------
#pragma once

namespace Example3 {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

public ref class Form1 : public System::Windows::Forms::Form
{
public:
	Form1(void);
    ~Form1();

private:
    char *FormatOtobrajenia;
    int DecoderType;
    void *PDecoder;

    void ConnectClick(void); 
    void DisconnectClick(void);
    void CBDecoderTypeChange(void);

    System::Void CBDecoderType_SelectedIndexChanged(System::Object^  sender, System::EventArgs^  e); 
    System::Void BConnect_Click(System::Object^  sender, System::EventArgs^  e); 
    System::Void BDisconnect_Click(System::Object^  sender, System::EventArgs^  e);
    System::Void BClear_Click(System::Object^  sender, System::EventArgs^  e);
    System::Void BReadBase_Click(System::Object^  sender, System::EventArgs^  e);
    System::Void BReadSpeed_Click(System::Object^  sender, System::EventArgs^  e);
    System::Void BReadTemperature_Click(System::Object^  sender, System::EventArgs^ e);
    System::Void BReadComplex_Click(System::Object^  sender, System::EventArgs^  e);
    System::Void BReadMessage_Click(System::Object^  sender, System::EventArgs^  e);
    System::Void Form1_FormClosing(System::Object^  sender, System::Windows::Forms::FormClosingEventArgs^  e);
	
	System::Windows::Forms::Panel^  panel1;
	System::Windows::Forms::Label^  label1;
	System::Windows::Forms::TextBox^  EDatchikID;
	System::Windows::Forms::Label^  label3;
	System::Windows::Forms::TextBox^  STOsnIzmVel;
	System::Windows::Forms::Label^  label2;
	System::Windows::Forms::TextBox^  STTemper;
	System::Windows::Forms::Label^  label5;
	System::Windows::Forms::TextBox^  STMoschnost;
	System::Windows::Forms::Label^  label4;
	System::Windows::Forms::TextBox^  STSkorost;
	System::Windows::Forms::RichTextBox^  Memo1;
	System::Windows::Forms::Label^  label6;
	System::Windows::Forms::ComboBox^  CBDecoderType;
	System::Windows::Forms::Label^  LComPortNumber;
	System::Windows::Forms::Label^  LBaudRate;
	System::Windows::Forms::Label^  LUnitNumber;
	System::Windows::Forms::Label^  LServerAddress;
	System::Windows::Forms::Label^  LPortNumber;
	System::Windows::Forms::Label^  LAveragingFactor;
	System::Windows::Forms::NumericUpDown^  EComPortNumber;
	System::Windows::Forms::NumericUpDown^  EUnitNumber;
	System::Windows::Forms::NumericUpDown^  EPortNumber;
	System::Windows::Forms::NumericUpDown^  EAveragingFactor;
	System::Windows::Forms::TextBox^  EServerAddress;
	System::Windows::Forms::ComboBox^  CBBaudRate;
	System::Windows::Forms::Button^  BReadBase;
	System::Windows::Forms::Button^  BReadSpeed;
	System::Windows::Forms::Button^  BReadTemperature;
	System::Windows::Forms::Button^  BReadComplex;
	System::Windows::Forms::Button^  BReadMessage;
	System::Windows::Forms::Button^  BConnect;
	System::Windows::Forms::Button^  BDisconnect;
	System::Windows::Forms::Button^  BClear;
	/// “ребуетс€ переменна€ конструктора.
	System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// ќб€зательный метод дл€ поддержки конструктора - не измен€йте
		/// содержимое данного метода при помощи редактора кода.
		/// </summary>
		void InitializeComponent(void)
		{
			this->panel1 = (gcnew System::Windows::Forms::Panel());
			this->Memo1 = (gcnew System::Windows::Forms::RichTextBox());
			this->label5 = (gcnew System::Windows::Forms::Label());
			this->STMoschnost = (gcnew System::Windows::Forms::TextBox());
			this->label4 = (gcnew System::Windows::Forms::Label());
			this->STSkorost = (gcnew System::Windows::Forms::TextBox());
			this->label3 = (gcnew System::Windows::Forms::Label());
			this->STOsnIzmVel = (gcnew System::Windows::Forms::TextBox());
			this->label2 = (gcnew System::Windows::Forms::Label());
			this->STTemper = (gcnew System::Windows::Forms::TextBox());
			this->EDatchikID = (gcnew System::Windows::Forms::TextBox());
			this->label1 = (gcnew System::Windows::Forms::Label());
			this->label6 = (gcnew System::Windows::Forms::Label());
			this->CBDecoderType = (gcnew System::Windows::Forms::ComboBox());
			this->LComPortNumber = (gcnew System::Windows::Forms::Label());
			this->LBaudRate = (gcnew System::Windows::Forms::Label());
			this->LUnitNumber = (gcnew System::Windows::Forms::Label());
			this->LServerAddress = (gcnew System::Windows::Forms::Label());
			this->LPortNumber = (gcnew System::Windows::Forms::Label());
			this->LAveragingFactor = (gcnew System::Windows::Forms::Label());
			this->EComPortNumber = (gcnew System::Windows::Forms::NumericUpDown());
			this->EUnitNumber = (gcnew System::Windows::Forms::NumericUpDown());
			this->EPortNumber = (gcnew System::Windows::Forms::NumericUpDown());
			this->EAveragingFactor = (gcnew System::Windows::Forms::NumericUpDown());
			this->EServerAddress = (gcnew System::Windows::Forms::TextBox());
			this->CBBaudRate = (gcnew System::Windows::Forms::ComboBox());
			this->BReadBase = (gcnew System::Windows::Forms::Button());
			this->BReadSpeed = (gcnew System::Windows::Forms::Button());
			this->BReadTemperature = (gcnew System::Windows::Forms::Button());
			this->BReadComplex = (gcnew System::Windows::Forms::Button());
			this->BReadMessage = (gcnew System::Windows::Forms::Button());
			this->BConnect = (gcnew System::Windows::Forms::Button());
			this->BDisconnect = (gcnew System::Windows::Forms::Button());
			this->BClear = (gcnew System::Windows::Forms::Button());
			this->panel1->SuspendLayout();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->EComPortNumber))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->EUnitNumber))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->EPortNumber))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->EAveragingFactor))->BeginInit();
			this->SuspendLayout();
			// 
			// panel1
			// 
			this->panel1->Anchor = static_cast<System::Windows::Forms::AnchorStyles>(((System::Windows::Forms::AnchorStyles::Top | System::Windows::Forms::AnchorStyles::Bottom)
				| System::Windows::Forms::AnchorStyles::Left));
			this->panel1->BorderStyle = System::Windows::Forms::BorderStyle::FixedSingle;
			this->panel1->Controls->Add(this->Memo1);
			this->panel1->Controls->Add(this->label5);
			this->panel1->Controls->Add(this->STMoschnost);
			this->panel1->Controls->Add(this->label4);
			this->panel1->Controls->Add(this->STSkorost);
			this->panel1->Controls->Add(this->label3);
			this->panel1->Controls->Add(this->STOsnIzmVel);
			this->panel1->Controls->Add(this->label2);
			this->panel1->Controls->Add(this->STTemper);
			this->panel1->Controls->Add(this->EDatchikID);
			this->panel1->Controls->Add(this->label1);
			this->panel1->Location = System::Drawing::Point(0, 0);
			this->panel1->Name = L"panel1";
			this->panel1->Size = System::Drawing::Size(414, 487);
			this->panel1->TabIndex = 0;
			// 
			// Memo1
			// 
			this->Memo1->Anchor = static_cast<System::Windows::Forms::AnchorStyles>((((System::Windows::Forms::AnchorStyles::Top | System::Windows::Forms::AnchorStyles::Bottom)
				| System::Windows::Forms::AnchorStyles::Left)
				| System::Windows::Forms::AnchorStyles::Right));
			this->Memo1->BackColor = System::Drawing::SystemColors::Window;
			this->Memo1->Font = (gcnew System::Drawing::Font(L"Arial Narrow", 9.75F, System::Drawing::FontStyle::Regular, System::Drawing::GraphicsUnit::Point,
				static_cast<System::Byte>(204)));
			this->Memo1->Location = System::Drawing::Point(-1, 99);
			this->Memo1->Name = L"Memo1";
			this->Memo1->ReadOnly = true;
			this->Memo1->Size = System::Drawing::Size(414, 387);
			this->Memo1->TabIndex = 10;
			this->Memo1->Text = L"";
			// 
			// label5
			// 
			this->label5->Location = System::Drawing::Point(283, 38);
			this->label5->Name = L"label5";
			this->label5->Size = System::Drawing::Size(80, 17);
			this->label5->TabIndex = 9;
			this->label5->Text = L"Power";
			this->label5->TextAlign = System::Drawing::ContentAlignment::MiddleCenter;
			// 
			// STMoschnost
			// 
			this->STMoschnost->BackColor = System::Drawing::Color::Navy;
			this->STMoschnost->Font = (gcnew System::Drawing::Font(L"Courier New", 12, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point,
				static_cast<System::Byte>(204)));
			this->STMoschnost->ForeColor = System::Drawing::Color::Lime;
			this->STMoschnost->Location = System::Drawing::Point(263, 58);
			this->STMoschnost->Name = L"STMoschnost";
			this->STMoschnost->ReadOnly = true;
			this->STMoschnost->Size = System::Drawing::Size(120, 26);
			this->STMoschnost->TabIndex = 8;
			this->STMoschnost->TextAlign = System::Windows::Forms::HorizontalAlignment::Center;
			// 
			// label4
			// 
			this->label4->Location = System::Drawing::Point(127, 38);
			this->label4->Name = L"label4";
			this->label4->Size = System::Drawing::Size(121, 17);
			this->label4->TabIndex = 7;
			this->label4->Text = L"Rotation frequency";
			this->label4->TextAlign = System::Drawing::ContentAlignment::MiddleCenter;
			// 
			// STSkorost
			// 
			this->STSkorost->BackColor = System::Drawing::Color::Navy;
			this->STSkorost->Font = (gcnew System::Drawing::Font(L"Courier New", 12, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point,
				static_cast<System::Byte>(204)));
			this->STSkorost->ForeColor = System::Drawing::Color::Lime;
			this->STSkorost->Location = System::Drawing::Point(145, 58);
			this->STSkorost->Name = L"STSkorost";
			this->STSkorost->ReadOnly = true;
			this->STSkorost->Size = System::Drawing::Size(73, 26);
			this->STSkorost->TabIndex = 6;
			this->STSkorost->TextAlign = System::Windows::Forms::HorizontalAlignment::Center;
			// 
			// label3
			// 
			this->label3->Location = System::Drawing::Point(3, 38);
			this->label3->Name = L"label3";
			this->label3->Size = System::Drawing::Size(113, 17);
			this->label3->TabIndex = 5;
			this->label3->Text = L"Torque";
			this->label3->TextAlign = System::Drawing::ContentAlignment::MiddleCenter;
			// 
			// STOsnIzmVel
			// 
			this->STOsnIzmVel->BackColor = System::Drawing::Color::Navy;
			this->STOsnIzmVel->Font = (gcnew System::Drawing::Font(L"Courier New", 12, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point,
				static_cast<System::Byte>(204)));
			this->STOsnIzmVel->ForeColor = System::Drawing::Color::Lime;
			this->STOsnIzmVel->Location = System::Drawing::Point(20, 58);
			this->STOsnIzmVel->Name = L"STOsnIzmVel";
			this->STOsnIzmVel->ReadOnly = true;
			this->STOsnIzmVel->Size = System::Drawing::Size(73, 26);
			this->STOsnIzmVel->TabIndex = 4;
			this->STOsnIzmVel->TextAlign = System::Windows::Forms::HorizontalAlignment::Center;
			// 
			// label2
			// 
			this->label2->Location = System::Drawing::Point(226, 11);
			this->label2->Name = L"label2";
			this->label2->Size = System::Drawing::Size(74, 17);
			this->label2->TabIndex = 3;
			this->label2->Text = L"Temperature";
			this->label2->TextAlign = System::Drawing::ContentAlignment::MiddleCenter;
			// 
			// STTemper
			// 
			this->STTemper->BackColor = System::Drawing::Color::Navy;
			this->STTemper->Font = (gcnew System::Drawing::Font(L"Courier New", 12, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point,
				static_cast<System::Byte>(204)));
			this->STTemper->ForeColor = System::Drawing::Color::Lime;
			this->STTemper->Location = System::Drawing::Point(310, 8);
			this->STTemper->Name = L"STTemper";
			this->STTemper->ReadOnly = true;
			this->STTemper->Size = System::Drawing::Size(73, 26);
			this->STTemper->TabIndex = 2;
			this->STTemper->TextAlign = System::Windows::Forms::HorizontalAlignment::Center;
			// 
			// EDatchikID
			// 
			this->EDatchikID->BackColor = System::Drawing::SystemColors::Window;
			this->EDatchikID->Location = System::Drawing::Point(111, 8);
			this->EDatchikID->Name = L"EDatchikID";
			this->EDatchikID->ReadOnly = true;
			this->EDatchikID->Size = System::Drawing::Size(83, 20);
			this->EDatchikID->TabIndex = 1;
			// 
			// label1
			// 
			this->label1->Location = System::Drawing::Point(6, 10);
			this->label1->Name = L"label1";
			this->label1->Size = System::Drawing::Size(99, 17);
			this->label1->TabIndex = 0;
			this->label1->Text = L"Transducer ID";
			this->label1->TextAlign = System::Drawing::ContentAlignment::MiddleCenter;
			// 
			// label6
			// 
			this->label6->Location = System::Drawing::Point(430, 10);
			this->label6->Name = L"label6";
			this->label6->Size = System::Drawing::Size(90, 17);
			this->label6->TabIndex = 4;
			this->label6->Text = L"Decoder Type";
			this->label6->TextAlign = System::Drawing::ContentAlignment::MiddleLeft;
			// 
			// CBDecoderType
			// 
			this->CBDecoderType->FormattingEnabled = true;
			this->CBDecoderType->Items->AddRange(gcnew cli::array< System::Object^  >(13) {
				L"Decoder T26 (MODBUS)", L"Decoder T32 (RS-232)",
					L"Decoder T35 (USB)", L"Decoder T36 (MODBUS)", L"Decoder T37 (ETHERNET)", L"Decoder T42 (RS-232)", L"Decoder T45 (USB)", L"Decoder T46 (MODBUS)",
					L"Decoder Simulator", L"Indicator T42(USB)", L"Indicator T42(RS-232)", L"Indicator T42(RS-485)", L"Indicator T42(Ethernet)"
			});
			this->CBDecoderType->Location = System::Drawing::Point(523, 9);
			this->CBDecoderType->Name = L"CBDecoderType";
			this->CBDecoderType->Size = System::Drawing::Size(216, 21);
			this->CBDecoderType->TabIndex = 5;
			this->CBDecoderType->Text = L"Decoder T35 (USB)";
			this->CBDecoderType->SelectedIndexChanged += gcnew System::EventHandler(this, &Form1::CBDecoderType_SelectedIndexChanged);
			// 
			// LComPortNumber
			// 
			this->LComPortNumber->Location = System::Drawing::Point(430, 46);
			this->LComPortNumber->Name = L"LComPortNumber";
			this->LComPortNumber->Size = System::Drawing::Size(114, 17);
			this->LComPortNumber->TabIndex = 6;
			this->LComPortNumber->Text = L"COM port number";
			this->LComPortNumber->TextAlign = System::Drawing::ContentAlignment::MiddleLeft;
			// 
			// LBaudRate
			// 
			this->LBaudRate->Location = System::Drawing::Point(430, 81);
			this->LBaudRate->Name = L"LBaudRate";
			this->LBaudRate->Size = System::Drawing::Size(160, 17);
			this->LBaudRate->TabIndex = 7;
			this->LBaudRate->Text = L"Read/Write speed";
			this->LBaudRate->TextAlign = System::Drawing::ContentAlignment::MiddleLeft;
			// 
			// LUnitNumber
			// 
			this->LUnitNumber->Location = System::Drawing::Point(430, 110);
			this->LUnitNumber->Name = L"LUnitNumber";
			this->LUnitNumber->Size = System::Drawing::Size(160, 17);
			this->LUnitNumber->TabIndex = 8;
			this->LUnitNumber->Text = L"Unit number";
			this->LUnitNumber->TextAlign = System::Drawing::ContentAlignment::MiddleLeft;
			// 
			// LServerAddress
			// 
			this->LServerAddress->Location = System::Drawing::Point(430, 141);
			this->LServerAddress->Name = L"LServerAddress";
			this->LServerAddress->Size = System::Drawing::Size(160, 17);
			this->LServerAddress->TabIndex = 9;
			this->LServerAddress->Text = L"Server address";
			this->LServerAddress->TextAlign = System::Drawing::ContentAlignment::MiddleLeft;
			// 
			// LPortNumber
			// 
			this->LPortNumber->Location = System::Drawing::Point(430, 168);
			this->LPortNumber->Name = L"LPortNumber";
			this->LPortNumber->Size = System::Drawing::Size(160, 17);
			this->LPortNumber->TabIndex = 10;
			this->LPortNumber->Text = L"Base port number";
			this->LPortNumber->TextAlign = System::Drawing::ContentAlignment::MiddleLeft;
			// 
			// LAveragingFactor
			// 
			this->LAveragingFactor->Location = System::Drawing::Point(430, 200);
			this->LAveragingFactor->Name = L"LAveragingFactor";
			this->LAveragingFactor->Size = System::Drawing::Size(160, 17);
			this->LAveragingFactor->TabIndex = 11;
			this->LAveragingFactor->Text = L"Averaging factor";
			this->LAveragingFactor->TextAlign = System::Drawing::ContentAlignment::MiddleLeft;
			// 
			// EComPortNumber
			// 
			this->EComPortNumber->Location = System::Drawing::Point(630, 45);
			this->EComPortNumber->Name = L"EComPortNumber";
			this->EComPortNumber->Size = System::Drawing::Size(109, 20);
			this->EComPortNumber->TabIndex = 12;
			this->EComPortNumber->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			// 
			// EUnitNumber
			// 
			this->EUnitNumber->Location = System::Drawing::Point(630, 111);
			this->EUnitNumber->Name = L"EUnitNumber";
			this->EUnitNumber->Size = System::Drawing::Size(109, 20);
			this->EUnitNumber->TabIndex = 13;
			this->EUnitNumber->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			// 
			// EPortNumber
			// 
			this->EPortNumber->Location = System::Drawing::Point(630, 168);
			this->EPortNumber->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 9999, 0, 0, 0 });
			this->EPortNumber->Name = L"EPortNumber";
			this->EPortNumber->Size = System::Drawing::Size(109, 20);
			this->EPortNumber->TabIndex = 14;
			this->EPortNumber->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 4000, 0, 0, 0 });
			// 
			// EAveragingFactor
			// 
			this->EAveragingFactor->Location = System::Drawing::Point(630, 200);
			this->EAveragingFactor->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1000, 0, 0, 0 });
			this->EAveragingFactor->Name = L"EAveragingFactor";
			this->EAveragingFactor->Size = System::Drawing::Size(109, 20);
			this->EAveragingFactor->TabIndex = 15;
			this->EAveragingFactor->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			// 
			// EServerAddress
			// 
			this->EServerAddress->BackColor = System::Drawing::SystemColors::Window;
			this->EServerAddress->Location = System::Drawing::Point(596, 139);
			this->EServerAddress->Name = L"EServerAddress";
			this->EServerAddress->Size = System::Drawing::Size(143, 20);
			this->EServerAddress->TabIndex = 16;
			this->EServerAddress->Text = L"T37E";
			// 
			// CBBaudRate
			// 
			this->CBBaudRate->FormattingEnabled = true;
			this->CBBaudRate->Items->AddRange(gcnew cli::array< System::Object^  >(5) { L"9600", L"19200", L"38400", L"57600", L"115200" });
			this->CBBaudRate->Location = System::Drawing::Point(630, 78);
			this->CBBaudRate->Name = L"CBBaudRate";
			this->CBBaudRate->Size = System::Drawing::Size(109, 21);
			this->CBBaudRate->TabIndex = 17;
			this->CBBaudRate->Text = L"115200";
			// 
			// BReadBase
			// 
			this->BReadBase->Location = System::Drawing::Point(632, 252);
			this->BReadBase->Name = L"BReadBase";
			this->BReadBase->Size = System::Drawing::Size(106, 28);
			this->BReadBase->TabIndex = 18;
			this->BReadBase->Text = L"ReadBase";
			this->BReadBase->UseVisualStyleBackColor = true;
			this->BReadBase->Click += gcnew System::EventHandler(this, &Form1::BReadBase_Click);
			// 
			// BReadSpeed
			// 
			this->BReadSpeed->Location = System::Drawing::Point(632, 295);
			this->BReadSpeed->Name = L"BReadSpeed";
			this->BReadSpeed->Size = System::Drawing::Size(106, 28);
			this->BReadSpeed->TabIndex = 19;
			this->BReadSpeed->Text = L"ReadSpeed";
			this->BReadSpeed->UseVisualStyleBackColor = true;
			this->BReadSpeed->Click += gcnew System::EventHandler(this, &Form1::BReadSpeed_Click);
			// 
			// BReadTemperature
			// 
			this->BReadTemperature->Location = System::Drawing::Point(632, 342);
			this->BReadTemperature->Name = L"BReadTemperature";
			this->BReadTemperature->Size = System::Drawing::Size(106, 28);
			this->BReadTemperature->TabIndex = 20;
			this->BReadTemperature->Text = L"ReadTemperature";
			this->BReadTemperature->UseVisualStyleBackColor = true;
			this->BReadTemperature->Click += gcnew System::EventHandler(this, &Form1::BReadTemperature_Click);
			// 
			// BReadComplex
			// 
			this->BReadComplex->Location = System::Drawing::Point(632, 392);
			this->BReadComplex->Name = L"BReadComplex";
			this->BReadComplex->Size = System::Drawing::Size(106, 28);
			this->BReadComplex->TabIndex = 21;
			this->BReadComplex->Text = L"ReadComplex";
			this->BReadComplex->UseVisualStyleBackColor = true;
			this->BReadComplex->Click += gcnew System::EventHandler(this, &Form1::BReadComplex_Click);
			// 
			// BReadMessage
			// 
			this->BReadMessage->Location = System::Drawing::Point(632, 441);
			this->BReadMessage->Name = L"BReadMessage";
			this->BReadMessage->Size = System::Drawing::Size(106, 28);
			this->BReadMessage->TabIndex = 22;
			this->BReadMessage->Text = L"ReadMessage";
			this->BReadMessage->UseVisualStyleBackColor = true;
			this->BReadMessage->Click += gcnew System::EventHandler(this, &Form1::BReadMessage_Click);
			// 
			// BConnect
			// 
			this->BConnect->ForeColor = System::Drawing::SystemColors::ControlText;
			this->BConnect->Location = System::Drawing::Point(456, 252);
			this->BConnect->Name = L"BConnect";
			this->BConnect->Size = System::Drawing::Size(106, 28);
			this->BConnect->TabIndex = 23;
			this->BConnect->Text = L"Create+Open";
			this->BConnect->UseVisualStyleBackColor = true;
			this->BConnect->Click += gcnew System::EventHandler(this, &Form1::BConnect_Click);
			// 
			// BDisconnect
			// 
			this->BDisconnect->Location = System::Drawing::Point(456, 295);
			this->BDisconnect->Name = L"BDisconnect";
			this->BDisconnect->Size = System::Drawing::Size(106, 28);
			this->BDisconnect->TabIndex = 24;
			this->BDisconnect->Text = L"Close";
			this->BDisconnect->UseVisualStyleBackColor = true;
			this->BDisconnect->Click += gcnew System::EventHandler(this, &Form1::BDisconnect_Click);
			// 
			// BClear
			// 
			this->BClear->Location = System::Drawing::Point(456, 441);
			this->BClear->Name = L"BClear";
			this->BClear->Size = System::Drawing::Size(106, 28);
			this->BClear->TabIndex = 25;
			this->BClear->Text = L"Clear";
			this->BClear->UseVisualStyleBackColor = true;
			this->BClear->Click += gcnew System::EventHandler(this, &Form1::BClear_Click);
			// 
			// Form1
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(758, 484);
			this->Controls->Add(this->BClear);
			this->Controls->Add(this->BDisconnect);
			this->Controls->Add(this->BConnect);
			this->Controls->Add(this->BReadMessage);
			this->Controls->Add(this->BReadComplex);
			this->Controls->Add(this->BReadTemperature);
			this->Controls->Add(this->BReadSpeed);
			this->Controls->Add(this->BReadBase);
			this->Controls->Add(this->CBBaudRate);
			this->Controls->Add(this->EServerAddress);
			this->Controls->Add(this->EAveragingFactor);
			this->Controls->Add(this->EPortNumber);
			this->Controls->Add(this->EUnitNumber);
			this->Controls->Add(this->EComPortNumber);
			this->Controls->Add(this->LAveragingFactor);
			this->Controls->Add(this->LPortNumber);
			this->Controls->Add(this->LServerAddress);
			this->Controls->Add(this->LUnitNumber);
			this->Controls->Add(this->LBaudRate);
			this->Controls->Add(this->LComPortNumber);
			this->Controls->Add(this->CBDecoderType);
			this->Controls->Add(this->label6);
			this->Controls->Add(this->panel1);
			this->Name = L"Form1";
			this->StartPosition = System::Windows::Forms::FormStartPosition::CenterScreen;
			this->Text = L"Example3";
			this->FormClosing += gcnew System::Windows::Forms::FormClosingEventHandler(this, &Form1::Form1_FormClosing);
			this->Load += gcnew System::EventHandler(this, &Form1::Form1_Load);
			this->panel1->ResumeLayout(false);
			this->panel1->PerformLayout();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->EComPortNumber))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->EUnitNumber))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->EPortNumber))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->EAveragingFactor))->EndInit();
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
  private: System::Void Form1_Load(System::Object^  sender, System::EventArgs^  e) {
  }
};
}

