unit inv_zones;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  Mask,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.Jump,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmInvZones = class(TUniForm)
    Panel1: TUniPanel;
    NavZones: TUniDBNavigator;
    SrcInvZone: TDataSource;
    QryInvZone: TFDQuery;
    QryInvZoneID: TBCDField;
    QryInvZoneCODE: TStringField;
    QryInvZoneDESCRIP: TStringField;
    sbtnSearch: TUniSpeedButton;
    PkInvZone: TIQWebHPick;
    PkInvZoneID: TBCDField;
    PkInvZoneCODE: TStringField;
    PkInvZoneDESCRIP: TStringField;
    UpdateSQLInvZone: TFDUpdateSQL;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    IQAbout1: TIQWebAbout;
    sbtnToggle: TUniSpeedButton;
    pnlHeader: TUniPanel;
    pgctrlMain: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    pnlLeft03: TUniPanel;
    pnlLeft01: TUniPanel;
    Panel6: TUniPanel;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    Panel7: TUniPanel;
    Splitter4: TUniSplitter;
    pnlLeft02: TUniPanel;
    Panel9: TUniPanel;
    QryInvZoneEPLANT_ID: TBCDField;
    QryInvZoneDIVISION_ID: TBCDField;
    QryInvZoneZONE_TYPE: TStringField;
    QryInvZoneALLOCATABLE: TStringField;
    QryInvZoneCASES_AISLE: TBCDField;
    QryInvZoneCURRENT_COUNT: TBCDField;
    QryInvZonePALLETS_AISLE: TBCDField;
    QryInvZoneCURRENT_AISLE: TStringField;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    lblDivision: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label4: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    dbeCode: TUniDBEdit;
    dbeDescrip: TUniDBEdit;
    wwDBComboDlgEplantOnForm: TUniEdit;
    wwQryDivisionLookup: TFDQuery;
    wwQryDivisionLookupNAME: TStringField;
    wwQryDivisionLookupEPLANT_NAME: TStringField;
    wwQryDivisionLookupID: TBCDField;
    wwDBComboBoxZoneType: TUniDBComboBox;
    wwDBLookupComboDivision: TUniDBLookupComboBox;
    DBCheckBoxAllocatable: TUniDBCheckBox;
    dbeCasesAisle: TUniDBEdit;
    dbeCurrentAisle: TUniDBEdit;
    dbeCurrentCount: TUniDBEdit;
    dbePalletsAisle: TUniDBEdit;
    Panel3: TUniPanel;
    Panel10: TUniPanel;
    wwDBGridLocations: TIQUniGridControl;
    QryInvZoneEplantDisp: TStringField;
    SrcLocations: TDataSource;
    QryLocations: TFDQuery;
    QryLocationsID: TBCDField;
    QryLocationsLOCATION: TStringField;
    QryLocationsDESCRIPTION: TStringField;
    QryLocationsEPLANT_NAME: TStringField;
    QryLocationsDIVISION: TStringField;
    QryLocationsACTIVE_TYPE: TStringField;
    QryLocationsLOCATION_TYPE_ID: TBCDField;
    wwDBComboBoxZoneTypeOnGrid: TUniDBComboBox;
    PopupMenu1: TUniPopupMenu;
    JumpToLocation1: TUniMenuItem;
    wwDBComboDlgEplantOnGrid: TUniEdit;
    wwDBLookupComboDivisionOnGrid: TUniDBLookupComboBox;
    QryInvZoneDivisionDisp: TStringField;
    PkLoc: TIQWebHPick;
    PkLocID: TBCDField;
    PkLocLOCATION: TStringField;
    PkLocDESCRIPTION: TStringField;
    PkLocEPLANT_NAME: TStringField;
    PkLocDIVISION: TStringField;
    PkLocACTIVE_TYPE: TStringField;
    PkLocLOC_AISLE: TStringField;
    PkLocLOC_BAY: TStringField;
    PkLocLOC_LEVEL: TStringField;
    PkLocPK_HIDE: TStringField;
    DisassociateSelectedLocations1: TUniMenuItem;
    N1: TUniMenuItem;
    Contents1: TUniMenuItem;
    PkInvZoneEPLANT_ID: TBCDField;
    PkInvZoneDIVISION_NAME: TStringField;
    sbtnAddFromOtherZones: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSearchClick(Sender: TObject);
    procedure QryInvZoneBeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryInvZoneCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgEplantOnFormCustomDlg(Sender: TObject);
    procedure sbtnToggleClick(Sender: TObject);
    procedure PkInvZoneIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure JumpToLocation1Click(Sender: TObject);
    procedure QryLocationsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavLocationsDispatch(Sender: TObject; Button: TNavigateBtn);}
    procedure PkLocBeforeOpen(DataSet: TDataSet);
    procedure DisassociateSelectedLocations1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryInvZoneDIVISION_IDChange(Sender: TField);
    procedure sbtnAddFromOtherZonesClick(Sender: TObject);
    procedure QryInvZoneNewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure LocateZone(AInv_Zone_ID: Real);
    function GetZoneField: string;
    procedure AssignLocationsToZone;
    procedure DisassociateLocation(ALocations_ID: Real);
    procedure CheckDivisionEPlantMismatch;
    procedure AssignDefaultEPlantBasedOnDivision(ADivision_ID: Real);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavLocationsDispatch(Sender: TObject; Button: TNavigateBtn); }
    procedure SetInv_Zone_ID(const Value: Real);
  public
    { Public declarations }
    property Inv_Zone_ID: Real write SetInv_Zone_ID;
    class procedure DoShow(AInv_Zone_ID: Real = 0 );
  end;

