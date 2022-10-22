unit IQMS.Common.CheckPoint;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  System.SyncObjs,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniMemo, Vcl.Controls;

type
  TFrmCheckPointList = class(TUniForm)
    Panel1: TUniPanel;
    RichEdit1: TUniMemo;
    pnlBtns: TUniPanel;
    btnRefresh: TUniButton;
    btnClear: TUniButton;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FFileName: string;
    procedure SetFileName(AFileName: string);
  public
    { Public declarations }
    class procedure DoShow( AModal: Boolean = FALSE; AFileName: string = '' );
    class procedure Add( S: string; AFileName: string = ''; AMaxLength: Integer = 2000 );
    class procedure BackupLogExceeding( ASize: Integer; AFileName: string = '' );

    property Filename:string read FFileName Write SetFileName;
  end;

var
  CheckPointFileName: string;

implementation

{$R *.DFM}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls,
  IQMS.Common.FileUtils,
  IQMS.Common.StringUtils,
  IQMS.Common.ResStrings,
  IQMS.Common.MsgFrmTm;

var
  CS_Lines : TCriticalSection;

class procedure TFrmCheckPointList.DoShow( AModal: Boolean = FALSE; AFileName: string = '' );
var
  AForm : TFrmCheckPointList;
begin
  if not AModal then
  begin
    AForm := uniGUIApplication.UniSession.UniMainModule.GetFormInstance(TFrmCheckPointList) as TFrmCheckPointList;
    AForm.Filename := AFileName;
    AForm.Show;
  end
  else
  begin
    AForm := TFrmCheckPointList.Create( uniGUIApplication.UniApplication );
  end;
end;

procedure TFrmCheckPointList.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmCheckPointList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmCheckPointList.SetFileName(AFileName: string);
begin
  FFileName:= Nz( AFileName, CheckPointFileName );

  btnRefreshClick( NIL );
  Caption:= Format(IQMS.Common.ResStrings.cTXT0000073 {'Check Point List (%s)'}, [ FFileName ]);
end;

procedure TFrmCheckPointList.btnClearClick(Sender: TObject);
begin
  if not IQConfirmYN( IQMS.Common.ResStrings.cTXT0000074 {'Are you sure you want to clear log file?'} ) then
     EXIT;

  CS_Lines.Acquire;
  try
    DeleteFile( FFileName );
  finally
    CS_Lines.Release;
  end;
  btnRefreshClick( NIL );
end;

procedure TFrmCheckPointList.btnRefreshClick(Sender: TObject);
begin
  if FileExists( FFileName ) then
     RichEdit1.Lines.LoadFromFile( FFileName )
  else
     RichEdit1.Lines.Clear;
end;

procedure TFrmCheckPointList.Exit1Click(Sender: TObject);
begin
  Close;
end;

class procedure TFrmCheckPointList.Add( S: string; AFileName: string = ''; AMaxLength: Integer = 2000 );
var
  Stream: TStream;
  ALine : AnsiString;
  procedure AppendToFile;
  begin
    try
      {Open file stream}
      if not FileExists( AFileName ) then
         Stream:= TFileStream.Create( AFileName, fmCreate )
      else
         Stream:= TFileStream.Create( AFileName, fmOpenReadWrite );

      {Write to a file}
      try
        Stream.Seek(0, soFromEnd);
        Stream.WriteBuffer( Pointer(ALine)^, Length(ALine) );
      finally
        Stream.Free;
      end;
    except on E: Exception do
      // 'Unable to write to file %s. Encountered Error: %s'
      // IQError( Format( IQMS.Common.ResStrings.cTXT0000075, [ AFileName, E.Message ]));
      // IQShowStrTimed( 'Error', Format( IQMS.Common.ResStrings.cTXT0000075, [ AFileName, E.Message ]), mtError ) {IQMsgFrmTm.pas}
      {cannot create a form under thread control Jan-29-04}
    end;
  end;
begin
  AFileName:= Nz( AFileName, CheckPointFileName );

  try
    CS_Lines.Acquire;
    try
      {Format new line}
      if S > '' then
        begin
          if AMaxLength > 0 then
             ALine:= Format(#13#10'%-20s %s', [ FormatDateTime('mm/dd/yy hh:nn:ss', Now), IQMS.Common.StringUtils.LeftStr(S, AMaxLength) ])
          else
             ALine:= Format(#13#10'%-20s %s', [ FormatDateTime('mm/dd/yy hh:nn:ss', Now), S ])
        end
      else
         ALine:= ' ';

      AppendToFile;

    finally
      CS_Lines.Release;
    end;
  except
    {supress any internal exceptions}
  end;
end;


class procedure TFrmCheckPointList.BackupLogExceeding( ASize: Integer; AFileName: string = '' );
var
  ABackupFileName: string;
begin
  AFileName:= Nz( AFileName, CheckPointFileName );

  if IQGetFileSize( AFileName ) >= ASize then   {IQMS.Common.FileUtils.pas}
  try
    CS_Lines.Acquire;
    try
      ABackupFileName:= ChangeFileExt( AFileName, '.bak' );

      if FileExists( ABackupFileName ) then
         DeleteFile( ABackupFileName );

      if RenameFile( AFileName, ABackupFileName ) then
         // 'Log file %s was renamed to %s'
         TFrmCheckPointList.Add( Format(IQMS.Common.ResStrings.cTXT0000076, [ AFileName, ABackupFileName ]))
      else
         // 'Unable to rename log file %s to %s'
         TFrmCheckPointList.Add( Format(IQMS.Common.ResStrings.cTXT0000077, [ AFileName, ABackupFileName ]));

    finally
      CS_Lines.Release;
    end;
  except
    {supress any internal exceptions}
  end;
end;

initialization
  CS_Lines := TCriticalSection.Create;
  CheckPointFileName := IQGetLocalHomePath + 'IQCheckPointList.txt';  { IQMisc }

finalization
  CS_Lines.Free;

end.
