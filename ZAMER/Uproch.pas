unit Uproch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFProch = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    CheckBox2: TCheckBox;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    Label5: TLabel;
    CheckBox4: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QTemp: TFDQuery;
    QInsProch: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProch: TFProch;

implementation

{$R *.dfm}

uses umain;

procedure TFProch.BitBtn1Click(Sender: TObject);
begin
  { INSERT INTO ZAMER.ZPROCH (
    NOMER, EPROCH, HIFREQ,
    PEREGRUZ, RIZOL, MASSA,
    U074, U113)
    VALUES ( :NOMER, :EPROCH, :HIFREQ,
    :PEREGRUZ, :RIZOL, :MASSA,
    :U074, :U113 ) }
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('delete from zproch where nomer=' + Quotedstr(Nomer));
  QTemp.ExecSQL;
  if (Edit1.Text='0') or( Edit2.Text='0') then
   begin
    ShowMessage('Масса равна нулю либо напряжение рано нулю, нужно исправить');
    Exit;
   end;

  QInsProch.Close;
  QInsProch.PaRAMByName('nomer').Asstring  := Nomer;
  QInsProch.PaRAMByName('eprochu').AsFloat := strtofloat(Edit1.Text);
  QInsProch.PaRAMByName('massa').AsFloat   := strtofloat(Edit2.Text);
  if CheckBox1.checked then
    QInsProch.PaRAMByName('eproch').AsInteger := 1
  else
    QInsProch.PaRAMByName('eproch').AsInteger := 0;
  if CheckBox2.checked then
    QInsProch.PaRAMByName('HIFREQ').AsInteger := 1
  else
    QInsProch.PaRAMByName('HIFREQ').AsInteger := 0;
  if CheckBox3.checked then
    QInsProch.PaRAMByName('PEREGRUZ').AsInteger := 1
  else
    QInsProch.PaRAMByName('PEREGRUZ').AsInteger := 0;
  if CheckBox4.checked then
    QInsProch.PaRAMByName('RIZOL').AsInteger := 1
  else
    QInsProch.PaRAMByName('RIZOL').AsInteger := 0;
  if CheckBox5.checked then
    QInsProch.PaRAMByName('U074').AsInteger := 1
  else
    QInsProch.PaRAMByName('U074').AsInteger := 0;
  if CheckBox6.checked then
    QInsProch.PaRAMByName('U113').AsInteger := 1
  else
    QInsProch.PaRAMByName('U113').AsInteger := 0;
  QInsProch.ExecSQL;
  /////////////////////////////////////



  FProch.Close;
end;

end.
