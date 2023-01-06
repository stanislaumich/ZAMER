unit USett;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, ShellAPI;

type
  TFSett = class(TForm)
    GroupBox1: TGroupBox;
    TabSotrud: TFDTable;
    DSSotrud: TDataSource;
    GridSotrud: TDBGrid;
    GroupBox2: TGroupBox;
    DSStend: TDataSource;
    GridStend: TDBGrid;
    TablStend: TFDTable;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QTemp: TFDQuery;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    CombCom: TComboBox;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox5: TGroupBox;
    ListBox1: TListBox;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSett: TFSett;
  fname: string;

implementation

Uses uzv2Main;
{$R *.dfm}

procedure TFSett.BitBtn1Click(Sender: TObject);
begin
  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('Update zini set value=' + Quotedstr(Edit1.Text) +
    ' where name=' + Quotedstr('UIPPath'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('Update zini set value=' + Quotedstr(Edit2.Text) +
    ' where name=' + Quotedstr('MNTPath'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('Update zini set value=' + Quotedstr(Edit4.Text) +
    ' where name=' + Quotedstr('StepBig'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('Update zini set value=' + Quotedstr(Edit5.Text) +
    ' where name=' + Quotedstr('StepSmall'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('Update zini set value=' + Quotedstr(Edit3.Text) +
    ' where name=' + Quotedstr('StepU'));
  QTemp.ExecSQL;

  QTemp.Close;
  QTemp.SQL.Clear;
  QTemp.SQL.Add('Update zini set value=' + Quotedstr(CombCom.Text) +
    ' where name=' + Quotedstr('ComPortU'));
  QTemp.ExecSQL;

  FSett.Close;
end;

procedure TFSett.BitBtn2Click(Sender: TObject);
begin

  FSett.Close;
end;

procedure TFSett.BitBtn3Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(Edit1.Text), nil, nil, SW_SHOWNORMAL);
end;

procedure TFSett.BitBtn4Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(Edit2.Text), nil, nil, SW_SHOWNORMAL);
end;

procedure TFSett.Button1Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    Edit1.Text := '"' + OpenDialog1.Filename + '"';
end;

procedure TFSett.Button2Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    Edit2.Text := '"' + OpenDialog1.Filename + '"';
end;

procedure TFSett.Button3Click(Sender: TObject);
begin
  Memo1.lines.savetofile(fname);
end;

procedure TFSett.FormCreate(Sender: TObject);
begin
  // QTemp.Close;
  // QTemp.SQL.Clear;
  QTemp.Open('Select value from zini where name=' + Quotedstr('UIPPath'));
  Edit1.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Open('Select value from zini where name=' + Quotedstr('MNTPath'));
  Edit2.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Open('Select value from zini where name=' + Quotedstr('StepU'));
  Edit3.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Open('Select value from zini where name=' + Quotedstr('StepBig'));
  Edit4.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Open('Select value from zini where name=' + Quotedstr('StepSmall'));
  Edit5.Text := QTemp.FieldByName('value').Asstring;
  QTemp.Open('Select value from zini where name=' + Quotedstr('ComPortU'));
  CombCom.Text := QTemp.FieldByName('value').Asstring;
end;

procedure TFSett.ListBox1Click(Sender: TObject);
begin
  fname := ListBox1.items[ListBox1.ItemIndex];
  delete(fname, 1, pos(';', fname));
  fname := extractfilepath(Application.exename) + fname;
  Memo1.lines.loadfromfile(fname);
end;

end.
