unit USett;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSett: TFSett;

implementation
 //Uses uzv2Main;
{$R *.dfm}

end.
