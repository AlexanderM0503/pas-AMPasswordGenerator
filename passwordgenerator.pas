unit PasswordGenerator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function GetCharUp(): String;
function GetCharLow(): String;
function GetDigit(): String;
function GetSpChar(): String;
function GetPasswordString(charUp, charLow, digit, spChar: Boolean; num: Integer): String;


implementation

function GetCharUp(): String;
var
  charUp: array[0..25] of String = ( 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' );
begin
  GetCharUp:= charUp[Random(26)];
end;

function GetCharLow(): String;
var
  charLow: array[0..25] of String = ( 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'k', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' );
begin
  GetCharLow:= charLow[Random(26)];
end;

function GetDigit(): String;
var
  digit: array[0..9] of String = ( '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' );
begin
  GetDigit:= digit[Random(10)];
end;

function GetSpChar(): String;
var
  spChar: array[0..27] of String = ('!', '"', '$', '%', '&', '(', ')', '+', ',', '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', ']', '^', '_', '{', '|', '}', '~', '`');
begin
  GetSpChar:= spChar[Random(28)];
end;

function GetPasswordString(charUp, charLow, digit, spChar: Boolean; num: Integer): String;
var
  passwordString: String;
  i, iChar: Integer;
begin
  passwordString:= '';
  i:= 0;

  while i < num do
  begin
    iChar:= Random(4);

    if (charUp = True) and (iChar = 0) then passwordString:= passwordString + GetCharUp();
    if (charLow = True) and (iChar = 1) then passwordString:=passwordString + GetCharLow();
    if (digit = True) and (iChar = 2) then passwordString:= passwordString + GetDigit();
    if (spChar = True) and (iChar = 3) then passwordString:= passwordString + GetSpChar();

    i:= Length(passwordString);
  end;

  GetPasswordString:= passwordString;
end;


initialization

Randomize;

end.

