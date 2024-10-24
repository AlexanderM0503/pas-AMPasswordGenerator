unit FormAbout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    ProgramIcon: TImage;
    LabelProgramName: TLabel;
    LabelProgramDescription: TLabel;
    LabelCopyright: TLabel;
  private

  public

  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.lfm}

end.

