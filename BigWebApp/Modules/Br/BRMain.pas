unit BRMain;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  Vcl.FileCtrl,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu;

type
  TFfrmBR_Main = class(TUniForm)
    btnProc: TUniButton;
    btnCancel: TUniButton;
    btnExceptions: TUniButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edFile: TUniEdit;
    edExc: TUniEdit;
    sbFind: TUniSpeedButton;
    sbExc: TUniSpeedButton;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    Options1: TUniMenuItem;
    Checkforseparateaccounts1: TUniMenuItem;
    Label3: TUniLabel;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbFindClick(Sender: TObject);
    procedure sbExcClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure btnProcClick(Sender: TObject);
    procedure btnExceptionsClick(Sender: TObject);
    procedure Checkforseparateaccounts1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FAcctNo:String;
    FBankInfoDtlId:Real;
    FError:String;
    FBadChecks:Integer;
    FProcessed:Integer;
    function CheckFound(AStr:String):Boolean;
  public
    { Public declarations }
  end;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  BRExc;
{$R *.DFM}


procedure TFfrmBR_Main.UniFormCreate(Sender: TObject);
var
  AInDir, AOutDir:String;
begin
 Label3.Visible := False;
  IQRegFormRead( self, [self]);
  if IQRegStringScalarRead( self, 'BR_IN_DIR', AInDir) then
    OpenDialog1.InitialDir := AInDir;
  if IQRegStringScalarRead( self, 'BR_OUT_DIR', AOutDir) then
    OpenDialog2.InitialDir := AOutDir;
end;

