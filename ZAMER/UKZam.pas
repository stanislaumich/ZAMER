unit UKZam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids;

type
  TFKzam = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StringGrid1: TStringGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKzam: TFKzam;
  b:TBitmap;

implementation

{$R *.dfm}

procedure TFKzam.BitBtn1Click(Sender: TObject);
begin
 BitBtn1.Glyph.LoadFromFile(extractfilepath(paramstr(0))+'apply.bmp');
 BitBtn2.Glyph:=nil;
 BitBtn3.Glyph:=nil;
 BitBtn4.Glyph:=nil;
 BitBtn5.Glyph:=nil;
 BitBtn6.Glyph:=nil;
 BitBtn7.Glyph:=nil;
 BitBtn1.Repaint;
end;

procedure TFKzam.BitBtn2Click(Sender: TObject);
begin
 BitBtn1.Glyph:=nil;
 BitBtn2.Glyph.LoadFromFile(extractfilepath(paramstr(0))+'apply.bmp');
 BitBtn3.Glyph:=nil;
 BitBtn4.Glyph:=nil;
 BitBtn5.Glyph:=nil;
 BitBtn6.Glyph:=nil;
 BitBtn7.Glyph:=nil;
end;

procedure TFKzam.BitBtn3Click(Sender: TObject);
begin
 BitBtn1.Glyph:=nil;
 BitBtn2.Glyph:=nil;
 BitBtn3.Glyph.LoadFromFile(extractfilepath(paramstr(0))+'apply.bmp');
 BitBtn4.Glyph:=nil;
 BitBtn5.Glyph:=nil;
 BitBtn6.Glyph:=nil;
 BitBtn7.Glyph:=nil;
end;

procedure TFKzam.BitBtn4Click(Sender: TObject);
begin
 BitBtn1.Glyph:=nil;
 BitBtn2.Glyph:=nil;
 BitBtn3.Glyph:=nil;
 BitBtn4.Glyph.LoadFromFile(extractfilepath(paramstr(0))+'apply.bmp');
 BitBtn5.Glyph:=nil;
 BitBtn6.Glyph:=nil;
 BitBtn7.Glyph:=nil;
end;

procedure TFKzam.BitBtn5Click(Sender: TObject);
begin
 BitBtn1.Glyph:=nil;
 BitBtn2.Glyph:=nil;
 BitBtn3.Glyph:=nil;
 BitBtn4.Glyph:=nil;
 BitBtn5.Glyph.LoadFromFile(extractfilepath(paramstr(0))+'apply.bmp');
 BitBtn6.Glyph:=nil;
 BitBtn7.Glyph:=nil;
end;

procedure TFKzam.BitBtn6Click(Sender: TObject);
begin
 BitBtn1.Glyph:=nil;
 BitBtn2.Glyph:=nil;
 BitBtn3.Glyph:=nil;
 BitBtn4.Glyph:=nil;
 BitBtn5.Glyph:=nil;
 BitBtn6.Glyph.LoadFromFile(extractfilepath(paramstr(0))+'apply.bmp');
 BitBtn7.Glyph:=nil;
end;

procedure TFKzam.BitBtn7Click(Sender: TObject);
begin
 BitBtn1.Glyph:=nil;
 BitBtn2.Glyph:=nil;
 BitBtn3.Glyph:=nil;
 BitBtn4.Glyph:=nil;
 BitBtn5.Glyph:=nil;
 BitBtn6.Glyph:=nil;
 BitBtn7.Glyph.LoadFromFile(extractfilepath(paramstr(0))+'apply.bmp');
end;

procedure TFKzam.FormCreate(Sender: TObject);
begin
// b.getb  :=Bitbtn1.Glyph.LoadFromFile();
// BitBtn1.Glyph:=nil;
end;

end.
