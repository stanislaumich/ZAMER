unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Vcl.Grids, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, Vcl.DBGrids,
  ShellApi;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDCL: TFDConnection;
    FDT: TFDTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

Uses UMain;
{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
  s  : string;
  f  : textfile;
  wnd: HWND;
  i  : integer;
begin
  if Form1.OpenDialog1.Execute() then
  begin
    AssignFile(f, Form1.OpenDialog1.Filename + '.CSV');
    Rewrite(f);
    FDT.First;
    s     := '';
    for i := 0 to FDT.FieldCount - 1 do
    begin
      s := s + FDT.Fields[i].FieldName;
      s := s + ';';
    end;
    WriteLn(f, s);

    While not FDT.eof do
    begin
      s     := '';
      for i := 0 to FDT.FieldCount - 1 do
      begin
        s := s + FDT.Fields[i].AsString;
        s := s + ';';
      end;
      WriteLn(f, s);
      FDT.Next;
    end;

    Closefile(f);
    ShowMessage('Ёкспорт завершен');
    ShellExecute(wnd, 'open', PChar(Form1.OpenDialog1.Filename + '.CSV'), nil,
      nil, SW_RESTORE);
  end;
end;

procedure TForm2.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
var
  Grid      : TStringGrid;
  Texto     : String;
  Rectangulo: TRect;
begin
  Rectangulo := Rect;
  Grid       := TStringGrid(Sender);
  if Field.IsBlob then
  begin
    Grid.Canvas.FillRect(Rect);
    Texto := Field.AsString;
    DrawText(Grid.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)), Rectangulo,
      DT_WORDBREAK);
  end;
end;

end.
