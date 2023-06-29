unit Uadd;

interface // ------------------------------------------------------------------

CONST
  RazU = -2;
  RazP = -2;
  RazI = -3;
  RAZN = -1;
  RazM = -1;
  RazR = -1;
  tRazU = '0.00';
  tRazP = '0.00';
  tRazI = '0.000';
  tRAZN = '0.0';
  tRazM = '0.0';
  tRazR = '0.0';

function myformat(s: string; f: double): string;
function myfloat(s: string): double;
function min(a: Integer; b: Integer): Integer;
function maxI(a: Integer; b: Integer): Integer;
function maxF(a: single; b: single): single;
function Point(s: string): string;
function Comma(s: string): string;
function NVLToZero(s: string): string;
function NVLToEmp(s: string): string;
function addzeroend(sin: string; n: Integer): string;
function MyPoint(s: string): string;
function MyComma(s: string): string;
function myZero(s: string): string;
function emp(s: string): string;

implementation // --------------------------------------------------------------

uses System.SysUtils, ustr;

function emp(s: string): string;
begin
  try
    emp := floattostr(strtofloat(s));
  except
    on e: exception do
    begin
      e := nil;
      emp := '0';
    end;
  end;
end;

function myZero(s: string): string;
begin
  if trim(s) = '' then
    myZero := '0'
  else
    myZero := trim(s);
end;

function MyPoint(s: string): string;
begin
  MyPoint := StringReplace(s, '.', ',', [rfReplaceAll, rfIgnoreCase]);
end;

function MyComma(s: string): string;
begin
  MyComma := StringReplace(s, ',', '.', [rfReplaceAll, rfIgnoreCase]);
end;

function addzeroend(sin: string; n: Integer): string;
var
  i: Integer;
  s: string;
begin
  if pos(',', sin) = 0 then
  begin
    s := sin + ',';
    for i := 1 to n do
      s := s + '0';
  end
  else
  begin
    s := sin;
  end;
  addzeroend := s;
end;

{
  ShowMessage('##### : '+FormatFloat('#####', float));
  ShowMessage('00000 : '+FormatFloat('00000', float));
  ShowMessage('0     : '+FormatFloat('0'    , float));
  ShowMessage('#,##0 : '+FormatFloat('#,##0', float));
  ShowMessage(',0    : '+FormatFloat(',0'   , float));
  ShowMessage('');

  // Включение десятичного значения
  ShowMessage('0.#### : '+FormatFloat('0.####', float));
  ShowMessage('0.0000 : '+FormatFloat('0.0000', float));
  ShowMessage('');

  // Научный формат
  ShowMessage('0.0000000E+00 : '+FormatFloat('0.0000000E+00', float));
  ShowMessage('0.0000000E-00 : '+FormatFloat('0.0000000E-00', float));
  ShowMessage('#.#######E-## : '+FormatFloat('#.#######E-##', float));
}
function myformat(s: string; f: double): string;
begin
  myformat := FormatFloat(s, f); //
end;

function myfloat(s: string): double;
var
  v: Integer;
  f: double;
begin
  s := StringReplace(s, ',', '.', [rfReplaceAll, rfIgnoreCase]);
  val(s, f, v);
  if v = 0 then
    myfloat := f
  else
    myfloat := 0;
end;

function min(a: Integer; b: Integer): Integer;
begin
  if a < b then
    result := a
  else
    result := b;
end;

function maxI(a: Integer; b: Integer): Integer;
begin
  if a > b then
    result := a
  else
    result := b;
end;

function maxF(a: single; b: single): single;
begin
  if a > b then
    result := a
  else
    result := b;
end;

function Point(s: string): string;
begin
  Point := strReplace(s, ',', '.');
end;

function Comma(s: string): string;
// Comma := strReplace(s, '.', ',');
begin
  Comma := strReplace(s, '.', ',');
end;

function NVLToZero(s: string): string;
begin
  if s = '' then
    NVLToZero := '0'
  else
    NVLToZero := s;
end;

function NVLToEmp(s: string): string;
begin
  if s = '0' then
    NVLToEmp := ''
  else
    NVLToEmp := s;
end;

end.
