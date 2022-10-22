unit IQMS.Common.SHFileOp;
{
  Copyright © 1997 WinWright Consulting
  Written by Wayne Niddery

  You may use this code freely in any project, commercial included, as long
  as the this entire comment section, including copyright and credit, remains
  intact. You may redistribute this code to others, and/or a compiled version
  thereof, as freeware only.
}

interface

uses Winapi.Windows, Winapi.ShellAPI, System.SysUtils, System.Classes,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys;
  // db_dm;

type
  TSHFileOpCode = (foCopy, foMove, foRename, foDelete);

  TIQWebShellFileOp = class(TComponent)
  private
    FileOpStruct: TSHFileOpStruct;
    FHandle: THandle;
    FFilesOnly: boolean;
    FNoConfirmation: boolean;
    FAutoMakeDir: boolean;
    FUseRecycleBin: boolean;
    FRenameOnCollision: boolean;
    FAnimate: boolean;
    FProgressTitle: string;

    FileList: TStringList;
    FDestination: string;

    procedure BuildFlags;
    function BuildList(list: TStrings): String;
    procedure Cleanup;
    function Execute(Op: integer): boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddTarget(const fname: string);
    procedure AddTargets(flist: TStrings);
    function CopyFiles(const dest: string): boolean;
    function MoveFiles(const dest: string): boolean;
    function RenameFiles(const dest: string): boolean;
    function DeleteFiles: boolean;
    function RecycleFiles: boolean;
    property ParentHandle: THandle read FHandle write FHandle;
  published
    // flags
    property FilesOnly: Boolean read FFilesOnly write FFilesOnly;
    property NoConfirmation: Boolean read FNoConfirmation write FNoConfirmation;
    property AutoMakeDir: Boolean read FAutoMakeDir write FAutoMakeDir;
    property RenameOnCollision: Boolean read FRenameOnCollision write FRenameOnCollision;
    property Animate: Boolean read FAnimate write FAnimate;
    property ProgressTitle: string read FProgressTitle write FProgressTitle;
  end;

// procedure Register;

implementation

// procedure Register;
// begin
//   RegisterComponents('WinWright', [TIQWebShellFileOp]);
// end;

constructor TIQWebShellFileOp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FileList := TStringList.Create;
  FileList.Sorted := True; FileList.Duplicates := dupIgnore;
end;

destructor TIQWebShellFileOp.Destroy;
begin
  FileList.Free;
  inherited Destroy;
end;

procedure TIQWebShellFileOp.BuildFlags;
begin
  with FileOpStruct do begin
    wnd := FHandle;
    fFlags := 0;
    if FFilesOnly then            fFlags := fFlags or FOF_FilesOnly;
    if FNoConfirmation then       fFlags := fFlags or FOF_NoConfirmation;
    if not FAnimate then          fFlags := fFlags or FOF_Silent;
    if FUseRecycleBin then        fFlags := fFlags or FOF_AllowUndo;

    if Length(FProgressTitle) > 0 then begin
      fFlags := fFlags or FOF_SimpleProgress;
      lpszProgressTitle := PWideChar(FProgressTitle);
    end;

    if wFunc <> FO_Delete then begin
      if FAutoMakeDir then        fFlags := fFlags or FOF_NoConfirmMkDir;
      if FRenameOnCollision then  fFlags := fFlags or FOF_RenameOnCollision;
    end;
    hNameMappings := nil;
  end;
end;

function TIQWebShellFileOp.BuildList(list: TStrings): String;
var
  i:Integer;
begin
  Result:= '';
  for i := 0 to list.Count - 1 do
    Result := Result + ExcludeTrailingPathDelimiter(list.Strings[i]) + #0;

  Result := Result + #0;
end;

function TIQWebShellFileOp.Execute(Op: integer): boolean;
begin
  if (FileList.Count > 0) then
    begin
      FileOpStruct.pFrom := PWideChar(BuildList(FileList));
      FileOpStruct.pTo   := PWideChar(FDestination);

      FileOpStruct.wFunc := Op;
      BuildFlags;

      SHFileOperation(FileOpStruct);

      Result := not FileOpStruct.fAnyOperationsAborted;

      Cleanup;
    end
  else
    Result := False;
end;

procedure TIQWebShellFileOp.Cleanup;
begin
  FileList.Clear;
end;

function TIQWebShellFileOp.CopyFiles(const dest: string): boolean;
begin
  FDestination := dest;
  Result := Execute(FO_Copy);
end;

function TIQWebShellFileOp.MoveFiles(const dest: string): boolean;
begin
  FDestination := dest;
  Result := Execute(FO_Move);
end;

function TIQWebShellFileOp.RenameFiles(const dest: string): boolean;
begin
  FDestination := dest;
  Result := Execute(FO_Rename);
end;

function TIQWebShellFileOp.DeleteFiles: boolean;
begin
  FUseRecycleBin := False;
  Result := Execute(FO_Delete);
end;

function TIQWebShellFileOp.RecycleFiles: boolean;
begin
  FUseRecycleBin := True;
  Result := Execute(FO_Delete);
end;

procedure TIQWebShellFileOp.AddTarget(const fname: string);
begin
  FileList.Add(fname);
end;

procedure TIQWebShellFileOp.AddTargets(flist: TStrings);
begin
  FileList.AddStrings(flist);
end;

end.
