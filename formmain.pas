unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Spin,
  PasswordGenerator;

type

  { TMainForm }

  TMainForm = class(TForm)
    MainFormMenu: TMainMenu;
    MainFormMenuFile: TMenuItem;
    MainFormMenuDefaultSettings: TMenuItem;
    MainFormMenuSep1: TMenuItem;
    MainFormMenuExit: TMenuItem;
    MainFormMenuHelp: TMenuItem;
    MainFormMenuAbout: TMenuItem;
    GroupNumChars: TGroupBox;
    NumChars: TSpinEdit;
    BtnSetNum4: TButton;
    BtnSetNum8: TButton;
    BtnSetNum12: TButton;
    GroupCharTypes: TGroupBox;
    CharUp: TCheckBox;
    CharLow: TCheckBox;
    Digit: TCheckBox;
    SpChar: TCheckBox;
    GroupPassword: TGroupBox;
    PasswordString: TEdit;
    BtnGenPassword: TButton;
    procedure MainFormMenuExitClick(Sender: TObject);
    procedure BtnSetNum4Click(Sender: TObject);
    procedure BtnSetNum8Click(Sender: TObject);
    procedure BtnSetNum12Click(Sender: TObject);
    procedure BtnGenPasswordClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }


procedure TMainForm.MainFormMenuExitClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.BtnSetNum4Click(Sender: TObject);
begin
  NumChars.Value:= 4;
end;

procedure TMainForm.BtnSetNum8Click(Sender: TObject);
begin
  NumChars.Value:= 8;
end;

procedure TMainForm.BtnSetNum12Click(Sender: TObject);
begin
  NumChars.Value:= 12;
end;

procedure TMainForm.BtnGenPasswordClick(Sender: TObject);
begin
  if CharUp.Checked or CharLow.Checked or Digit.Checked or SpChar.Checked then
    PasswordString.Text:= GetPasswordString(CharUp.Checked, CharLow.Checked, Digit.Checked, SpChar.Checked, NumChars.Value)
  else
    PasswordString.Text:= 'Не выбраны типы символов';
end;

end.

