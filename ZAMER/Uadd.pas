unit Uadd;


interface //------------------------------------------------------------------

function myfloat(s: string): double;
function min(a: Integer; b: Integer): Integer;
function maxI(a: Integer; b: Integer): Integer;
function maxF(a: single; b: single): single;
function Point(s: string): string;
function Comma(s: string): string;
function NVLToZero(s: string): string;
function NVLToEmp(s: string): string;

implementation //--------------------------------------------------------------
  uses ustr;


function myfloat(s: string): double;
var
  v: Integer;
  f: double;
begin
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
//  Comma := strReplace(s, '.', ',');
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
