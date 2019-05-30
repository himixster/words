unit my_words;

interface

function wordsCount(pathToFile: String; wordToSearch: String): Integer;

implementation

uses words, System.SysUtils, System.Classes;

function wordsCount(pathToFile: String; wordToSearch: String): Integer;
const
  D = ['.', ',', ':', ';', '!', '?', '-', ' ', #9, #10, #13];
var
  S, Sw: AnsiString;
  i, Len, LenW, Cnt: Integer;
  strl: TStringList;
begin
  strl := TStringList.Create; // Создается объект типа TSTringList
  strl.LoadFromFile(pathToFile + '111.txt');
  S := strl.Text;
  S := AnsiUpperCase(S); // Текст из файла
  wordToSearch := AnsiUpperCase(wordToSearch); // Введенное слово
  Len := Length(S);
  LenW := 0; // Длина счередного слова
  Result := 0; // Колличество слов совпадающее с введенным
  for i := 1 to Len do
    // Если символ не является разделителем
    if not(S[i] in D) then
    begin
      // Учитываем очередной символ в длине слова
      Inc(LenW);
      // определение конца слова
      if (i = Len) or (S[i + 1] in D) then
      begin
        // сверяем введенное слово с текущим
        if wordToSearch = AnsiUpperCase(Copy(S, i - LenW + 1, LenW)) then
          Inc(Result);
        // сброс длины слова
        LenW := 0;
      end;

    end;
    strl.free;
end;

end.
