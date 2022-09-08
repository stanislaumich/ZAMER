unit Uproch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids;

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
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Qinsvibro: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
var
 i,j,inq:integer;
 cod:integer;
 s:string;
begin

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
  {INSERT INTO ZAMER.ZVIBRO (
   NOMER, X, Y,
   VAL)
VALUES ( :NOMER, :X, :Y,
   :VAL )}
   QTemp.Close;
   Qtemp.SQL.Clear;
   Qtemp.SQl.Add('delete from zvibro where nomer='+Quotedstr(nomer));
   QTemp.ExecSQL;
   for i:=1 to 2 do
    for j:=1 to 18 do
     begin
      QinsVibro.Close;
      Qinsvibro.ParamByName('x').Asinteger:=i;
      Qinsvibro.ParamByName('y').Asinteger:=j;
      Qinsvibro.ParamByName('nomer').AsString:=Nomer;
      s:=Stringgrid1.cells[i,j];
      val(s,cod,inq);
      if cod<>0 then inq:=-1;
      Qinsvibro.ParamByName('val').Asinteger:=Inq;
      QInsVibro.ExecSQL;
     end;




  FProch.Close;
end;

procedure TFProch.FormCreate(Sender: TObject);
var
 i:integer;
begin
 StringGrid2.Cells[0,0]:='Точки';
 StringGrid2.Cells[0,1]:='Изм. 1';
 StringGrid2.Cells[0,2]:='Изм. 2';
 For i:=1 to 8 do
  begin
   StringGrid2.Cells[i,0]:=IntToStr(i);
   StringGrid2.Cells[i,1]:=IntToStr(0);
   StringGrid2.Cells[i,2]:=IntToStr(0);
  end;

 //StringGrid2.Cells[0,0]:='Точки';
 StringGrid1.Cells[0,1]:='Упругое';
 StringGrid1.Cells[0,2]:='Жесткое';
 For i:=1 to 6 do
  begin
   StringGrid1.Cells[i,0]:='мм/с';
   StringGrid1.Cells[i,1]:=IntToStr(0);
   StringGrid1.Cells[i,2]:=IntToStr(0);
  end;
  For i:=7 to 12 do
  begin
   StringGrid1.Cells[i,0]:='мкм';
   StringGrid1.Cells[i,1]:=IntToStr(0);
   StringGrid1.Cells[i,2]:=IntToStr(0);
  end;
   For i:=13 to 18 do
  begin
   StringGrid1.Cells[i,0]:='м/c2';
   StringGrid1.Cells[i,1]:=IntToStr(0);
   StringGrid1.Cells[i,2]:=IntToStr(0);
  end;
 For i:=1 to 18 do
  Stringgrid1.ColWidths[i]:=50;
  Stringgrid1.ColWidths[0]:=85;

end;

end.
