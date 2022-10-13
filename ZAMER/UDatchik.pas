unit UDatchik;

interface

uses
	Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
	System.Classes, Vcl.Graphics,
	Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WebView2, Winapi.ActiveX,
	Vcl.OleCtrls,
	SHDocVw, Vcl.Edge, Vcl.StdCtrls;

type
	TFDatchik = class(TForm)
		EdgeBrowser1: TEdgeBrowser;
		WebBrowser1: TWebBrowser;
		Button1: TButton;
		procedure Button1Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	FDatchik: TFDatchik;

implementation

{$R *.dfm}

Uses Umain;

procedure TFDatchik.Button1Click(Sender: TObject);
begin
	// https://delphisources.ru/pages/faq/base/webbrowser_notes.html
end;

end.
