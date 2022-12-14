unit UARC;

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
  TFARC = class(TForm)
    GB1: TGroupBox;
    DSSpis: TDataSource;
    GridSpis: TDBGrid;
    BitSelect: TBitBtn;
    BitReport: TBitBtn;
    BitDelete: TBitBtn;
    Label1: TLabel;
    QuerySpis: TFDQuery;
    QTemp: TFDQuery;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitSelectClick(Sender: TObject);
    procedure GridSpisDblClick(Sender: TObject);
    procedure BitReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure setgridcolumnwidths(grid: TDBGrid);
  end;

var
  FARC: TFARC;

implementation

Uses Uzv2Main;
{$R *.dfm}

procedure TFARC.setgridcolumnwidths(grid: TDBGrid);
const
  defborder = 10;
var
  temp, n: integer;
  lmax   : array [0 .. 30] of integer;
begin
  with grid do
  begin
    canvas.font := font;
    for n       := 0 to columns.count - 1 do
      // if columns[n].visible then
      lmax[n] := canvas.textwidth(fields[n].fieldname) + defborder;
    grid.datasource.DataSet.first;
    while not grid.datasource.DataSet.eof do
    begin
      for n := 0 to columns.count - 1 do
      begin
        // if columns[n].visible then begin
        temp := canvas.textwidth(trim(columns[n].field.displaytext)) +
          defborder;
        if temp > lmax[n] then
          lmax[n] := temp;
        // end; { if }
      end; { for }
      grid.datasource.DataSet.next;
    end; { while }
    grid.datasource.DataSet.first;
    for n := 0 to columns.count - 1 do
      if lmax[n] > 0 then
        columns[n].width := lmax[n];
  end; { with }
end; { setgridcolumnwidths }

procedure TFARC.BitReportClick(Sender: TObject);
begin
  Label1.Caption := GridSpis.datasource.DataSet.FieldByName('NOMER').Asstring;
  Label2.Caption := '1';
end;

procedure TFARC.BitSelectClick(Sender: TObject);
begin
  Label1.Caption := GridSpis.datasource.DataSet.FieldByName('NOMER').Asstring;
  Label2.Caption := '0';
  // FARC.Close;
end;

procedure TFARC.FormActivate(Sender: TObject);
begin
  setgridcolumnwidths(GridSpis);
  GridSpis.datasource.DataSet.Active := false;
  GridSpis.datasource.DataSet.Active := true;
  GridSpis.datasource.DataSet.first;
  Label1.Caption := GridSpis.datasource.DataSet.FieldByName('NOMER').Asstring;
end;

procedure TFARC.GridSpisDblClick(Sender: TObject);
begin
  Label1.Caption := GridSpis.datasource.DataSet.FieldByName('NOMER').Asstring;
  BitSelect.Click;
end;

end.
