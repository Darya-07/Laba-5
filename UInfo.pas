unit UInfo;

interface

uses
  StdCtrls;

type
  //запись - информация о странах
  TInfo = record
    name: string[40];
    continent: string[20];
    capital: string[40];
    area: LongInt;
    population: LongInt;
    politicalSystem: string[20];
  end;

  function InputInfo(aName, aContinent, aCapital: string; aArea, aPopulation: LongInt;
    aPoliticalSystem: string): TInfo;
  procedure PrintToMemo(var info: TInfo; var memo: TMemo);

implementation

uses
  SysUtils;

//ввод информации о конфетах
function InputInfo(aName, aContinent, aCapital: string; aArea, aPopulation: LongInt;
    aPoliticalSystem: string): TInfo;
begin
  with Result do
    begin
      name:= aName;
      continent:= aContinent;
      capital:= aCapital;
      area:= aArea;
      population:= aPopulation;
      politicalSystem:= aPoliticalSystem;
    end;
end;

//печать информации на memo
procedure PrintToMemo(var info: TInfo; var memo: TMemo);
begin
  with info, memo do
    begin
      Lines.Add('Название: ' + info.name);
      Lines.Add('Континент: ' + continent);
      Lines.Add('Столица: ' + capital);
      Lines.Add('Площадь: ' + IntToStr(area) + ' км^2');
      Lines.Add('Численность населения: ' + IntToStr(population) + ' человек');
      Lines.Add('Государственный строй: ' + politicalSystem);
      Lines.Add('');
    end;  
end;  

end.
