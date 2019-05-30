unit words;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Button3: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses my_words;

procedure TForm1.Button1Click(Sender: TObject);
var
  pathToFile: String;
  wordToSearch: String;
  Cnt: Integer;
begin
  SelectDirectory('Укажите путь к файлу', ':\', pathToFile);
  wordToSearch := Edit1.Text;
  Cnt := wordsCount(pathToFile, wordToSearch);
  Memo2.Text := 'Введенное слово: ' + wordToSearch;
  Memo2.Lines.Add('Найдено слов:' + IntToStr(Cnt));
end;

procedure TForm1.Button1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ShowHint := True;
  hint := 'Указать путь к файлу и обработать запрос';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Loadfromfile('111.txt');
end;

end.
