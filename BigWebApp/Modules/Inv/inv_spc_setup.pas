unit inv_spc_setup;

interface

uses
  Winapi.Windows,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  Vcl.Buttons,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel;

type
  TFrmReceivingSPCSetup = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    cmbLocation: TUniEdit;
    cmbSPCInspection: TUniEdit;
    lblLocation: TUniLabel;
    lblInspection: TUniLabel;
    PkLocation: TIQWebHPick;
    PkLocationID: TBCDField;
    PkLocationLOCATION: TStringField;
    PkLocationDESCRIPTION: TStringField;
    PkLocationEPLANT_ID: TBCDField;
    PkLocationDIVISION: TStringField;
    PkSPCInspection: TIQWebHPick;
    PkSPCInspectionINSPECTION_NAME: TStringField;
    PkSPCInspectionINSPECTION_DESCRIP: TStringField;
    PkSPCInspectionINSPECTION_CREATED: TDateTimeField;
    PkSPCInspectionINSPECTION_CREATEDBY: TStringField;
    PkSPCInspectionCONTROL_PLAN_NAME: TStringField;
    PkSPCInspectionCONTROL_PLAN_DESCRIP: TStringField;
    PkSPCInspectionCONTROL_PLAN_TYPE_NAME: TStringField;
    PkSPCInspectionSAMPLE_TYPE_STR: TStringField;
    PkSPCInspectionSAMPLE_COUNT: TFloatField;
    PkSPCInspectionVARIABLE_SAMPLE_COUNT: TStringField;
    PkSPCInspectionID: TFloatField;
    PkSPCInspectionARINVT_ID: TFloatField;
    PkSPCInspectionEPLANT_ID: TFloatField;
    PkSPCInspectionSAMPLE_TYPE: TFloatField;
    PkSPCInspectionCONFIDENCE_LEVEL: TFloatField;
    PkSPCInspectionCONFIDENCE_INTERVAL: TFloatField;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtRECV_LOCATION_ID: TBCDField;
    QryArinvtLOC_DESC: TStringField;
    QryArinvtSPC_INSPECTION_ID: TBCDField;
    QryArinvtINSPECTION_NAME: TStringField;
    PLocation: TUniPopupMenu;
    PInspection: TUniPopupMenu;
    SelectLocation1: TUniMenuItem;
    ClearLocation1: TUniMenuItem;
    SelectInspection1: TUniMenuItem;
    ClearInspection1: TUniMenuItem;
    PnlSelectBtns: TUniPanel;
    PnlEditControls: TUniPanel;
    sbtnClearLocation: TUniSpeedButton;
    sbtnClearInspection: TUniSpeedButton;
    procedure AssignArinvtIDParam(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DoSelectLocation(Sender: TObject);
    procedure DoClearLocation(Sender: TObject);
    procedure DoSelectInspection(Sender: TObject);
    procedure DoClearInspection(Sender: TObject);
    procedure PkLocationIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure UniFormCreate(Sender: TObject);
    private
      { Private declarations }
      FArinvtID: Real;
    procedure SetArinvtID(const Value: Real);
    public
      { Public declarations }
      class procedure DoShowModal(AArinvtID: Real);
      property ArinvtID: Real read FArinvtID write SetArinvtID;
  end;


implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm;
  { TODO -ohphadke : Dependency
  Location; }

{ TFrmReceivingSPCSetup }


class procedure TFrmReceivingSPCSetup.DoShowModal(AArinvtID: Real);
Var
 LFrmReceivingSPCSetup : TFrmReceivingSPCSetup;
  begin
   LFrmReceivingSPCSetup := TFrmReceivingSPCSetup.Create(UniGUIApplication.UniApplication);
    with LFrmReceivingSPCSetup do
    begin
      FArinvtID := AArinvtID;
      ShowModal;
    end;
end;

procedure TFrmReceivingSPCSetup.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft01]);
end;

procedure TFrmReceivingSPCSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmReceivingSPCSetup.AssignArinvtIDParam(DataSet: TDataSet);
begin
//  with TFDQuery(DataSet) do
//    ParamByName('ARINVT_ID').Value := FArinvtID;
end;

procedure TFrmReceivingSPCSetup.PkLocationIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
var
  ALocationsID: Real;
  { TODO -ohphadke : Dependency Location;
  AFlags: Location.TNewLocationFlags; }
begin
  Action := mrCancel;
  ResultValue := 0;
  { TODO -ohphadke : Dependency }
//  TLocationsTable.ClearFlags(AFlags);
//  AFlags.NonConforming := True;
//  if Location.DoNewLocation(Self, { var } ALocationsID, AFlags)
//    and Location.IsNonConform(ALocationsID) then    }
    begin
      Action := mrOk;
      ResultValue := ALocationsID;
    end;
end;

procedure TFrmReceivingSPCSetup.SetArinvtID(const Value: Real);
begin
  FArinvtID := Value;
end;

procedure TFrmReceivingSPCSetup.UniFormCreate(Sender: TObject);
begin
  inherited;
  ReOpen(QryArinvt);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditControls);
end;

procedure TFrmReceivingSPCSetup.DoSelectLocation(Sender: TObject);
var
  ALocationsID: Real;
begin
  if PkLocation.Execute then
    begin
      ALocationsID := System.Variants.VarAsType(PkLocation.GetValue('ID'), varInteger);
      ExecuteCommandFmt('UPDATE arinvt SET recv_location_id = %.0f ' +
        'WHERE id = %.0f', [ALocationsID, FArinvtID]);
      ReOpen(QryArinvt);
    end;
end;

procedure TFrmReceivingSPCSetup.DoClearLocation(Sender: TObject);
begin
  if IQConfirmYN('Clear location?') then
    begin
      ExecuteCommandFmt('UPDATE arinvt SET recv_location_id = NULL ' +
        'WHERE id = %.0f', [FArinvtID]);
      ReOpen(QryArinvt);
    end;
end;

procedure TFrmReceivingSPCSetup.DoSelectInspection(Sender: TObject);
var
  AInspectionID: Real;
begin
  if PkSPCInspection.Execute then
    begin
      AInspectionID := System.Variants.VarAsType(PkSPCInspection.GetValue('ID'),
        varInteger);
      ExecuteCommandFmt('UPDATE arinvt SET spc_inspection_id = %.0f ' +
        'WHERE id = %.0f', [AInspectionID, FArinvtID]);
      ReOpen(QryArinvt);
    end;
end;

procedure TFrmReceivingSPCSetup.DoClearInspection(Sender: TObject);
begin
  if IQConfirmYN('Clear inspection?') then
    begin
      ExecuteCommandFmt('UPDATE arinvt SET spc_inspection_id = NULL ' +
        'WHERE id = %.0f', [FArinvtID]);
      ReOpen(QryArinvt);
    end;
end;

end.
