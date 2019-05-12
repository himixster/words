program words_proj;

uses
  Vcl.Forms,
  words in 'words.pas' {Form1},
  my_words in 'my_words.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
