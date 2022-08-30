unit UArc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFArc = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit4: TEdit;
    Edit7: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QSelect: TFDQuery;
    BitBtn3: TBitBtn;
    DataSelect: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FArc: TFArc;

implementation

{$R *.dfm}
procedure setgridcolumnwidths(grid: tdbgrid);
const
defborder = 10;
var
temp, n: integer;
lmax: array [0..30] of integer;
begin
with grid do
begin
canvas.font := font;
for n := 0 to columns.count - 1 do
//if columns[n].visible then
lmax[n] := canvas.textwidth(fields[n].fieldname) + defborder;
grid.datasource.dataset.first;
while not grid.datasource.dataset.eof do
begin
for n := 0 to columns.count - 1 do
begin
//if columns[n].visible then begin
temp := canvas.textwidth(trim(columns[n].field.displaytext)) + defborder;
if temp > lmax[n] then lmax[n] := temp;
//end; { if }
end; {for}
grid.datasource.dataset.next;
end; { while }
grid.datasource.dataset.first;
for n := 0 to columns.count - 1 do
if lmax[n] > 0 then
columns[n].width := lmax[n];
end; { with }
end; {setgridcolumnwidths }





procedure TFArc.BitBtn3Click(Sender: TObject);
begin
 QSelect.Close;
 Qselect.Open;
 setgridcolumnwidths(dbgrid1);
end;

procedure TFArc.DBGrid1CellClick(Column: TColumn);
begin
 Label2.Caption:=Qselect.FieldByName('nomer').Asstring;
 Edit4.TExt:=Qselect.FieldByName('nomdv').Asstring;
 Edit5.TExt:=Qselect.FieldByName('unom').Asstring;
 Edit6.TExt:=Qselect.FieldByName('uisp').Asstring;
 Edit7.TExt:=Qselect.FieldByName('pnom').Asstring;
 Edit8.TExt:=Qselect.FieldByName('humid').Asstring;
 Edit9.TExt:=Qselect.FieldByName('pressur').Asstring;
 Edit10.TExt:=Qselect.FieldByName('ispoln').Asstring;
 Edit11.TExt:=Qselect.FieldByName('dop1').Asstring;
 Datetimepicker1.date:=Qselect.FieldByName('data').AsDateTime;
 Edit1.TExt:=Qselect.FieldByName('tipdv').Asstring;
 Edit2.TExt:=Qselect.FieldByName('energo').Asstring;
 Label3.Caption:= Qselect.FieldByName('stendn').Asstring;
 Label24.Caption:= Qselect.FieldByName('stenda').Asstring;
 Edit3.TExt:=Qselect.FieldByName('polus').Asstring;
end;

end.
