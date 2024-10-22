unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Spin;

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
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }


end.

