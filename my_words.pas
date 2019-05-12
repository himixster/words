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
  S := AnsiUpperCase(form1.Memo1.Text);
  Sw := AnsiUpperCase(form1.Edit1.Text);
  Len := Length(S);
  LenW := 0;
  Cnt := 0;
  for i := 1 to Len do
    if not(S[i] in D) then
    begin
      Inc(LenW);
      if (i = Len) or (S[i + 1] in D) then
      begin
        if Sw = AnsiUpperCase(Copy(S, i - LenW + 1, LenW)) then
          Inc(Cnt);
        LenW := 0;
      end;

    end;
    form1.Memo2.Text := 'Введенное слово: ' + Sw;
    form1.Memo2.Lines.Add('Найдено слов:' + IntToStr(Cnt));

end;


end.
