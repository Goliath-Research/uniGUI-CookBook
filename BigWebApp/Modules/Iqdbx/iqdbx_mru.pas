unit iqdbx_mru;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  StdCtrls,
  Buttons,
  Registry,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn,
  uniBasicGrid,
  uniStringGrid, uniFileUpload;

type
  TMRUCargo = class
    FileName: TFileName;
    constructor Create(AFileName: TFileName);
  end;

  TFrmIQDBXMRU = class(TUniForm)
    PnlMain: TUniPanel;
    PnlButtons: TUniPanel;
    BitBtn1: TUniBitBtn;
    btnOpenSelected: TUniBitBtn;
    PnlList: TUniPanel;
    lvFiles: TUniStringGrid;
    SelectDBDlg: TUniFileUpload;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenSelectedClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SelectDBDlgCompleted(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
    procedure BuildList;
  public
    { Public declarations }
    FileName: TFileName;
  end;


function DoPromptMRU(var AFileName: TFileName): Boolean;
procedure MRU_AddProject(AFileName: TFileName);
procedure MRU_GetList(var AList: TStringList);
procedure MRU_Clear;

const
  cRegPath = 'Software\IQMS\IQWin32\iqdbx.exe\Recent';


implementation

{$R *.dfm}


uses
  MainModule,
  IQMS.Common.registry;
//  iqdbx_shared;

function DoPromptMRU(var AFileName: TFileName): Boolean;
var
  FrmIQDBXMRU : TFrmIQDBXMRU;
begin
  FrmIQDBXMRU := TFrmIQDBXMRU.Create(UniApplication);

  AFileName := '';
  with FrmIQDBXMRU do
    begin
      Result := ShowModal = mrOk;
      if Result then
        AFileName := FileName;
    end;
end;

procedure MRU_AddProject(AFileName: TFileName);
var
  AKey, AIndexList: string;
  i, AIndex: Integer;
  AList: TStringList;
begin
  try
    AList := TStringList.Create;
    try
      MRU_GetList(AList); // get the current list
      // delete the file from the list
      i := AList.IndexOf(AFileName);
      if i > -1 then
        AList.Delete(i);
      // add the file in first position
      AList.InsertObject(0, AFileName, TMRUCargo.Create(AFileName));
      MRU_Clear; // clear the Registry entries

      // initialization
      AIndexList := '';

      with TIQWebRegistry.Create do
        try
          RootKey := HKEY_CURRENT_USER;
          if OpenKey(cRegPath, TRUE) then
            begin
              for i := 0 to AList.Count - 1 do
                begin
                  if i = 10 then
                    BREAK;
                  AKey := 'MRU_' + IntToStr(i + 1);
                  AFileName := Trim(AList.Strings[i]);

                  if not Assigned(AList.Objects[i]) then
                    CONTINUE;

                  if AFileName > ' ' then
                    begin
                      WriteString(AKey, AFileName);
                      if (AIndexList > '') then
                        AIndexList := AIndexList + ';' + IntToStr(i)
                      else
                        AIndexList := IntToStr(AIndex);
                    end;
                end;
              if (AIndexList > '') then
                WriteString('MRU_Index', AIndexList);
            end;
        finally
          Free;
        end;
    finally
      AList.Free;
    end;
  except // do nothing
  end;
end;

procedure MRU_GetList(var AList: TStringList);
var
  i { , AFileIndex, AIndex } : Integer;
  AKey, AFileName { AIndexString, ATemp } : string;
  // AIndexList: TStringList;
begin
  if not Assigned(AList) then
    AList := TStringList.Create;

  try
    AList.Clear;
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(cRegPath, FALSE) then
          try
            for i := 1 to 10 do
              begin
                AKey := 'MRU_' + IntToStr(i);
                if (ValueExists(AKey)) and (ReadString(AKey) > ' ') then
                  begin
                    // Inc(AFileIndex);
                    AFileName := ReadString(AKey);
                    // ATemp     := AIndexList.Strings[AFileIndex];
                    AList.AddObject(AFileName, TMRUCargo.Create(AFileName));
                  end;
              end;
          finally
            // if Assigned(AIndexList) then FreeAndNil(AIndexList);
          end;
      finally
        Free;
      end;
  except // do nothing
  end;
end;

procedure MRU_Clear;
var
  i: Integer;
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        // Clear the old items from the Registry
        if OpenKey(cRegPath, TRUE) then
          begin
            CloseKey;
            DeleteKey(cRegPath);
          end;
      finally
        Free;
      end;
  except // silent
  end;
end;

{ TMRUCargo }

constructor TMRUCargo.Create(AFileName: TFileName);
begin
  FileName := AFileName;
end;

{ TFrmIQDBXMRU }

procedure TFrmIQDBXMRU.FormCreate(Sender: TObject);
begin
  BuildList;
end;

procedure TFrmIQDBXMRU.SelectDBDlgCompleted(Sender: TObject;
  AStream: TFileStream);
begin
  FileName := AStream.FileName;

  if not FileExists(FileName) then
    raise Exception.Create('Cannot find project file.');

  // MRU_AddProject(FileName);

  ModalResult := mrOk;
end;

procedure TFrmIQDBXMRU.BuildList;
var
  AList: TStringList;
  i, aCol: Integer;
begin
  try
    lvFiles.BeginUpdate;
    AList := TStringList.Create;
    try
      MRU_GetList(AList);
      lvFiles.RowCount:=1;
      aCol:=0;
      for i := 0 to AList.Count - 1 do
        if FileExists(AList.Strings[i]) then
          with lvFiles do
            begin
              Cells[0,aCol]:= ExtractFileName(AList.Strings[i]);
              Cells[1,aCol]:= ExtractFilePath(AList.Strings[i]);

//              Data := TMRUCargo(AList.Objects[i]);
              RowCount:=RowCount+1;
              aCol:=aCol+1;
            end;
    finally
      FreeAndNil(AList);
    end;
  finally
    lvFiles.EndUpdate;
  end;
end;

procedure TFrmIQDBXMRU.btnOpenSelectedClick(Sender: TObject);
begin

  if (lvFiles.Col=-1) or (lvFiles.Cells[lvFiles.Col,lvFiles.Row]='') then
    raise Exception.Create('Please select a file from the list.');

  FileName := lvFiles.Cells[0,lvFiles.Row];

  if not FileExists(FileName) then
    raise Exception.Create('Cannot find project file.');

  ModalResult := mrOk;
end;

procedure TFrmIQDBXMRU.BitBtn1Click(Sender: TObject);
begin
  SelectDBDlg.Execute;
end;

end.
