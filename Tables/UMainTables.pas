unit UMainTables;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
    FireDAC.Stan.Option,
    FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
    Data.DB, {Uni,} Vcl.Grids, Vcl.DBGrids, {MemDS,} {DBAccess,} FireDAC.Comp.Client,
    Vcl.ExtCtrls, Vcl.StdCtrls, {UniProvider,} {OracleUniProvider,} Vcl.Buttons,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.Comp.DataSet;

type
    TForm2 = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        Panel3: TPanel;
        Panel4: TPanel;
        Panel5: TPanel;
        DBGrid1: TDBGrid;
        ListBox1: TListBox;
        Panel6: TPanel;
        BitBtn1: TBitBtn;
        BitBtn2: TBitBtn;
        Label1: TLabel;
        ComboBox1: TComboBox;
        Label2: TLabel;
        Label3: TLabel;
        Edit1: TEdit;
        Button2: TButton;
        Button3: TButton;
        CheckBox1: TCheckBox;
        SaveDialog1: TSaveDialog;
    Query1: TFDQuery;
    FDC: TFDConnection;
    Table: TFDTable;
    DataSource1: TDataSource;
        procedure BitBtn1Click(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure ListBox1Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);
        procedure Button3Click(Sender: TObject);
        procedure CheckBox1Click(Sender: TObject);
        procedure BitBtn2Click(Sender: TObject);

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

procedure TForm2.BitBtn2Click(Sender: TObject);
var
    s   : string;
    f   : textfile;
    i, j: integer;
begin
    If SaveDialog1.Execute() then
    begin
        s := '';
        Assignfile(f, SaveDialog1.Filename);
        Rewrite(f);
        for i := 0 to Table.FieldCount - 1 do
            s := s + Table.Fields[i].FieldName + ';';
        Writeln(f, s);
        Table.First;
        While not Table.EOF do
        begin
            s     := '';
            For i := 0 to Table.FieldCount - 1 do
                s := s + Table.Fields[i].Asstring + ';';
            Writeln(f, s);
            Table.Next;
        end;
        Closefile(f);
    end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    Button3.Click;
    Table.Filter   := ComboBox1.Text + '=' + Edit1.Text;
    Table.Filtered := true;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
    Table.Filtered := false;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
   if CheckBox1.Checked then dbgrid1.options := DBGrid1.Options - [dgEditing]
   else dbgrid1.options := DBGrid1.Options + [dgEditing];
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
    Query1.ParamByName('name').Asstring := Table.TableName;
    Query1.Open;
    ComboBox1.Items.Clear;
    ComboBox1.Text := '';
    Table.Filtered := false;
    While not Query1.EOF do
    begin
        ComboBox1.Items.Add(Query1.FieldByName('COLUMN_NAME').Asstring);
        Query1.Next;
    end;
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('select name from ztable where vname=:vname');
    //dbgrid1.options := DBGrid1.Options - [dgEditing];
end;

end.
