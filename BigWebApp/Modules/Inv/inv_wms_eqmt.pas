unit inv_wms_eqmt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  Mask,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  IQMS.COmmon.SetPlant,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmInvWMSEquipment = class(TUniForm)
    SR: TIQWebSecurityRegister;
    wwDBGrid1: TIQUniGridControl;
    SrcWmsEqmt: TDataSource;
    QryWmsEqmt: TFDQuery;
    UpdateSQLWmsEqmt: TFDUpdateSQL;
    QryWmsEqmtDESCRIP: TStringField;
    QryWmsEqmtEPlantDisp: TStringField;
    wwQryDivisionLookup: TFDQuery;
    wwQryDivisionLookupNAME: TStringField;
    wwQryDivisionLookupEPLANT_NAME: TStringField;
    wwQryDivisionLookupID: TBCDField;
    wwDBLookupComboDivision: TUniDBLookupComboBox;
    wwDBComboDlgEplant: TUniEdit;
    QryWmsEqmtDivisionDisp: TStringField;
    QryWmsEqmtDIVISION_ID: TBCDField;
    QryWmsEqmtID: TBCDField;
    QryWmsEqmtEPLANT_ID: TBCDField;
    SrcwwQryDivisionLookup: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);  }
    procedure QryWmsEqmtBeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure QryWmsEqmtCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgEplantCustomDlg(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;
implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.JumpConstants,
  IQMS.Common.SysShare;

{ TFrmInvWMSEquipment }

class procedure TFrmInvWMSEquipment.DoShow;
var
  LFrmInvWMSEquipment : TFrmInvWMSEquipment;
begin
  LFrmInvWMSEquipment := TFrmInvWMSEquipment.Create(UniGUIApplication.UniApplication);
  LFrmInvWMSEquipment.Show;
end;

procedure TFrmInvWMSEquipment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
  // check post message so owner form could refresh the wms_eqmt
  if Assigned(Owner) and (Owner is TUniForm) then
     PostMessage( TUniForm(Owner).Handle, iq_RefreshWMSEquipment, 0, 0 );
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvWMSEquipment.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button )
end;  }

procedure TFrmInvWMSEquipment.QryWmsEqmtBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'wms_eqmt');
end;


procedure TFrmInvWMSEquipment.QryWmsEqmtCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('eplant_id').asFloat > 0 then
     QryWmsEqmtEPlantDisp.asString:= SelectValueByID('name', 'eplant', DataSet.FieldByName('eplant_id').asFloat);

  if DataSet.FieldByName('division_id').asFloat > 0 then
     QryWmsEqmtDivisionDisp.asString:= SelectValueByID('name', 'division', DataSet.FieldByName('division_id').asFloat);
end;

procedure TFrmInvWMSEquipment.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );

{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain applyselected
  IQMS.Common.SysShare.CheckReplaceDivisionOfWWSelected( wwDBGrid1.Selected );
  wwDBGrid1.ApplySelected; }

  IQRegFormRead( self, [ self ]);
end;

procedure TFrmInvWMSEquipment.wwDBComboDlgEplantCustomDlg(
  Sender: TObject);
begin
  QryWmsEqmt.CheckBrowseMode;
  DoChangePlantID(QryWmsEqmt );  {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmInvWMSEquipment.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
  TFDQuery(DataSet).Refresh;
end;


end.
