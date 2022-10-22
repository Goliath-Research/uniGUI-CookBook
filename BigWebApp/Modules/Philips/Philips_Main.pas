unit Philips_Main;


interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Buttons,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  Db,
  IQMS.WebVcl.About,
  FileCtrl,
  Menus,
  IQMS.Common.JumpConstants,
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
  MainModule,
  uniLabel, Bde.DBTables, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmPhilips = class(TUniForm)
    edFile: TUniEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Qry: TFDQuery;
    QryCUSTOMER_NUMBER: TStringField;
    QryPONO: TStringField;
    QryITEMNO: TStringField;
    QryQTYSHIPPED: TFloatField;
    QryUNIT_PRICE: TFloatField;
    sbChangeDir: TUniSpeedButton;
    btnProcess: TUniButton;
    btnCancel: TUniButton;
    procedure sbChangeDirClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnProcessClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FBatchId_Id :String;
    FDir:String;
    FFileName:String;
    FEcode:String;
    FFile:TextFile;
    function  Build_String:String;
    procedure CreateTextFile(cFile:String);
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  public
    { Public declarations }
  end;

{var
  FrmPhilips: TFrmPhilips;}

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  IQMS.Common.Directory;

{$R *.DFM}

procedure TFrmPhilips.sbChangeDirClick(Sender: TObject);
begin
(*UG_rem_AMB*)
//iqdir has not been converted yet.
//  if not DirBrowse( FDir ) then Exit;
  if not DirectoryExists(FDir) then Exit;
  edFile.Text := Format('%s\%s%s.TXT', [FDir, FECode, FormatDateTime('mmddyy', date)]);
  IQRegStringScalarWrite( self, 'PHILIPS_DIRECTORY', FDir )
end;

procedure TFrmPhilips.UniFormCreate(Sender: TObject);
var
  AExe : PChar;
begin
  AExe := 'CRELLIN';
  CreateMutex(Nil, False, AExe);
  //Database1.Params.Add(Format('Password=%s', [ParamStr(2)]));
  //Database1.Connected := True;

  FBatchId_Id := ParamStr(1);
  FECode := SelectValueFmtAsString('select ecode from glbatchid where id = %s', [FBatchId_Id]);

  IQRegStringScalarRead( self, 'PHILIPS_DIRECTORY', FDir );

  if FDir = '' then
    sbChangeDirClick(nil)
  else
    //PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmPhilips.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPhilips.btnProcessClick(Sender: TObject);
var
  AStr:String;
begin
  if not FileExists(edFile.Text) then
         CreateTextFile(edFile.Text);

  try
    AssignFile(FFile, edFile.Text);
    Append(FFile);
    Qry.Close;
    //Qry.DataBaseName := DataBase1.DataBaseName;
    Qry.ParamByName('nId').asString := FBatchId_Id;
    Qry.Open;
    with Qry do
    while not eof do
    begin
      Application.ProcessMessages; 
      AStr := Build_String;
      WriteLn(FFile, AStr);
      Next;
    end;
  finally
    CloseFile(FFile);
  end;
  btnCancel.Click;
end;

function TFrmPhilips.Build_String:String;
begin
  Result := '';
  Result := Result + Copy(Format('%-6s', [StrTran(Trim(QryCUSTOMER_NUMBER.asString), '-', '')]), 1, 6);
  Result := Result + Copy(Format('%-15s', [Trim(QryPONO.asString)]), 1, 15);
  Result := Result + Copy(Format('%-25s', [Strtran(Trim(QryITEMNO.asString), '-', '')]), 1, 25);
  Result := Result + Strtran(Copy(Format('%12s', [StrTran(Trim(QryQTYSHIPPED.asString), '-', '')]), 1, 12), ' ', '0');
  Result := Result + StrTran(Format('%15s', [Format('%.6f', [Abs(QryUNIT_PRICE.asFloat)])]), ' ', '0');
end;

procedure TFrmPhilips.CreateTextFile(cFile:String);
var
  MyFile:TextFile;
begin
  AssignFile(MyFile, cFile);
  Rewrite(MyFile);
  CloseFile(MyFile);
end;

procedure TFrmPhilips.IQAfterShowMessage( var Msg: TMessage );
begin
  edFile.Text := Format('%s\%s%s.TXT', [FDir, FECode, FormatDateTime('mmddyy', date)]);
  btnProcessClick(nil);
end;


end.
