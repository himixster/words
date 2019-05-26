unit words;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pathToFile:String;
  wordToSearch:String;
  Cnt: Integer;


implementation

{$R *.dfm}

uses my_words;

procedure TForm1.Button1Click(Sender: TObject);

begin
  pathToFile := Memo1.Text;
  wordToSearch :=  Edit1.Text;
  wordsCount(pathToFile, wordToSearch);

  Memo2.Text := 'Введенное слово: ' + wordToSearch;
   Memo2.Lines.Add('Найдено слов:' + IntToStr(Cnt));

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
