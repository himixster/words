unit my_words;

interface

function wordsCount(pathToFile: String; wordToSearch: String): String;

implementation

uses words, System.SysUtils;

function wordsCount(pathToFile: String; wordToSearch: String): String;
const
  D = ['.', ',', ':', ';', '!', '?', '-', ' ', #9, #10, #13];
var
  S, Sw: AnsiString;
  i, Len, LenW, Cnt: Integer;
begin

  pathToFile := AnsiUpperCase(pathToFile);
  wordToSearch := AnsiUpperCase(wordToSearch);
  Len := Length(pathToFile);
  LenW := 0;
  Cnt := 0;
  for i := 1 to Len do
    if not(pathToFile[i] in D) then
    begin
      Inc(LenW);
      if (i = Len) or (pathToFile[i + 1] in D) then
      begin
        if wordToSearch = AnsiUpperCase(Copy(pathToFile, i - LenW + 1, LenW)) then
          Inc(Cnt);
        LenW := 0;
      end;

    end;
//    form1.Memo2.Text := 'Введенное слово: ' + Sw;
//    form1.Memo2.Lines.Add('Найдено слов:' + IntToStr(Cnt));

end;


end.