implementation

{$R *.dfm}

uses
  inv_trans_zones_add_other,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on Files
  IQSecIns,  }
  IQMS.COmmon.SetPlant,
  IQMS.Common.SysShare;

const
   cnstAppendNew = 1;

class procedure TFrmInvZones.DoShow(AInv_Zone_ID: Real = 0 );
var
  LFrmInvZones : TFrmInvZones;
begin
  LFrmInvZones := TFrmInvZones.Create(UniGUIApplication.UniApplication);

  LFrmInvZones.Show;
end;

procedure TFrmInvZones.Exit1Click(Sender: TObject);
begin
  Close;
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvZones.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;   }

procedure TFrmInvZones.Contents1Click(Sender: TObject);
begin
 IQHelp.HelpContext( HelpContext );
end;

procedure TFrmInvZones.LocateZone( AInv_Zone_ID: Real );
var
  ANeedPickList: Boolean;
begin
  ANeedPickList:= TRUE;

  if AInv_Zone_ID > 0 then
     ANeedPickList:= not QryInvZone.Locate('ID', AInv_Zone_ID, []);

  if not ANeedPickList then
     EXIT;

  try
    sbtnSearchClick(NIL);
  except on E:EAbort do
    begin
       PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
       ABORT;
    end;
  end;
end;


procedure TFrmInvZones.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvZones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, pnlLeft01, pnlLeft02, pnlLeft03, pnlHeader ]);
end;

procedure TFrmInvZones.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on Files
  EnsureSecurityInspectorOnTopOf(self);  }
end;

procedure TFrmInvZones.IQNotify(var Msg: TMessage);
begin
{ TODO -oGPatil -cWebConvert : nbInsert not available
  case Msg.WParam of
    cnstAppendNew: if navZones.Controls[ Ord(nbInsert) ].Enabled and SR.Enabled['NavMain'] and SR.Insert['NavMain'] then
                      navZones.BtnClick( nbInsert );
  end;  }
end;

procedure TFrmInvZones.PkInvZoneIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 );
end;

procedure TFrmInvZones.QryInvZoneBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'INV_ZONE');

  QryInvZoneCODE.asString:= UpperCase(QryInvZoneCODE.asString);
  CheckDivisionEPlantMismatch;
end;

procedure TFrmInvZones.QryInvZoneCalcFields(DataSet: TDataSet);
begin
  if QryInvZoneEPLANT_ID.asFloat > 0 then
     QryInvZoneEplantDisp.asString:= SelectValueByID('name', 'eplant', QryInvZoneEPLANT_ID.asFloat);

  if DataSet.FieldByName('division_id').asFloat > 0 then
     QryInvZoneDivisionDisp.asString:= SelectValueByID('name', 'division', DataSet.FieldByName('division_id').asFloat);

end;

procedure TFrmInvZones.sbtnToggleClick(Sender: TObject);
begin
  if pgctrlMain.ActivePageIndex = 0 then
     pgctrlMain.ActivePageIndex:= 1
  else
     pgctrlMain.ActivePageIndex:= 0;
end;

procedure TFrmInvZones.SetInv_Zone_ID(const Value: Real);
begin
    LocateZone( Value );
end;

procedure TFrmInvZones.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);

  pgctrlMain.ActivePageIndex:= 0;
  AdjustPageControlToParent( pgctrlMain );

{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain selected
  IQMS.Common.SysShare.CheckReplaceDivisionOfWWSelected( wwDBGrid1.Selected );
  wwDBGrid1.ApplySelected;   }
  with lblDivision do Caption:= CheckReplaceDivisionCaption( Caption ); {IQMS.Common.SysShare.pas}

  IQRegFormRead( self, [ self, wwDBGrid1, pnlLeft01, pnlLeft02, pnlLeft03, pnlHeader ]);
end;

procedure TFrmInvZones.sbtnSearchClick(Sender: TObject);
begin
  with PkInvZone do
    if Execute then
       QryInvZone.Locate('id', GetValue('id'), [])
    else
       ABORT
end;

