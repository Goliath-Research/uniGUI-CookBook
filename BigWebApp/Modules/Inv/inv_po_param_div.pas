unit inv_po_param_div;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.wwDataInspector,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TFrmInvPOParamsDivision = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    wwDataInspector1: TwwDataInspector;
    wwDBGrid1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    SR: TIQWebSecurityRegister;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtID: TBCDField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtREV: TStringField;
    SrcArinvtDivision: TDataSource;
    QryArinvtDivision: TFDQuery;
    QryArinvtDivisionID: TBCDField;
    QryArinvtDivisionARINVT_ID: TBCDField;
    QryArinvtDivisionDIVISION_ID: TBCDField;
    QryArinvtDivisionMIN_ORDER_QTY: TBCDField;
    QryArinvtDivisionMAX_ORDER_QTY: TBCDField;
    QryArinvtDivisionSAFETY_STOCK: TBCDField;
    QryArinvtDivisionPO_SAFETY: TBCDField;
    QryArinvtDivisionPO_SCOPE: TBCDField;
    QryArinvtDivisionPO_MOVE_RANGE: TBCDField;
    QryArinvtDivisionDivision: TStringField;
    wwDBComboDlgDivision: TUniEdit;
    UpdateSQLArinvtDivision: TFDUpdateSQL;
    PkDivision: TIQWebHPick;
    PkDivisionID: TBCDField;
    PkDivisionNAME: TStringField;
    PkDivisionEPLANT_ID: TBCDField;
    PkDivisionDESCRIP: TStringField;
    QryArinvtDivisionLEAD_DAYS: TBCDField;
    QryArinvtDivisionSAFETY_STOCK2: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);    }
    procedure wwDBComboDlgDivisionCustomDlg(Sender: TObject);
    procedure QryArinvtDivisionBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryArinvtDivisionNewRecord(DataSet: TDataSet);
    procedure QryArinvtDivisionCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    property Arinvt_ID: Real write SetArinvt_ID;
    class procedure DoShow(AArinvt_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.SysShare;

{ TFrmInvPOParamsDivision }

class procedure TFrmInvPOParamsDivision.DoShow(AArinvt_ID: Real);
var
  LFrmInvPOParamsDivision : TFrmInvPOParamsDivision;
begin
  LFrmInvPOParamsDivision := TFrmInvPOParamsDivision.Create(UniGUIApplication.UniApplication);
  LFrmInvPOParamsDivision.Arinvt_ID := AArinvt_ID;
  LFrmInvPOParamsDivision.Show;
end;

procedure TFrmInvPOParamsDivision.ApplyUpdates(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable( DataSet );
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvPOParamsDivision.CheckRefresh(Sender: TObject;  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;   }

procedure TFrmInvPOParamsDivision.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmInvPOParamsDivision.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('arinvt_id').Value := FArinvt_ID;
end;

procedure TFrmInvPOParamsDivision.QryArinvtDivisionBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'arinvt_division');
end;


procedure TFrmInvPOParamsDivision.QryArinvtDivisionNewRecord(DataSet: TDataSet);
begin
  QryArinvtDivisionARINVT_ID.asFloat:= FArinvt_ID;
end;

procedure TFrmInvPOParamsDivision.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmInvPOParamsDivision.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);

  self.Caption:= IQMS.Common.SysShare.CheckReplaceDivisionCaption( self.Caption );
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain selected and ApplySelected
  with wwDBGrid1 do
  begin
    CheckReplaceDivisionOfWWSelected( Selected );
    ApplySelected;
  end;   }
end;

procedure TFrmInvPOParamsDivision.wwDBComboDlgDivisionCustomDlg(
  Sender: TObject);
begin
  with PkDivision do
    if Execute then
    begin
       QryArinvtDivision.Edit;
       QryArinvtDivisionDIVISION_ID.asFloat:= GetValue('id');
    end;
end;

procedure TFrmInvPOParamsDivision.QryArinvtDivisionCalcFields( DataSet: TDataSet);
begin
  if QryArinvtDivisionDIVISION_ID.asFloat <> 0 then
    QryArinvtDivisionDivision.asString := SelectValueFmtAsString('select name from division where id = %f', [QryArinvtDivisionDIVISION_ID.asFloat]);
end;


end.
