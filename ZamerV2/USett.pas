unit USett;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSett: TFSett;

implementation
 Uses uzv2Main;
{$R *.dfm}

procedure TFSett.BitBtn1Click(Sender: TObject);
begin

 FSett.Close;
end;

procedure TFSett.BitBtn2Click(Sender: TObject);
begin


 FSett.Close;
end;

procedure TFSett.Button1Click(Sender: TObject);
begin
 If OpenDialog1.Execute then
  Edit1.Text:=OpenDialog1.Filename;
end;

procedure TFSett.Button2Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
  Edit2.Text:=OpenDialog1.Filename;
end;

end.
