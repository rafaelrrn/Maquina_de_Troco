program QM_2;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uIMaquina in 'Interfaces\uIMaquina.pas',
  uMaquina in 'Interfaces\uMaquina.pas',
  uTroco in 'uTroco.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
