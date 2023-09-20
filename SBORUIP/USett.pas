unit USett;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  TFSett = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    TPribor: TFDTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    TIni: TFDTable;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TStend: TFDTable;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    BitBtn1: TBitBtn;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    DBText1: TDBText;
    Label17: TLabel;
    DBText2: TDBText;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSett: TFSett;

implementation

{$R *.dfm}

uses Umain;

procedure TFSett.BitBtn1Click(Sender: TObject);
begin
  FMain.QTemp.Close;
  FMain.QTemp.SQL.Clear;
  FMain.QTemp.SQL.add('delete from ini where name like ' + QuotedStr('CURR_%'));
  FMain.QTemp.ExecSQL;
  FMain.QTemp.Close;
  FMain.QTemp.SQL.Clear;
  FMain.QTemp.SQL.add('insert into ini (name, val, dop) values (' +
    QuotedStr('CURR_IP') + ', ' + QuotedStr(DBEdit1.Text) + ', ' +
    QuotedStr(DBText2.Caption) + ')');
  FMain.QTemp.ExecSQL;
  FMain.QTemp.Close;
  FMain.QTemp.SQL.Clear;
  FMain.QTemp.SQL.add('insert into ini (name, val, dop) values (' +
    QuotedStr('CURR_PORT') + ', ' + QuotedStr(DBEdit2.Text) + ', ' +
    QuotedStr(DBText2.Caption) + ')');
  FMain.QTemp.ExecSQL;
  FMain.QTemp.Close;
  FMain.QTemp.SQL.Clear;
  FMain.QTemp.SQL.add('insert into ini (name, val, dop) values (' +
    QuotedStr('CURR_ID') + ', ' + QuotedStr(DBEdit3.Text) + ', ' +
    QuotedStr(DBText2.Caption) + ')');
  FMain.QTemp.ExecSQL;
  TIni.Refresh;
end;

procedure TFSett.BitBtn2Click(Sender: TObject);
begin
  TStend.Post;
end;

procedure TFSett.Button1Click(Sender: TObject);
begin
  FMain.T1.UpdateValue;
  FMain.T2.UpdateValue;
  FMain.T3.UpdateValue;
  FMain.T4.UpdateValue;
  Edit1.Text := FloatToStr(FMain.T1.Value);
  Edit2.Text := FloatToStr(FMain.T2.Value);
  Edit3.Text := FloatToStr(FMain.T3.Value);
  Edit4.Text := FloatToStr(FMain.T4.Value);
end;

procedure TFSett.Button2Click(Sender: TObject);
begin
  FMain.T1.Value := Strtofloat(Edit1.Text);
  FMain.T2.Value := Strtofloat(Edit2.Text);
  FMain.T3.Value := Strtofloat(Edit3.Text);
  FMain.T4.Value := Strtofloat(Edit4.Text);
end;

procedure TFSett.Button3Click(Sender: TObject);
begin
  Tini.Refresh;
  FMain.Get_Params;
end;

procedure TFSett.FormCreate(Sender: TObject);
begin
  FSett.TIni.active := true;
  FSett.TPribor.active := true;
  FSett.TStend.active := true;
end;

end.
