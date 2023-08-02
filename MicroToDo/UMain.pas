unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Ustr,
  Vcl.MPlayer;

type
  TFMain = class(TForm)
    BalloonHint1: TBalloonHint;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Timer1: TTimer;
    Edit1: TEdit;
    TrayIcon1: TTrayIcon;
    Button3: TButton;
    MediaPlayer1: TMediaPlayer;
    Button4: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

procedure TFMain.Button1Click(Sender: TObject);
begin

 ListBox1.Items.add(Edit1.Text);
 ListBox1.Items.SaveToFile(extractfilepath(paramstr(0))+'\tasks.txt');
 Edit1.Text:='';
end;

procedure TFMain.Button2Click(Sender: TObject);
begin
 ListBox1.DeleteSelected;
 ListBox1.Items.SaveToFile(extractfilepath(paramstr(0))+'\tasks.txt');
end;

procedure TFMain.Button3Click(Sender: TObject);
begin
  Hide();
  WindowState := wsMinimized;
  TrayIcon1.Visible := True;
  //TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TFMain.Button4Click(Sender: TObject);
begin
 MediaPlayer1.Stop;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ListBox1.Items.SaveToFile(extractfilepath(paramstr(0))+'\tasks.txt');
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
 ListBox1.Items.LoadFromFile(extractfilepath(paramstr(0))+'\tasks.txt');
 TrayIcon1.BalloonTitle := 'Напоминалка запущена.';
  TrayIcon1.BalloonHint :=
    'Двойной клик восстановить программу.';
  TrayIcon1.BalloonFlags := bfInfo;
  MediaPlayer1.FileName:=extractfilepath(paramstr(0))+'\sound1.mp3';
  MediaPlayer1.Open;
end;

procedure TFMain.ListBox1Click(Sender: TObject);
begin
 Edit1.Text:=ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TFMain.Timer1Timer(Sender: TObject);
var
 i:integer;
 s,s1,s2,s3, st, sh,sm:string;
begin
 for i:=0 to ListBox1.Items.Count-1 do
   begin
    s:=ListBox1.Items[i];
    s1:=trim(pnext(' ',s));
    s2:=trim(pnext(' ',s));
    s3:=trim(s);
    st:=TimeToStr(time);
    sh:=pnext(':',st);
    sm:=pnext(':',st);
    //ListBox1.Items.add(sh+'   '+sm+'---' + s1+' '+s2);
    if (s1=sh)and(s2=sm) then
     begin
      MediaPlayer1.Play;
      ShowMessage('Время - '+s3);
      TrayIcon1DblClick(Timer1);
     end;
   end;
end;

procedure TFMain.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

end.
