unit Uzv2Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, inifiles, math, uadd, ustr,
  Vcl.Buttons;

type
  TFZamerV2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    NOMER: TLabel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    BSoprot: TButton;
    BHH: TButton;
    BKz: TButton;
    BNagr: TButton;
    BRH: TButton;
    BMH: TButton;
    BPI: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure saveini;
        procedure restoreini;
  end;

var
  FZamerV2: TFZamerV2;

implementation

{$R *.dfm}
procedure TFZamerV2.saveini;
var
    i: tinifile;
    t: integer;
begin
    try
        i := tinifile.Create(extractfilepath(paramstr(0)) + 'ZAMERV2.INI');
        t := FZamerV2.Left;
        i.WriteInteger('POSITION', 'LEFT', t);
        t := FZamerV2.Top;
        i.WriteInteger('POSITION', 'TOP', t);
        i.free;
    except
        on e: exception do
            e := NIL;
    end;
end;

procedure TFZamerV2.BitBtn1Click(Sender: TObject);
begin
 saveini;
 FZamerV2.Close;

end;

procedure TFZamerV2.BitBtn2Click(Sender: TObject);
begin
 Application.Minimize;
end;

procedure TFZamerV2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 saveini;
end;

procedure TFZamerV2.FormCreate(Sender: TObject);
begin
 restoreini;
end;

procedure TFZamerV2.restoreini;
var
    i: tinifile;
begin
    i := tinifile.Create(extractfilepath(paramstr(0)) + 'ZAMERV2.INI');
    FZamerV2.Left        := i.ReadInteger('POSITION', 'LEFT', 10);
    FZamerV2.Top         := i.ReadInteger('POSITION', 'TOP', 10);
    FZamerV2.Repaint;
    i.free;
end;
end.
