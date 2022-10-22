unit PRW2Custom;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Comp.DataMove,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.VCLUI.Wait,
  Data.DB,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmPRW2Custom = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Clear1: TUniMenuItem;
    LoadSql1: TUniMenuItem;
    SaveSql1: TUniMenuItem;
    N1: TUniMenuItem;
    Export1: TUniMenuItem;
    N2: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    sbExport: TUniSpeedButton;
    sbSave: TUniSpeedButton;
    SbLoad: TUniSpeedButton;
    SbClear: TUniSpeedButton;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    sbout: TUniSpeedButton;
    edOut: TUniEdit;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    RE: TRichEdit;
    IQAbout1: TIQWebAbout;
    SaveDialogLogFile: TSaveDialog;
    OpenDialogScript: TOpenDialog;
    Qry: TFDQuery;
    SD: TSaveDialog;
    Table1: TFDTable;
    BatchMove1: TFDDataMove;
    SaveDialog1: TSaveDialog;
    Database1: TFDConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clear1Click(Sender: TObject);
    procedure LoadSql1Click(Sender: TObject);
    procedure SaveSql1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure CreateTextFile(cFile:String);
    procedure WriteToFile(cFile:String);
    procedure Exit1Click(Sender: TObject);
    procedure sboutClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FUserName:String;
    FRSState:String;
    FScriptFile: string;
    FHeaderID: string;
    procedure SetHeaderID(const Value: string);
    procedure SetOutPutFile(const Value: string);
    procedure SetRSState(const Value: String);
    procedure SetScriptFile(const Value: string);
  public
    { Public declarations }

    property HeaderID: string read FHeaderID write SetHeaderID;
    property ScriptFile: string read FScriptFile write SetScriptFile;
    property OutPutFile: string write SetOutPutFile;
    property RSState: String read FRSState write SetRSState;
  end;

procedure DoPRW2Custom(AHeaderID:Real; AScriptFile, AOutPutFile:String; ARSState:String = '');


implementation
{$R *.dfm}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  StrUtils;

procedure DoPRW2Custom(AHeaderID:Real; AScriptFile, AOutPutFile:String; ARSState:String = '');
var
  LFrmPRW2Custom : TFrmPRW2Custom;
  ACount:Integer;
  i:integer;
begin
  LFrmPRW2Custom := TFrmPRW2Custom.Create(uniGUIApplication.UniApplication);
  LFrmPRW2Custom.OutPutFile:= AOutPutFile;
  LFrmPRW2Custom.ScriptFile := AScriptFile;
  LFrmPRW2Custom.HeaderId := FloatToStr(AHeaderId);
  LFrmPRW2Custom.RSState := ARSState;
  LFrmPRW2Custom.FUserName   := SecurityManager.UserName;
  if not FileExists(LFrmPRW2Custom.FScriptFile) then
  begin
    LFrmPRW2Custom.BringToFront;
    LFrmPRW2Custom.LoadSql1Click(nil);
  end
  else
  begin
    LFrmPRW2Custom.re.Lines.LoadFromFile( LFrmPRW2Custom.FScriptFile );
    for i := 0 to LFrmPRW2Custom.re.Lines.Count - 1 do
    begin
      LFrmPRW2Custom.re.Lines[i] := StrTran(LFrmPRW2Custom.re.Lines[i], '^NHEADER_ID', LFrmPRW2Custom.FHeaderId);
      LFrmPRW2Custom.re.Lines[i] := StrTran(LFrmPRW2Custom.re.Lines[i], '^NSTATE', LFrmPRW2Custom.FRSState);
    end;
  end;
  LFrmPRW2Custom.ShowModal;
end;

procedure TFrmPRW2Custom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmPRW2Custom.Clear1Click(Sender: TObject);
begin
  RE.Lines.Clear;
end;

procedure TFrmPRW2Custom.LoadSql1Click(Sender: TObject);
begin
  Clear1Click(nil);
  if OpenDialogScript.Execute then
    re.Lines.LoadFromFile( OpenDialogScript.FileName );
end;

procedure TFrmPRW2Custom.SaveSql1Click(Sender: TObject);
begin
  if (re.Lines.Count > 0) and SaveDialogLogFile.Execute then
    re.Lines.SaveToFile( SaveDialogLogFile.FileName );
end;

procedure TFrmPRW2Custom.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPRW2Custom.FormResize(Sender: TObject);
begin
  sbOut.top := edOut.top - 1;
  sbOut.left := edOut.left + edout.width + 2;
end;

procedure TFrmPRW2Custom.Export1Click(Sender: TObject);
var
  i:Integer;
  ALine:String;
begin
  if (re.Lines.Count = 0) then
    raise Exception.Create('No Sql script found');
  with Qry do
  begin
    Close;
    Sql.Clear;
//    ParamCheck  := FALSE;                             // 08-25-2011 XE
    for i := 0 to re.Lines.Count - 1 do
    begin
      ALine := re.Lines[i];
      ALine := StrTran(ALine, '^NHEADER_ID', FHeaderId );
      ALine := StrTran(ALine, '^NSTATE', FRSState);
      Sql.Add(ALine);
    end;
    ExecuteCommandFmt('delete from PRW2_output where userid = ''%s''', [FUsername]);
    Sql.Text:= System.StrUtils.ReplaceStr( Sql.Text, '::=', ':=' );  // 08-25-2011 XE
    ExecSql;
  end;
  CreateTextFile(edOut.text);
  WriteToFile(edOut.text);
  IqConfirm(Format('File %s prepared. This file name must remain W2REPORT, without a file extension.', [edOut.text]));
//  FClose := True;
end;

procedure TFrmPRW2Custom.CreateTextFile(cFile:String);
var
  MyFile:TextFile;
begin
  AssignFile(MyFile, cFile);
  Rewrite(MyFile);
  CloseFile(MyFile);
end;

procedure TFrmPRW2Custom.WriteToFile(cFile:String);
var
  AFile:TextFile;
  AStr:String;
begin
  try
    AssignFile(AFile, cFile);
    Append(AFile);
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(Format('select text_line from prw2_output where userid = ''%s'' order by id', [FUserName]));
      Open;
      while not eof do
      begin
        AStr := RTrim(FieldByName('text_line').asString);
        AStr := StrTran(AStr, '_', ' ');
        WriteLn(AFile, AStr);
        next;
      end;
    finally
      free;
    end;
  finally
    CloseFile(AFile);
  end;
end;



procedure TFrmPRW2Custom.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPRW2Custom.sboutClick(Sender: TObject);
begin
  with SD do
  if Execute then
    edOut.Text := FileName;
end;

procedure TFrmPRW2Custom.SetHeaderID(const Value: string);
begin
  FHeaderID := Value;
end;

procedure TFrmPRW2Custom.SetOutPutFile(const Value: string);
begin
  edOut.Text := Value;
end;

procedure TFrmPRW2Custom.SetRSState(const Value: String);
begin
  FRSState := Value;
end;

procedure TFrmPRW2Custom.SetScriptFile(const Value: string);
begin
  FScriptFile := Value;;
end;

procedure TFrmPRW2Custom.UniFormCreate(Sender: TObject);
begin
    IQRegFormRead( self, [self]);
end;

end.
