unit crm_ccud;

{ ---------------------------------------------------------------------------- }
{ Call Center user-defined callers }
{ ---------------------------------------------------------------------------- }

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  crmlist,
  Data.DB,
  MainModule,
  Datasnap.DBClient,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.UI.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.Search,
  Vcl.Controls, IQUniGrid, uniGUIFrame, uniDBNavigator, uniGUIBaseClasses,
  uniGUIClasses, uniPanel;

type
  { TFrmCRMCCUD }
  TFrmCRMCCUD = class(TFrmCRMList)
    SrcCc: TDataSource;
    QryCc: TFDQuery;
    QryCcID: TBCDField;
    QryCcCREATED: TDateTimeField;
    QryCcCREATEDBY: TStringField;
    QryCcPERSONAL: TStringField;
    QryCcPHONE_NUMBER: TStringField;
    QryCcDISPLAY: TStringField;
    procedure QryCcNewRecord(DataSet: TDataSet);
    procedure QryCcBeforeInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryCcBeforeUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoCustomCallList;
procedure AddToCustomCallList( ATelephone, ACaller: string );

var
  FrmCRMCCUD: TFrmCRMCCUD;

implementation

{$R *.dfm}


uses
  crm_rscstr,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager;

procedure DoCustomCallList;
var
  FrmCRMCCUD:TFrmCRMCCUD;
begin
  FrmCRMCCUD :=UniMainModule.GetFormInstance(TFrmCRMCCUD) as TFrmCRMCCUD;
  FrmCRMCCUD.Show;
end;

procedure AddToCustomCallList( ATelephone, ACaller: string );
var
  FrmCRMCCUD:TFrmCRMCCUD;
begin
  FrmCRMCCUD :=UniMainModule.GetFormInstance(TFrmCRMCCUD) as TFrmCRMCCUD;

  with FrmCRMCCUD do
    try
      QryCc.Append;
      QryCcPHONE_NUMBER.AsString := ATelephone;
      QryCcDISPLAY.AsString := ACaller;
      QryCc.Post;
      Show;
    except
      on E: Exception do
        begin
          if (E.ClassType <> EAbort) and (E.Message <> '') then
            IQError(E.Message);
          Free;
        end;
    end;
end;

procedure TFrmCRMCCUD.FormCreate(Sender: TObject);
begin
  inherited;
  IQRegFormRead(Self, [Self]); // iqregfrm
end;

procedure TFrmCRMCCUD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]); // iqregfrm
  inherited;
end;

procedure TFrmCRMCCUD.QryCcBeforeInsert(DataSet: TDataSet);
var
  AID: Integer;
begin
  AID := SelectValueFmtAsInteger('SELECT id FROM ccid_custom ' +
    'WHERE TRIM(phone_number) = ''%s'' AND ' +
    ' UPPER(TRIM(display)) = ''%s'' AND id <> %d AND ROWNUM < 2',
    [Trim(QryCcPHONE_NUMBER.AsString), UpperCase(Trim(QryCcDISPLAY.AsString)),
    QryCcID.AsInteger]);

  if AID > 0 then
    begin
      QryCc.Cancel;
      QryCc.Locate('ID', AID, []);
      IQInformation(crm_rscstr.cTXT0001291); // 'Item is already in the list.'
      System.SysUtils.Abort;
    end;
end;

procedure TFrmCRMCCUD.QryCcBeforeUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
var
  ASQL: TStringList;
begin
  if ARequest = arUpdate then
    begin
      ASQL := TStringList.Create;
      try
        ASQL.Add('UPDATE ccid_custom');
        ASQL.Add('   SET created = :created,');
        ASQL.Add('       createdby = :createdby,');
        ASQL.Add('       personal = :personal,');
        ASQL.Add('       phone_number = :phone_number,');
        ASQL.Add('       display = :display');
        ASQL.Add(' WHERE id = :id');
        ExecuteCommandParamDataSet(ASQL.Text, QryCc);
      finally
        if Assigned(ASQL) then
          FreeAndNil(ASQL);
      end;
    end
  else if ARequest = arInsert then
    begin
      ASQL := TStringList.Create;
      try
        ASQL.Add('INSERT INTO ccid_custom(id,');
        ASQL.Add('                        created,');
        ASQL.Add('                        createdby,');
        ASQL.Add('                        personal,');
        ASQL.Add('                        phone_number,');
        ASQL.Add('                        display)');
        ASQL.Add('    VALUES (:id, :created, :createdby, :personal,');
        ASQL.Add('            :phone_number, :display)');
        ExecuteCommandParamDataSet(ASQL.Text, QryCc);
      finally
        if Assigned(ASQL) then
          FreeAndNil(ASQL);
      end;
    end
  else if ARequest = arDelete then
    ExecuteCommandParamDataSet(
      'DELETE FROM ccid_custom WHERE id = :ID', QryCc);
end;

procedure TFrmCRMCCUD.QryCcNewRecord(DataSet: TDataSet);
begin
  AssignID(QryCc, 'ccid_custom');
  QryCcCREATED.AsDateTime := IQMS.Common.Dates.IQOracleAdjustedDateTime;
  QryCcCREATEDBY.AsString := SecurityManager.UserName;
  QryCcPERSONAL.AsString := 'Y';
end;

end.