procedure TFrmInvZones.wwDBComboDlgEplantOnFormCustomDlg(Sender: TObject);
begin
  QryInvZone.CheckBrowseMode;
  DoChangePlantID(QryInvZone );  {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmInvZones.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvZones.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmInvZones.JumpToLocation1Click(Sender: TObject);
begin
  JumpDirect( iq_JumpToMasterLocation, QryLocationsID.asInteger );
end;

function TFrmInvZones.GetZoneField: string;
begin
  if      QryInvZoneZONE_TYPE.asString =  'LO' then Result:= 'inv_zone_id'
  else if QryInvZoneZONE_TYPE.asString =  'AL' then Result:= 'al_inv_zone_id'
  else if QryInvZoneZONE_TYPE.asString =  'DZ' then Result:= 'dz_inv_zone_id'
  else if QryInvZoneZONE_TYPE.asString =  'WK' then Result:= 'wk_inv_zone_id'
  else raise Exception.Create('Zone Type is not assigned - operation aborted');
end;

procedure TFrmInvZones.QryLocationsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arDelete:
      begin
        DisassociateLocation( DtoF( aSender.FieldByName('id').OldValue ));
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain UnselectAll
        wwDBGridLocations.UnselectAll; }
        AAction := eaApplied;
      end;
  end;
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvZones.NavLocationsDispatch(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);

  case Button of
     nbInsert:
       begin
         QryLocations.Cancel;
         AssignLocationsToZone;
         ABORT;
       end;
  end;
end;  }


procedure TFrmInvZones.AssignLocationsToZone;
var
  I: Integer;
begin
  QryInvZone.CheckBrowseMode;

  with PkLoc do
   if ExecuteEx('ID') then
   begin
      for I:= 0 to ResultList.Count - 1 do
         ExecuteCommandFmt('update locations set %s = %f where id = %s',
                   [ GetZoneField,
                     QryInvZoneID.asFloat,
                     ResultList[ I ] ]);

      RefreshDataSetByID( QryLocations );
   end;
end;

procedure TFrmInvZones.PkLocBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'zone_type', QryInvZoneZONE_TYPE.asString);
  AssignQueryParamValue(DataSet, 'division_id', QryInvZoneDIVISION_ID.asFloat);
  AssignQueryParamValue(DataSet, 'eplant_id', QryInvZoneEPLANT_ID.asFloat);
//  TFDQuery(DataSet).ParamByName('zone_type').Value := QryInvZoneZONE_TYPE.asString;
//  TFDQuery(DataSet).ParamByName('division_id').Value := QryInvZoneDIVISION_ID.asFloat;
//  TFDQuery(DataSet).ParamByName('eplant_id').Value := QryInvZoneEPLANT_ID.asFloat;
end;


procedure TFrmInvZones.DisassociateLocation( ALocations_ID: Real );
begin
  ExecuteCommandFmt('update locations set %s = null where id = %f',
            [ GetZoneField,
              ALocations_ID ]);
end;


procedure TFrmInvZones.DisassociateSelectedLocations1Click(Sender: TObject);
var
  I: Integer;
begin
  if not IQConfirmYN('Disassociate selected locations from the inventory zone?') then
     EXIT;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain selectedlist
  with wwDBGridLocations, DataSource.DataSet do
  begin
     if (Eof and Bof) or (SelectedList.Count = 0) then
        EXIT;

     for I:= SelectedList.Count - 1 downto 0 do
     begin
       GotoBookmark( SelectedList.Items[ I ]);
       DisassociateLocation( FieldByName('id').asFloat );
     end;

     UnselectAll;
  end;   }

  RefreshDataSetByID( wwDBGridLocations.DataSource.DataSet );
end;


procedure TFrmInvZones.QryInvZoneDIVISION_IDChange(Sender: TField);
begin
  AssignDefaultEPlantBasedOnDivision( Sender.asFloat )
end;

procedure TFrmInvZones.QryInvZoneNewRecord(DataSet: TDataSet);
begin
  QryInvZoneEPLANT_ID.Clear;
end;

procedure TFrmInvZones.AssignDefaultEPlantBasedOnDivision( ADivision_ID: Real );
var
  ADivision_EPlant_ID: Real;
begin
  ADivision_EPlant_ID:= SelectValueByID('eplant_id', 'division', ADivision_ID );
  if ADivision_EPlant_ID > 0 then
     QryInvZoneEPLANT_ID.asFloat:= ADivision_EPlant_ID
  else
     QryInvZoneEPLANT_ID.Clear;
end;

procedure TFrmInvZones.CheckDivisionEPlantMismatch;
var
  ADivision_EPlant_ID: Real;
  S: string;
begin
  if QryInvZoneDIVISION_ID.asFloat = 0 then
     EXIT;

  ADivision_EPlant_ID:= SelectValueByID('eplant_id', 'division', QryInvZoneDIVISION_ID.asFloat);
  if ADivision_EPlant_ID = QryInvZoneEPLANT_ID.asFloat then
     EXIT;

  S:= 'Mismatch Between the Division EPlant and Zone EPlant - Operation Aborted';
  if IQMS.Common.SysShare.Is_Whs_Division then
     S:= IQMS.Common.SysShare.CheckReplaceDivisionCaption( S );

  raise Exception.Create( S );
end;


procedure TFrmInvZones.sbtnAddFromOtherZonesClick(Sender: TObject);
begin
  QryInvZone.CheckBrowseMode;

  if QryInvZoneID.asFloat = 0 then
     EXIT;

  if not TFrmInvZonesAddOther.DoShowModal(QryInvZoneID.asFloat ) then    //  inv_trans_zones_add_other.pas
     EXIT;
  Reopen(QryLocations);
end;



end.
