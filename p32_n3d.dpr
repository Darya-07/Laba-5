program p32_n3d;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  UFile in 'UFile.pas',
  UInfo in 'UInfo.pas',
  UShortInfo in 'UShortInfo.pas',
  USort in 'USort.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
