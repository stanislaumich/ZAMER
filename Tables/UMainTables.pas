unit UMainTables;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
    FireDAC.Stan.Option,
    FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
    Data.DB, Uni, Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, FireDAC.Comp.Client,
    Vcl.ExtCtrls, Vcl.StdCtrls, UniProvider, OracleUniProvider, Vcl.Buttons;

type
    TForm2 = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        Panel3: TPanel;
        Panel4: TPanel;
        Panel5: TPanel;
        FDC: TFDConnection;
        UniC: TUniConnection;
        UniDataSource1: TUniDataSource;
        Table: TUniTable;
        DBGrid1: TDBGrid;
        Query1: TUniQuery;
        Button1: TButton;
        OracleUniProvider1: TOracleUniProvider;
        ListBox1: TListBox;
        Panel6: TPanel;
        BitBtn1: TBitBtn;
        BitBtn2: TBitBtn;
        Label1: TLabel;
    ComboBox1: TComboBox;
        procedure Button1Click(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure ListBox1Click(Sender: TObject);

    private
        { Private declarations }
    public
        { Public declarations }
        procedure AutoSize(DBGrid: TDBGrid);
    end;

var
    Form2: TForm2;

implementation

{$R *.dfm}

Procedure TForm2.AutoSize(DBGrid: TDBGrid); //
var
    i, ColWidth, ColTextWidth: integer;
begin
    if DBGrid.DataSource.DataSet.Active then
    begin
        DBGrid.DataSource.DataSet.DisableControls;
        for i := 0 to DBGrid.Columns.Count - 1 do
        begin
            ColWidth := DBGrid.Canvas.TextWidth
              (DBGrid.Columns[i].Field.DisplayLabel);
            DBGrid.DataSource.DataSet.First;
            while not DBGrid.DataSource.DataSet.EOF do
            begin
                ColTextWidth := DBGrid.Canvas.TextWidth
                  (DBGrid.Columns[i].Field.DisplayText);
                if (ColTextWidth > ColWidth) then
                begin
                    ColWidth := ColTextWidth;
                end;
                DBGrid.DataSource.DataSet.Next;
            end; { while }
            DBGrid.Columns[i].Width := ColWidth + 30;
        end; { for }
        DBGrid.DataSource.DataSet.EnableControls;
        DBGrid.DataSource.DataSet.First;
    end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('select vname from ztable order by p');
    Query1.Open;
    ListBox1.Items.Clear;
    While not Query1.EOF do
    begin
        ListBox1.Items.Add(Query1.FieldByName('vname').Asstring);
        Query1.Next;
    end;
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('select name from ztable where vname=:vname');
    if Table.Active then
        Table.Refresh;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
    AutoSize(DBGrid1);
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
    BitBtn1.Click;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
    Table.Active                         := false;
    Label1.Caption                       := ListBox1.Items[ListBox1.ItemIndex];
    Query1.ParamByName('vname').Asstring := ListBox1.Items[ListBox1.ItemIndex];
    Query1.Open;

    Table.TableName := Query1.FieldByName('name').Asstring;
    Table.Active    := true;
    Query1.Close;
    AutoSize(DBGrid1);
    Query1.SQL.Clear;
    Query1.SQL.Add
      ('select A.COLUMN_NAME,A.TABLE_NAME, COLUMN_ID from USER_TAB_COLUMNS A where TABLE_NAME = UPPER(:name) ORDER BY A.COLUMN_ID');
    Query1.ParamByName('name').Asstring := Label1.Caption;
    Query1.Open;
    ComboBox1.Items.Clear;
    ComboBox1.Text:='';
    Table.Filtered:=false;
    While not Query1.Eof do
     begin
      ComboBox1.Items.Add(Query1.FieldByName('COLUMN_NAME').Asstring);
      Query1.Next;
     end;
    Query1.Close;
end;

end.
