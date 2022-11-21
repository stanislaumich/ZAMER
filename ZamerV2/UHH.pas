unit UHH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Math, Uadd;

type
  TFormHH = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    TimUp: TTimer;
    QUp: TFDQuery;
    QTemp: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure TimUpTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHH: TFormHH;

implementation
 uses Uzv2Main;

{$R *.dfm}

procedure TFormHH.FormActivate(Sender: TObject);
begin
 QTemp.Open('select * from zdelta where name='+Quotedstr('uhh'));
 Edit2.Text:=QTemp.Fieldbyname('value').Asstring;
end;

procedure TFormHH.FormHide(Sender: TObject);
begin
 TimUp.Enabled:=False;

 QTemp.Close;
 Qtemp.SQL.Clear;
 Qtemp.SQL.Add('update zdelta set value= '+Quotedstr(Edit2.text)+' where name='+Quotedstr('uhh'));
 QTemp.ExecSQL;
end;

procedure TFormHH.FormShow(Sender: TObject);
begin
 TimUp.Enabled:=True;
end;

procedure TFormHH.TimUpTimer(Sender: TObject);
begin
 QUp.Open('select U from zelspectmp');
 if abs(QUp.FieldByName('U').Asfloat-myfloat(Label8.Caption))<myfloat(nvltozero(Edit2.Text)) then
  begin
   Label4.Font.Color:=clGreen;
   Label9.Font.Color:=clGreen;
  end
  else
   begin
    Label4.Font.Color:=clRed;
    Label9.Font.Color:=clRed;
   end;
 Label9.Caption:=myformat(tRazU, QUp.FieldByName('U').Asfloat);
end;

end.