procedure TFfrmBR_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFfrmBR_Main.sbFindClick(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if DirectoryExists(ExtractFileDir(FileName)) then
      InitialDir := ExtractFileDir(FileName);
    if Execute then
    begin
      edFile.Text := FileName;
      if edExc.Text = '' then
      begin
        if OpenDialog2.InitialDir = '' then
          edExc.Text := ExtractFileDir(FileName) + SelectValueAsString('select ''\Exceptions_for_'' || to_char(sysdate, ''MM_DD_RRRR'') || ''.TXT'' from dual')
        else
          edExc.Text := OpenDialog2.InitialDir + SelectValueAsString('select ''\Exceptions_for_'' || to_char(sysdate, ''MM_DD_RRRR'') || ''.TXT'' from dual');
      end;
    end;
  end;
end;



procedure TFfrmBR_Main.sbExcClick(Sender: TObject);
begin
  if edExc.Text = '' then
  begin
    if DirectoryExists(ExtractFileDir(OpenDialog1.FileName)) then
      OpenDialog2.InitialDir := ExtractFileDir(OpenDialog1.FileName);
//    SaveDialog1.FileName := SelectValueAsString('select ''Exceptions for '' || to_char(sysdate, ''MM/DD/RRRR'') || ''.TXT'' from dual')
  end
  else
  begin
    if DirectoryExists(ExtractFileDir(OpenDialog2.FileName)) then
      OpenDialog2.InitialDir := ExtractFileDir(OpenDialog2.FileName);
  end;
  if OpenDialog2.Execute then
    edExc.Text := OpenDialog2.FileName;
end;

procedure TFfrmBR_Main.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFfrmBR_Main.btnProcClick(Sender: TObject);
var
  AInFile, AOutFile:TextFile;
  ALine, AStr:String;
  ACheckFound:Boolean;
begin
  if not FileExists(edFile.Text) then
    raise Exception.Create(Format('File %s does not exists', [Trim(edFile.Text)]));
  if not DirectoryExists(ExtractFileDir(edExc.Text)) then
    raise Exception.Create(Format('Directory %s does not exists', [Trim(ExtractFileDir(edExc.Text))]));
  if FileExists(edExc.Text) then
    if not IqConfirmYN(Format('File %s exists. Do you want to override it?', [Trim(edExc.Text)])) then
      Exit;

  Label3.Visible := True;


  try
    FBadChecks := 0;
    FProcessed := 0;
    AssignFile(AInFile,  Trim(edFile.Text));
    AssignFile(AOutFile, Trim(edExc.Text));
    Rewrite(AOutFile);
    Reset(AInFile);
    ReadLn(AInFile, ALine);
    FAcctNo        := Copy(ALine, 1, 10);
    FBankInfoDtlId := SelectValueFmtAsFloat('select id from bankinfo_dtl where LTrim(RTrim(account_number)) = ''%s''', [FAcctNo]);
    while not eof(AInFile) do
    begin
      ReadLn(AInFile, ALine);

      ACheckFound := CheckFound(ALine);
      Inc(FProcessed);

      if not ACheckFound and not eof(AInFile) then
        Writeln(AOutFile, Copy(ALine, 1, 50) + '   -----   ' + FError);
    end;
  finally
    CloseFile(AInFile);
    CloseFile(AOutFile);
  end;

  IQRegStringScalarWrite( self, 'BR_IN_DIR',  ExtractFileDir(OpenDialog1.FileName));
  IQRegStringScalarWrite( self, 'BR_OUT_DIR', ExtractFileDir(OpenDialog2.FileName));

  Label3.Visible := False;

  if FBadChecks <> 0 then
    IqConfirm(Format('%d records processed. %d records were rejected. Please view exceptions.', [FProcessed, FBadChecks]))
  else
    IqConfirm(Format('%d records processed.', [FProcessed]));
end;

procedure TFfrmBR_Main.btnExceptionsClick(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ : Dependancy on BRExc
  DoViewExceptions(self, edExc.Text);}  {in BRExc.pas}
end;

function TFfrmBR_Main.CheckFound(AStr:String):Boolean;
var
  ACheckNo:String;
  ACheckAmount:Real;
  AAmount:Real;
  ACheckId:Real;
  ADesignator:String;
begin
  ACheckNo    := Copy(AStr, 15, 6);
  Label3.Caption := Format('Check# %s', [ACheckNo]);
  Application.ProcessMessages;
  FError := '';
  Result := True;
  if Checkforseparateaccounts1.Checked then
  begin
    FAcctNo := Copy(AStr, 1, 10);
    FBankInfoDtlId := SelectValueFmtAsFloat('select id from bankinfo_dtl where LTrim(RTrim(account_number)) = ''%s''', [FAcctNo]);
  end;
  ADesignator := Copy(AStr, 43, 2);

  if (ADesignator = '05') or (ADesignator = '06') then
  begin
    FError := 'Deposit';
    Inc(FBadChecks);
    Result := False;
    Exit;
  end;

  ACheckId := SelectValueFmtAsFloat('select id from cheque where check_no = %d and bankinfo_dtl_id = %f',
    [Trunc(StrToFloat(ACheckNo)), FBankInfoDtlId]);
  if ACheckId = 0 then
  begin
    FError := Format('Check %s not found', [ACheckNo]);
    Inc(FBadChecks);
    Result := False;
    Exit;
  end;

  ACheckAmount := StrToFloat(Copy(AStr, 24, 11) + '.' + Copy(AStr, 35, 2));
  AAmount      := SelectValueFmtAsFloat('select sum(amount_paid) from cheque_detail where cheque_id = %f', [ACheckId]);

  if Abs(Abs(AAmount) - ACheckAmount) >= 0.01 then
  begin
    FError := Format('Amounts do not match %m / %m', [ACheckAmount, AAmount]);
    Inc(FBadChecks);
    Result := False;
    Exit;
  end;

  ExecuteCommandFmt('update cheque set check_status = ''CLEARED'' where id = %f', [ACheckId]);

end;


procedure TFfrmBR_Main.Checkforseparateaccounts1Click(Sender: TObject);
begin
  Checkforseparateaccounts1.Checked := not Checkforseparateaccounts1.Checked;
end;

procedure TFfrmBR_Main.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

end.
