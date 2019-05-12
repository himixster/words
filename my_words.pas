unit my_words;

interface

procedure mywords;

implementation

uses words, System.SysUtils;

procedure mywords;
const
  D = ['.', ',', ':', ';', '!', '?', '-', ' ', #9, #10, #13];
var
  S, Sw: AnsiString;
  i, Len, LenW, Cnt: Integer;
begin
  S := AnsiUpperCase(form1.Memo1.Text);   //Текст из файла
  Sw := AnsiUpperCase(form1.Edit1.Text);  //Введенное слово
  Len := Length(S);
  LenW := 0;   //Длина счередного слова
  Cnt := 0;    //Колличество слов совпадающее с введенным
  for i := 1 to Len do
  //Если символ не является разделителем
    if not(S[i] in D) then begin
    //Учитываем очередной символ в длине слова
      Inc(LenW);
      //определение конца слова
      if (i = Len) or (S[i + 1] in D) then
      begin
      //сверяем введенное слово с текущим
        if Sw = AnsiUpperCase(Copy(S, i - LenW + 1, LenW)) then
          Inc(Cnt);
          //сброс длины слова
        LenW := 0;
      end;

    end;
    form1.Memo2.Text := 'Введенное слово: ' + Sw;
    form1.Memo2.Lines.Add('Найдено слов:' + IntToStr(Cnt));

end;


end.
