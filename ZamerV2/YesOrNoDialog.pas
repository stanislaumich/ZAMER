    { **** UBPFD *********** by delphibase.endimus.com ****
    >> Диалог с кнопками Yes, No, Cancel (компонент).
    Работает примерно так же как TDialog (для удобства).

    TYesOrNoDialog.ShowNoButton - показывать ли кнопку No.
    TYesOrNoDialog.ShowCancelButton - показывать ли кнопку Cancel.
    TYesOrNoDialog.Caption - заголовок диалгоа.
    TYesOrNoDialog.Text - текст диалога.
    function TYesOrNoDialog.Execute:Integer - показывает
    диалог и возвращает значение MessageBox'a

    Зависимости: Windows, Messages, SysUtils, Classes, Dialogs, Forms;
    Copyright:   (C) NetBreaker666[AWD]<SP666>@Svjatoslav_Lisin - т.е. я сам
    Дата:        11 августа 2002 г.
    ***************************************************** }

    unit YesOrNoDialog;

    interface

    uses
      Windows, Messages, SysUtils, Classes, Dialogs, Forms;

    type
      TYesOrNoDialog = class(TComponent)
      private
        { Private declarations }
        _OnEx: TNotifyEvent;
        __SNO: Boolean;
        __SC: Boolean;
        _Y, _N, _C: Boolean;
        _Caption, _Text: string;
        procedure SetNo(S: Boolean);
        procedure SetCancel(S: Boolean);
      protected
        { Protected declarations }

      public
        { Public declarations }
        property Yes: Boolean read _Y;
        property No: Boolean read _N;
        property Cancel: Boolean read _C;

      published
        { Published declarations }
        property ShowNoButton: Boolean read __SNO write SetNo;
        property ShowCancelButton: Boolean read __SC write SetCancel;
        property Caption: string read _Caption write _Caption;
        property Text: string read _Text write _Text;
        property OnExecute: TNotifyEvent read _OnEx write _OnEx;
        function Execute: Integer;

      end;

    procedure Register;

    implementation

    procedure Register;
    begin
      RegisterComponents('NetBreakers', [TYesOrNoDialog]);
    end;
    //Voen secret.
    // 2301900

    function TYesOrNoDialog.Execute: Integer;
    var
      Hn: THandle;
    begin
      Hn := Application.Handle;
      if __SNO and __SC then
      begin
        Result := MessageBox(Hn, PChar(text), PChar(Caption), MB_YESNOCANCEL);
        _Y := (Result = 6) or (Result = 1);
        _N := Result = 7;
        _C := REsult = 2;
        Exit;
      end;
      if __SNO then
      begin
        Result := MessageBox(Hn, PChar(text), PChar(Caption), MB_YESNO);
        _Y := (Result = 6) or (Result = 1);
        _N := Result = 7;
        _C := REsult = 2;
        Exit;
      end;
      if __SC then
      begin
        Result := MessageBox(Hn, PChar(text), PChar(Caption), MB_OKCANCEL);
        _Y := (Result = 6) or (Result = 1);
        _N := Result = 7;
        _C := REsult = 2;
        Exit;
      end;
      Result := MessageBox(Hn, PChar(text), PChar(Caption), MB_OK);
      _Y := (Result = 6) or (Result = 1);
      _N := Result = 7;
      _C := Result = 2;

    end;

    procedure TYesOrNoDialog.SetNo(S: Boolean);
    begin
      __SNO := S;
    end;

    procedure TYesOrNoDialog.SetCancel(S: Boolean);
    begin
      __SC := S;
    end;

    end.
