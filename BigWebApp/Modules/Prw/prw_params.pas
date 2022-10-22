unit prw_params;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Grids;

type
  TFrmPRW_Params = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwDataInspector1: TwwDataInspector;
    SrcParams: TDataSource;
    QryParams: TFDQuery;
    QryParamsLABOR_PAGE: TStringField;
    QryParamsREJECTS_PAGE: TStringField;
    QryParamsCOSTING_PAGE: TStringField;
    QryParamsQUANTITY_PAGE: TStringField;
    QryParamsDISPOSITION_PAGE: TStringField;
    QryParamsSUMMARY_PAGE: TStringField;
    QryParamsPRODHRS_PAGE: TStringField;
    SR: TIQWebSecurityRegister;
    QryParamsPOST_ACT_COST_INV: TStringField;
    QryParamsWO_COMPLETE: TStringField;
    QryParamsWO_COMPLETE_PERCENT: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryParamsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormShow(Sender: TObject);
    procedure QryParamsBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPRW_Param_RowID: string;
    procedure AssignPRW_ParamROWID;
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  IQSecIns; }

{ TFrmPRW_Params }

class procedure TFrmPRW_Params.DoShowModal;
var
  LFrmPRW_Params : TFrmPRW_Params;
begin
  LFrmPRW_Params := TFrmPRW_Params.create(uniGUIApplication.UniApplication);
  LFrmPRW_Params.AssignPRW_ParamROWID;
  LFrmPRW_Params.ShowModal;
end;

procedure TFrmPRW_Params.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPRW_Params.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );            }
end;

procedure TFrmPRW_Params.AssignPRW_ParamROWID;
begin
  // get existing row
  FPRW_Param_RowID:= SelectValueAsString('select rowid from prw_param');

  // ensure 1 exists
  if FPRW_Param_RowID = '' then
  begin
    ExecuteCommand('insert into prw_param( prodhrs_page, labor_page, rejects_page, costing_page ) values( null, null, null, null )');
    FPRW_Param_RowID:= SelectValueAsString('select rowid from prw_param');
  end;

  // make sure there is only 1 row
  ExecuteCommandFmt('delete from prw_param where rowid <> ''%s''', [ FPRW_Param_RowID ]);
end;

procedure TFrmPRW_Params.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmPRW_Params.btnOKClick(Sender: TObject);
begin
  if QryParams.State in [dsEdit, dsInsert] then
     QryParams.Post;

  ModalResult:= mrOK;
end;


procedure TFrmPRW_Params.QryParamsBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('costing_page').asString <> 'Y' then
     DataSet.FieldByName('post_act_cost_inv').asString:= 'N';
end;

procedure TFrmPRW_Params.QryParamsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
  function _YNToFloat( YN: string ): Real;
  begin
    if YN = 'Y' then Result:= 1 else Result:= 0;
  end;

begin
  if ARequest = arUpdate then
  begin
    ExecuteCommandFmt('update prw_param                  '+
              '   set prodhrs_page = %f,         '+
              '       labor_page   = %f,         '+
              '       rejects_page = %f,         '+
              '       costing_page = %f,         '+
              '       post_act_cost_inv = ''%s'','+
              '       wo_complete = ''%s'',      '+
              '       wo_complete_percent = %.6f '+
              ' where rowid = ''%s''             ',
              [ _YNToFloat( ASender.FieldByName('prodhrs_page').asString ),
                _YNToFloat( ASender.FieldByName('labor_page').asString ),
                _YNToFloat( ASender.FieldByName('rejects_page').asString ),
                _YNToFloat( ASender.FieldByName('costing_page').asString ),
                ASender.FieldByName('post_act_cost_inv').asString,
                ASender.FieldByName('wo_complete').asString,
                ASender.FieldByName('wo_complete_percent').asFloat,
                FPRW_Param_RowID ]);
  end;

  AAction := eaApplied;
end;

procedure TFrmPRW_Params.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  IQSetTablesActive(TRUE, self);
end;

end.
