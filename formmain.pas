unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Spin,
  IniFiles ,PasswordGenerator, FormAbout;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure MainFormMenuDefaultSettingsClick(Sender: TObject);
    procedure MainFormMenuExitClick(Sender: TObject);
    procedure MainFormMenuAboutClick(Sender: TObject);
    procedure BtnSetNum4Click(Sender: TObject);
    procedure BtnSetNum8Click(Sender: TObject);
    procedure BtnSetNum12Click(Sender: TObject);
    procedure BtnGenPasswordClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;
  IniFile: TIniFile;

implementation

{$R *.lfm}

{ TMainForm }


procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainForm.Left:= IniFile.ReadInteger('Position', 'X', 25);
  MainForm.Top:= IniFile.ReadInteger('Position', 'Y', 25);
  MainForm.Width:= IniFile.ReadInteger('Size', 'Width', 350);
  MainForm.Height:= IniFile.ReadInteger('Size', 'Height', 570);
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  IniFile.WriteInteger('Position', 'X', MainForm.Left);
  IniFile.WriteInteger('Position', 'Y', MainForm.Top);
  IniFile.WriteInteger('Size', 'Width', MainForm.Width);
  IniFile.WriteInteger('Size', 'Height', MainForm.Height);
end;

procedure TMainForm.MainFormMenuDefaultSettingsClick(Sender: TObject);
begin
  IniFile.WriteInteger('Position', 'X', 25);
  IniFile.WriteInteger('Position', 'Y', 25);
  IniFile.WriteInteger('Size', 'Width', 350);
  IniFile.WriteInteger('Size', 'Height', 570);

  MainForm.Left:= IniFile.ReadInteger('Position', 'X', 25);
  MainForm.Top:= IniFile.ReadInteger('Position', 'Y', 25);
  MainForm.Width:= IniFile.ReadInteger('Size', 'Width', 350);
  MainForm.Height:= IniFile.ReadInteger('Size', 'Height', 570);
end;

procedure TMainForm.MainFormMenuExitClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.MainFormMenuAboutClick(Sender: TObject);
begin
  AboutForm.ShowModal;
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


initialization

if FileExists(GetUserDir + DirectorySeparator + '.ampasswordgenerator.ini') = False then
begin
  IniFile:= TIniFile.Create(GetUserDir + DirectorySeparator + '.ampasswordgenerator.ini');
  IniFile.WriteInteger('Position', 'X', 25);
  IniFile.WriteInteger('Position', 'Y', 25);
  IniFile.WriteInteger('Size', 'Width', 350);
  IniFile.WriteInteger('Size', 'Height', 570);
  IniFile.Free;
end;

IniFile:= TIniFile.Create(GetUserDir + DirectorySeparator + '.ampasswordgenerator.ini');


finalization

IniFile.Free;

end.

