unit Ugetlast;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBGrids, Vcl.Buttons;

type
  TFgetlast = class(TForm)
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Query1: TFDQuery;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query2: TFDQuery;
    procedure StringGrid1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fgetlast: TFgetlast;

implementation

Uses Umain;
{$R *.dfm}

procedure TFgetlast.BitBtn1Click(Sender: TObject);
begin
 Form1.Edit5.Text:=Label2.Caption;
 Form1.BitBtn18.Enabled:=true;
 Form1.BitBtn19.Enabled:=true;
 {тут нужно будет заполнить левую часть формы 1 данными двигателя селектом из базы}
 Fgetlast.Close;
end;

procedure TFgetlast.BitBtn2Click(Sender: TObject);
var
    buttonSelected: Integer;
begin
    buttonSelected := MessageDlg('Действительно очистить список незавершенных испытаний???', mtConfirmation, mbYesNo, 0);
    if buttonSelected = mrYes then
     begin
      Query2.ExecSQL;
      ShowMessage('Удалены все незавершенные испытания!');
     end;
end;

procedure TFgetlast.StringGrid1Click(Sender: TObject);
begin
 Label2.Caption:=StringGrid1.Cells[0,stringgrid1.row];
 Query1.Close;
 Query1.ParamByName('nomer').Asstring:=Label2.Caption;
 Query1.Open;
end;

end.
