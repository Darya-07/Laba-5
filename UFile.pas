unit UFile;

interface

uses
  UInfo, SysUtils, StdCtrls;

type
  //класс - файл
  TFile = class
  private
    f: file of TInfo;  //файл
    fName: string;     //имя файла
    fElem: TInfo;      //текущий элемент в файле
    fEof: Boolean;     //признак конца файла
    fCount: Integer;   //количество записей в файле (для формы)
  public
    constructor Create(s: string);
    destructor Destroy; override;
    procedure ReadNext;
    procedure StartRead;
    procedure StartWrite;
    procedure Close;
    procedure AddElem(el: TInfo);
    function DeleteElem(s:String): Boolean;
    procedure Delete;
    procedure PrintToMemo(var memo: TMemo);

    property Eof: boolean
      read fEof;
    property Elem: TInfo
      read fElem
      write fElem;
    property Name: string
      read fName;
    property Count: Integer
      read fCount;
  end;


implementation

//конструктор
constructor TFile.Create(s: string);
begin
  fName:= s;
  AssignFile(f,s);
end;

//деструктор
destructor TFile.Destroy;
begin
  inherited;
end;


//процедура, считывающая из файла следущий элемент
procedure TFile.ReadNext;
begin
  fEof:= System.Eof(f);
  if not fEof then
    read(f,fElem);
end;

//процедура подготовки файла для чтения
procedure TFile.StartRead;
begin
  Reset(f);
  fCount:= FileSize(f);
  ReadNext;
end;

//процедура подготовки файла для записи
procedure TFile.StartWrite;
begin
  Rewrite(f);
  fCount:= 0;
end;

//закрывает файл
procedure TFile.Close;
begin
  CloseFile(f);
end;


//процедура добавления элемента в конец файла
procedure TFile.AddElem(el: TInfo);
begin
  Reset(f);
  Seek(f, FileSize(f));
  write(f,el);
  Inc(fCount);
  CloseFile(f);
end;

//процедура удаления элемента
//возвращает false если такой страны нет в файле
function TFile.DeleteElem(s: string): Boolean;
var
  el: TInfo;
  size, n: Integer;
begin
  Result:= false;
  Reset(f);
  n:= 0;
  size:= FileSize(f);
  while not Result and (n < size) do
    begin
      read(f,el);
      if el.name = s then
        begin
          Seek(f, size-1);
          if n < size-1 then
            begin
              //заменяем запись n на последнюю
              read(f,el);
              Seek(f,n);
              write(f,el);
              Seek(f,size-1);
            end;
          //последнюю запись обрезаем
          Truncate(f);
          Result:= True;
          Dec(fCount);
        end;
      Inc(n)
    end;
  CloseFile(f);
end;

//удаление файла
procedure TFile.Delete;
begin
  DeleteFile(fName);
end;

//вывод файла на memo
procedure TFile.PrintToMemo(var memo: TMemo);
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
      UInfo.PrintToMemo(fElem,memo);
      Inc(i);
      ReadNext;
    until fEof;
  CloseFile(f);
end;

end.
