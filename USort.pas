unit USort;

interface

uses
  UFile, UInfo, UShortInfo, SysUtils, StdCtrls;

type
  //класс - файл для сортировки
  TSortFile = class
  private
    f: file of TShortInfo;  //файл
    fName: string;     //имя файла
    fElem: TShortInfo;      //текущий элемент в файле
    fEor,              //признак конца отрезкa
    fEof: Boolean;     //признак конца файла
    fCount: Integer;   //количество записей в файле (для формы)
  public
    constructor Create(s: string);
    destructor Destroy; override;
    procedure ReadNext;
    procedure StartRead;
    procedure StartWrite;
    procedure Close;
    procedure Copy(F2: TSortFile);
    procedure CopyRun(F2: TSortFile);
    procedure Delete;
    procedure PrintToMemo(var memo: TMemo);
    procedure GetFromTFile(var TF: TFile);
    procedure Sort;

    property Eor: boolean
      read fEor
      write fEor;
    property Eof: boolean
      read fEof;
    property Elem: TShortInfo
      read fElem
      write fElem;
    property Name: string
      read fName;
    property Count: Integer
      read fCount;
  end;


implementation

//конструктор
constructor TSortFile.Create(s: string);
begin
  fName:= s;
  AssignFile(f,s);
end;

//деструктор
destructor TSortFile.Destroy;
begin
  inherited;
end;


//процедура, считывающая из файла следущий элемент
procedure TSortFile.ReadNext;
begin
  fEof:= System.Eof(f);
  if not fEof then
    read(f,fElem);
end;

//процедура подготовки файла для чтения
procedure TSortFile.StartRead;
begin
  Reset(f);
  fCount:= FileSize(f);
  ReadNext;
  fEor:= fEof;
end;

//процедура подготовки файла для записи
procedure TSortFile.StartWrite;
begin
  Rewrite(f);
  fCount:= 0;
end;

//закрывает файл
procedure TSortFile.Close;
begin
  CloseFile(f);
end;

//процедура копирования элемента в файл F2
procedure TSortFile.Copy(F2: TSortFile);
begin
  F2.Elem:= fElem;
  write(F2.f,F2.Elem);
  ReadNext;
  fEor:= fEof or (fElem.populationDestiny > F2.Elem.populationDestiny);
end;

//процедура копирования серии элементов в файл F2
procedure TSortFile.CopyRun(F2: TSortFile);
begin
  repeat
    Copy(F2)
  until fEor;
end;

//удаление файла
procedure TSortFile.Delete;
begin
  DeleteFile(fName);
end;

//вывод файла на memo
procedure TSortFile.PrintToMemo(var memo: TMemo);
var
  i: Integer;
begin
  memo.Clear;
  i:= 1;
  StartRead;
  if fEof then
    memo.Lines.Add('<Файл пустой>')
  else
    repeat
      UShortInfo.PrintToMemo(fElem,memo);
      Inc(i);
      ReadNext;
    until fEof;
  CloseFile(f);
end;

//получение из файла TF
procedure TSortFile.GetFromTFile(var TF: TFile);
var
  el: TShortInfo;
begin
  StartWrite;
  TF.StartRead;
  while not TF.Eof do
    begin
      el:= InputInfo(TF.Elem);
      write(f,el);
      TF.ReadNext;
    end;
  fCount:= TF.Count;
  Self.Close;
  TF.Close;
end;

//сортировка по убыванию плотности населения
procedure TSortFile.Sort;
const
  N = 4; //количество файлов (т.к. многопутевое слияние их должно быть больше 2)

type
  TFileArray = array[1..N] of TSortFile;  //массив файлов для сортировки

  //процедура распределения из исходного файла f во вспомогательные файлы в массиве files
  procedure Distribute(var  f: TSortFile; var files: TFileArray);
  var
    i: Integer;
  begin
    f.StartRead;
    for i:=1 to N do
      files[i].StartWrite;
    i:= 1;
    while not f.Eof and (i <= N) do
      begin
        f.CopyRun(files[i]);
        Inc(i);
      end;
    //так как сортировка сбалансированная, то чтобы серии распределялись корректно,
    //необходимо во время записи очередной серии в файл выполнять следующую проверку:
    //если серия является продолжением предыдущей, то записать в этот файл не одну, а две серии
    i:= 1;
    while not f.Eof do
      begin
        if f.Elem.populationDestiny < files[i].Elem.populationDestiny then
          begin
            f.CopyRun(files[i]);
            f.Eor:= f.Eof;
          end;
        f.CopyRun(files[i]);
        f.Eor:= f.Eof;
        i:= (i+1) mod N;
      end;
    f.Close;
    for i:=1 to N do
      files[i].Close;
  end;



  //процедура слияния серий из вспомогательных файлов files в исходный файл f с подсчетом количества серий count
  procedure Merge(var f: TSortFile; var files: TFileArray; var count: Integer);
  var
    i: Integer;
    EOR: Boolean;  //конец текущей серии во всех файлах

    //возвращает индекс файла с максимальным значением текущего элемента серии
    function GetIndexOfFile(var index: Integer): Boolean;
    var
      i: Integer;
      max: Real;
    begin
      Result:= False;
      max:= 2.9e-39; //минимальное значение real
      for i:=1 to N do
        begin
          if not files[i].Eor then
            begin
              if files[i].Elem.populationDestiny > max then
                begin
                  index:= i;
                  max:= files[i].Elem.populationDestiny;
                end;
              Result:= True;
            end;
        end;
    end;

    //возвращает true если все файлы закончены
    function IsEof: Boolean;
    var
      count: Integer;
      i: Integer;
    begin
      count:= 0;
      for i:= 1 to N do
        begin
          if files[i].Eof then
            Inc(count);
        end;
      Result:= count = N;
    end;

  //Merge
  begin
    f.StartWrite;
    for i:=1 to N do
      files[i].StartRead;
    count:= 0; //обнуляем счетчик
    while not IsEof do
      begin
        EOR:= False;
        while not EOR do
          begin
            if GetIndexOfFile(i) then
              files[i].Copy(f)
            else
              EOR:= True;;
          end;
        Inc(count);
      end;
    f.Close;
    for i:=1 to N do
      files[i].Close;
  end;

var
  i: Integer;
  files: TFileArray;
  count: Integer;
begin
  for i:=1 to N do
    files[i]:= TSortFile.Create('help' + IntToStr(i));
  repeat
    Distribute(Self,files);
    Merge(Self,files,count);
  until count <= 1;
  for i:=1 to N do
    begin
      files[i].Delete;
      files[i].Destroy;
    end;
end;

end.
