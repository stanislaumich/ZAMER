unit UDATA;

interface

uses
	System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
	FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
	FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
	FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
	FireDAC.DatS,
	FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
	FireDAC.Comp.Client;

type
	TData = class(TDataModule)
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	Data: TData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

end.
