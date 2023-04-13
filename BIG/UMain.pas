unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, typinfo, Vcl.StdCtrls;

  const
  ScreenWidth: LongInt = 800; {Я разрабатывал мою форму в режиме 800x600.}
  ScreenHeight: LongInt = 600;

type
  TFMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses Usett;

procedure TFMain.Button1Click(Sender: TObject);
var
 s : string;
 begin
  FSett.QTemp.Close;
  FSett.QTemp.SQL.Clear;
  FSEtt.QTemp.SQL.Add('select U, I, P, TORQ, ROT, POWER FROM ZAMER.ZELSPECTMP, ZAMER.ZAMER');
  FSett.QTemp.Open;
   with Canvas do begin
   Font.Name := 'Tahoma';
   Font.Size := fsett.u.sz;
   Font.Color:= fsett.u.color;
   Font.Style := [fsBold] ;
   Brush.Style := bsClear;
   s:= FSEtt.u.before+FSEtt.QTemp.FieldByName('U').Asstring+FSEtt.u.after;
   TextOut(FSEtt.u.X, FSEtt.u.Y, s);
  end;
 end;
procedure TFMain.Button2Click(Sender: TObject);
begin
 FSett.ShowModal;
end;

end.
