unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Spin, UFile, UInfo, USort;

type
  TMainForm = class(TForm)
    dlgOpenFile: TOpenDialog;
    mmMainMenu: TMainMenu;
    FileAction: TMenuItem;
    ShowTask: TMenuItem;
    New: TMenuItem;
    Open: TMenuItem;
    mmoOpenedFile: TMemo;
    lblFileName: TLabel;
    btnAddElem: TButton;
    btnRemoveElem: TButton;
    edtName: TEdit;
    lblName: TLabel;
    mmoResult: TMemo;
    btnTask: TButton;
    lblResult: TLabel;
    lblDeleteCountry: TLabel;
    edtDeleteCountry: TEdit;
    cbbContinent: TComboBox;
    lblContinent: TLabel;
    edtCapital: TEdit;
    lblCapital: TLabel;
    edArea: TSpinEdit;
    lblArea: TLabel;
    edPopulation: TSpinEdit;
    lblPopulation: TLabel;
    cbbPoliticalSystem: TComboBox;
    lblPoliticalSystem: TLabel;
    procedure ExitClick(Sender: TObject);
    procedure ShowTaskClick(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure btnAddElemClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure mmoOpenedFileChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRemoveElemClick(Sender: TObject);
    procedure btnTaskClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddElemEnable(value: Boolean);
    procedure NotEmptyEnable(value: Boolean);
  end;

var
  MainForm: TMainForm;
  mainFile: TFile;
  resultFile: TSortFile;
  opened: Boolean;

implementation

{$R *.dfm}

procedure TMainForm.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ShowTaskClick(Sender: TObject);
begin
  ShowMessage('Вывести названия и столицы государств в порядке убывания плотности населения. ' +
    'Применить многопутевое двухфазное естественное сбалансированное слияние');
end;

//сделать добавление элементов доступным
procedure TMainForm.AddElemEnable(value: Boolean);
begin
  lblName.Enabled:= value;
  edtName.Enabled:= value;
  lblContinent.Enabled:= value;
  cbbContinent.Enabled:= value;
  lblCapital.Enabled:= value;
  edtCapital.Enabled:= value;
  lblArea.Enabled:= value;
  edArea.Enabled:= value;
  lblPopulation.Enabled:= value;
  edPopulation.Enabled:= value;
  lblPoliticalSystem.Enabled:= value;
  cbbPoliticalSystem.Enabled:= value;
  btnAddElem.Enabled:= value;
end;

//создание нового файла
procedure TMainForm.NewClick(Sender: TObject);
begin
  dlgOpenFile.FileName:= 'NewFile.foi';
  if dlgOpenFile.Execute then
    if not FileExists(dlgOpenFile.FileName) or
      (MessageDlg('Файл с таким именем уже существует, заменить?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
      begin
        opened:= True;
        mainFile:= TFile.Create(dlgOpenFile.FileName);
        with mainFile do
          begin
            StartWrite;
            Close;
            PrintToMemo(mmoOpenedFile);
          end;
      end;
end;

//добавление элемента
procedure TMainForm.btnAddElemClick(Sender: TObject);
begin
  if (Trim(edtName.Text) = '') or (Trim(edtCapital.Text) = '') or
    (Trim(cbbContinent.Text) = '') or (Trim(cbbPoliticalSystem.Text) = '')
  then
    ShowMessage('Не должно быть пустых значений')
  else
    begin
      mainFile.AddElem(InputInfo(edtName.Text,cbbContinent.Text,
        edtCapital.Text,edArea.Value,edPopulation.Value,cbbPoliticalSystem.Text));
      mainFile.PrintToMemo(mmoOpenedFile);
    end;
end;

//открыть файл
procedure TMainForm.OpenClick(Sender: TObject);
begin
  dlgOpenFile.FileName:= 'File.foi';
  if dlgOpenFile.Execute then
    begin
      if opened then
        mainFile.Destroy
      else
        opened:= True;
      mainFile:= TFile.Create(dlgOpenFile.FileName);
      mainFile.PrintToMemo(mmoOpenedFile);
    end;
end;

//сделать доступным удаление и выполнение задачи
procedure TMainForm.NotEmptyEnable(value: Boolean);
begin
  lblDeleteCountry.Enabled:= value;
  edtDeleteCountry.Enabled:= value;
  btnRemoveElem.Enabled:= value;
  btnTask.Enabled:= value;
end;

//обрезка имени файла (удаляем путь, оставляем только имя)
function GetFileNameFromFullPath(s: string): string;
var
  p: Integer;
begin
  p:= pos('\',s);
  while p <> 0 do
    begin
      Delete(s,1,p);
      p:= pos('\',s);
    end;
  Result:= s;
end;

//действия при изменении файла
procedure TMainForm.mmoOpenedFileChange(Sender: TObject);
begin
  lblFileName.Caption:= GetFileNameFromFullPath(mainFile.Name);
  lblFileName.Enabled:= true;
  mmoOpenedFile.Enabled:= true;
  AddElemEnable(true);
  NotEmptyEnable(mainFile.Count > 0);
end;


procedure TMainForm.FormCreate(Sender: TObject);
begin
  opened:= False;
end;

//удаление записи
procedure TMainForm.btnRemoveElemClick(Sender: TObject);
begin
  if Trim(edtDeleteCountry.Text) = '' then
    ShowMessage('Введите страну для удаления')
  else
    if mainFile.DeleteElem(Trim(edtDeleteCountry.Text)) then
      mainFile.PrintToMemo(mmoOpenedFile)
    else
      ShowMessage('Такой страны в файле нет');
end;

//выполнить задачу
procedure TMainForm.btnTaskClick(Sender: TObject);
begin
  lblResult.Enabled:= True;
  mmoResult.Enabled:= True;
  mmoResult.Clear;
  resultFile:= TSortFile.Create('sort');
  resultFile.GetFromTFile(mainFile);
  with resultFile do
    begin
      if Count > 1 then
        resultFile.Sort;
      resultFile.PrintToMemo(mmoResult);
    end;
  resultFile.Delete;
  resultFile.Destroy;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if opened then
    mainFile.Destroy;
end;


end.
