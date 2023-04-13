unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, typinfo, Vcl.StdCtrls, Vcl.ExtCtrls;

  const
  ScreenWidth: LongInt = 800; {Я разрабатывал мою форму в режиме 800x600.}
  ScreenHeight: LongInt = 600;

type
  TFMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  up, ip, pp, mp, np, pwp:string;
implementation

{$R *.dfm}

uses Usett;

procedure TFMain.Button1Click(Sender: TObject);
var
 s : string;
 begin
  Canvas.Font.Name := 'Tahoma';
  Canvas.Font.Style := [fsBold];
  Canvas.Brush.Style := bsClear;
  PatBlt(FMain.Canvas.Handle, 0, 0,
   FMain.ClientWidth, FMain.ClientHeight, WHITENESS);
  FSett.QTemp.Close;
  FSett.QTemp.SQL.Clear;
  FSEtt.QTemp.SQL.Add('select U, I, P, TORQ M, ROT N, POWER Pw FROM ZAMER.ZELSPECTMP, ZAMER.ZAMER');
  FSett.QTemp.Open;
   with Canvas do begin

   Font.Size := fsett.u.sz;
   //Font.Color:= FMain.Color;
   //s:= up;
   //TextOut(FSEtt.u.X, FSEtt.u.Y, s);
   Font.Color:= fsett.u.color;
   s:= FSEtt.u.before+FSEtt.QTemp.FieldByName('U').Asstring+FSEtt.u.after;
   up:=s;
   TextOut(FSEtt.u.X, FSEtt.u.Y, s);

   Font.Size := fsett.i.sz;
   Font.Color:= fsett.i.color;
   s:= FSEtt.i.before+FSEtt.QTemp.FieldByName('I').Asstring+FSEtt.i.after;
   TextOut(FSEtt.i.X, FSEtt.i.Y, s);

   Font.Size := fsett.p.sz;
   Font.Color:= fsett.p.color;
   s:= FSEtt.p.before+FSEtt.QTemp.FieldByName('P').Asstring+FSEtt.p.after;
   TextOut(FSEtt.p.X, FSEtt.p.Y, s);

   Font.Size := fsett.n.sz;
   Font.Color:= fsett.n.color;
   s:= FSEtt.n.before+FSEtt.QTemp.FieldByName('N').Asstring+FSEtt.n.after;
   TextOut(FSEtt.n.X, FSEtt.n.Y, s);

   Font.Size := fsett.m.sz;
   Font.Color:= fsett.m.color;
   s:= FSEtt.m.before+FSEtt.QTemp.FieldByName('M').Asstring+FSEtt.m.after;
   TextOut(FSEtt.m.X, FSEtt.m.Y, s);

   Font.Size := fsett.pw.sz;
   Font.Color:= fsett.pw.color;
   s:= FSEtt.pw.before+FSEtt.QTemp.FieldByName('Pw').Asstring+FSEtt.pw.after;
   TextOut(FSEtt.pw.X, FSEtt.pw.Y, s);
  end;
 end;
procedure TFMain.Button2Click(Sender: TObject);
begin
 FSett.ShowModal;
end;

procedure TFMain.Timer1Timer(Sender: TObject);
begin
 Button1.Click;

end;

end.
