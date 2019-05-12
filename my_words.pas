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
  S := AnsiUpperCase(form1.Memo1.Text);   //Tekst iz fai`la
  Sw := AnsiUpperCase(form1.Edit1.Text);  //Vvedennoe slovo
  Len := Length(S);
  LenW := 0;   //Dlina scherednogo slova
  Cnt := 0;    //Kollichestvo slov sovpadaiushchee s vvedenny`m
  for i := 1 to Len do
  //Esli simvol ne iavliaetsia razdelitelem
    if not(S[i] in D) then begin
    //Uchity`vaem ocherednoi` simvol v dline slova
      Inc(LenW);
      //opredelenie kontca slova
      if (i = Len) or (S[i + 1] in D) then
      begin
      //sveriaem vvedennoe slovo s tekushchim
        if Sw = AnsiUpperCase(Copy(S, i - LenW + 1, LenW)) then
          Inc(Cnt);
          //sbros dliny` slova
        LenW := 0;
      end;

    end;
    form1.Memo2.Text := 'Введенное слово: ' + Sw;
    form1.Memo2.Lines.Add('Найдено слов:' + IntToStr(Cnt));

end;


end.
