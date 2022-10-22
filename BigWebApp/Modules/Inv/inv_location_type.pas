unit inv_location_type;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Mask,
  Data.DB,
  Vcl.Buttons,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmInvLocationType = class(TUniForm)
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    Label1: TUniLabel;
    lblLength: TUniLabel;
    lblWidth: TUniLabel;
    lblHeight: TUniLabel;
    Label5: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    SrcLocationType: TDataSource;
    QryLocationType: TFDQuery;
    Panel7: TUniPanel;
    NavMain: TUniDBNavigator;
    sbtnSearch: TUniSpeedButton;
    UpdateSQLLocationType: TFDUpdateSQL;
    QryLocationTypeID: TBCDField;
    QryLocationTypeDESCRIP: TStringField;
    QryLocationTypeLENGTH: TBCDField;
    QryLocationTypeWIDTH: TBCDField;
    QryLocationTypeHEIGHT: TBCDField;
    QryLocationTypeWEIGHT: TBCDField;
    QryLocationTypeITEMS_PER_LOC: TStringField;
    QryLocationTypeALLOW_MIXED_LOTS: TStringField;
    QryLocationTypeMAX_CASE_STACK: TBCDField;
    QryLocationTypeMAX_PALLET_STACK: TBCDField;
    QryLocationTypeALLOCATE_SEQ: TStringField;
    PkLocationType: TIQWebHPick;
    PkLocationTypeID: TBCDField;
    PkLocationTypeDESCRIP: TStringField;
    PkLocationTypeLENGTH: TBCDField;
    PkLocationTypeWIDTH: TBCDField;
    PkLocationTypeHEIGHT: TBCDField;
    PkLocationTypeWEIGHT: TBCDField;
    SrcLocations: TDataSource;
    QryLocations: TFDQuery;
    QryLocationsID: TBCDField;
    QryLocationsLOCATION_TYPE_ID: TBCDField;
    QryLocationsLOCATION: TStringField;
    QryLocationsDESCRIPTION: TStringField;
    QryLocationsEPLANT_NAME: TStringField;
    QryLocationsDIVISION: TStringField;
    QryLocationsACTIVE_TYPE: TStringField;
    Panel9: TUniPanel;
    sbtnLocationGenerator: TUniSpeedButton;
    QryLocationsLO_ZONE_CODE: TStringField;
    QryLocationsAL_ZONE_CODE: TStringField;
    QryLocationsDZ_ZONE_CODE: TStringField;
    QryLocationsWK_ZONE_CODE: TStringField;
    PopupMenu1: TUniPopupMenu;
    JumpToLocation1: TUniMenuItem;
    JumpToLocatingZone1: TUniMenuItem;
    JumpToAllocatingZone1: TUniMenuItem;
    JumpToDropZone1: TUniMenuItem;
    JumpToWorkZone1: TUniMenuItem;
    QryLocationsINV_ZONE_ID: TBCDField;
    QryLocationsAL_INV_ZONE_ID: TBCDField;
    QryLocationsDZ_INV_ZONE_ID: TBCDField;
    QryLocationsWK_INV_ZONE_ID: TBCDField;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    Splitter4: TUniSplitter;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    DBEdit8: TUniDBEdit;
    DBEdit9: TUniDBEdit;
    wwDBComboBox2: TUniDBComboBox;
    wwDBComboBox1: TUniDBComboBox;
    dbchkAlloMixedLots: TUniDBCheckBox;
    pgctrlDetails: TUniPageControl;
    tabLocations: TUniTabSheet;
    tabClassCapacity: TUniTabSheet;
    tabInvGroupCapacity: TUniTabSheet;
    tabItemCapacity: TUniTabSheet;
    gridLocations: TIQUniGridControl;
    Panel12: TUniPanel;
    NavItemCap: TUniDBNavigator;
    gridItemCap: TIQUniGridControl;
    Panel13: TUniPanel;
    NavGroupCap: TUniDBNavigator;
    gridGroupCap: TIQUniGridControl;
    Panel14: TUniPanel;
    NavClassCap: TUniDBNavigator;
    gridClassCap: TIQUniGridControl;
    QryItemCap: TFDQuery;
    QryGroupCap: TFDQuery;
    QryClassCap: TFDQuery;
    SrcItemCap: TDataSource;
    SrcClassCap: TDataSource;
    SrcGroupCap: TDataSource;
    QryItemCapID: TBCDField;
    QryItemCapLOCATION_TYPE_ID: TBCDField;
    QryItemCapQTY: TFMTBCDField;
    QryItemCapPK_UNIT_TYPE: TStringField;
    QryItemCapSOURCE: TStringField;
    QryItemCapSOURCE_ID: TBCDField;
    QryItemCapITEMNO: TStringField;
    QryItemCapDESCRIP: TStringField;
    QryItemCapCLASS: TStringField;
    QryItemCapREV: TStringField;
    QryItemCapDESCRIP2: TStringField;
    QryGroupCapID: TBCDField;
    QryGroupCapLOCATION_TYPE_ID: TBCDField;
    QryGroupCapQTY: TFMTBCDField;
    QryGroupCapPK_UNIT_TYPE: TStringField;
    QryGroupCapSOURCE: TStringField;
    QryGroupCapSOURCE_ID: TBCDField;
    QryGroupCapCODE: TStringField;
    QryGroupCapDESCRIP: TStringField;
    PkArinvt_Group: TIQWebHPick;
    PkArinvt_Class: TIQWebHPick;
    PkArinvt: TIQWebHPick;
    StringField1: TStringField;
    PkArinvtCLASS: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    PkArinvtDESCRIP2: TStringField;
    StringField4: TStringField;
    PkArinvtCUSTNO: TStringField;
    PkArinvtCOMPANY: TStringField;
    FloatField1: TBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtPK_HIDE: TStringField;
    PkArinvtNON_MATERIAL: TStringField;
    PkArinvt_GroupID: TBCDField;
    PkArinvt_GroupCODE: TStringField;
    PkArinvt_GroupDESCRIP: TStringField;
    PkArinvt_GroupEPLANT_ID: TBCDField;
    PkArinvt_ClassID: TBCDField;
    PkArinvt_ClassCLASS: TStringField;
    PkArinvt_ClassDESCRIP: TStringField;
    UpdateSQLArinvtItem: TFDUpdateSQL;
    UpdateSQLArinvtGroup: TFDUpdateSQL;
    UpdateSQLArinvtClass: TFDUpdateSQL;
    wwDBComboBoxItemCapUnitType: TUniDBComboBox;
    QryClassCapID: TBCDField;
    QryClassCapLOCATION_TYPE_ID: TBCDField;
    QryClassCapQTY: TFMTBCDField;
    QryClassCapPK_UNIT_TYPE: TStringField;
    QryClassCapSOURCE: TStringField;
    QryClassCapSOURCE_ID: TBCDField;
    QryClassCapCLASS: TStringField;
    QryClassCapDESCRIP: TStringField;
    wwDBComboBoxGroupCapUnitType: TUniDBComboBox;
    wwDBComboBoxClassCapUnitType: TUniDBComboBox;
    wwDBComboDlgItemCap: TUniEdit;
    wwDBComboDlgGroupCap: TUniEdit;
    wwDBComboDlgClassCap: TUniEdit;
    N1: TUniMenuItem;
    LocationPackageUOMs1: TUniMenuItem;
    Options1: TUniMenuItem;
    Parameters1: TUniMenuItem;
    QryLocationTypeVERIFY_LOCATION_CHECK_DIGIT: TStringField;
    Label2: TUniLabel;
    wwDBComboBoxSubType: TUniDBComboBox;
    QryLocationTypeSUB_TYPE: TStringField;
    PkLoc: TIQWebHPick;
    PkLocID: TBCDField;
    PkLocLOCATION: TStringField;
    PkLocDESCRIPTION: TStringField;
    PkLocEPLANT_NAME: TStringField;
    PkLocDIVISION: TStringField;
    PkLocLOC_AISLE: TStringField;
    PkLocLOC_BAY: TStringField;
    PkLocLOC_LEVEL: TStringField;
    PkLocPK_HIDE: TStringField;
    N2: TUniMenuItem;
    DisassociateSelectedLocations1: TUniMenuItem;
    Contents1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryLocationTypeBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    { TODO -oSanketG -cWebConvert : Parser should replace the component TNavigateBtn into suitable UniGUI component }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PkLocationTypeIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure sbtnLocationGeneratorClick(Sender: TObject);
    procedure JumpToLocation1Click(Sender: TObject);
    procedure JumpToAllocatingZone1Click(Sender: TObject);
    procedure JumpToDropZone1Click(Sender: TObject);
    procedure JumpToLocatingZone1Click(Sender: TObject);
    procedure JumpToWorkZone1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure AssignIDLocationCapacity(DataSet: TDataSet);
    procedure QryItemCapNewRecord(DataSet: TDataSet);
    procedure QryGroupCapNewRecord(DataSet: TDataSet);
    procedure QryClassCapNewRecord(DataSet: TDataSet);
    procedure wwDBComboDlgItemCapCustomDlg(Sender: TObject);
    procedure QryItemCapCalcFields(DataSet: TDataSet);
    procedure QryGroupCapCalcFields(DataSet: TDataSet);
    procedure QryClassCapCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgGroupCapCustomDlg(Sender: TObject);
    procedure wwDBComboDlgClassCapCustomDlg(Sender: TObject);
    procedure PostParent(DataSet: TDataSet);
    procedure LocationPackageUOMs1Click(Sender: TObject);
    procedure Parameters1Click(Sender: TObject);
    procedure QryLocationsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    { TODO -oSanketG -cWebConvert : Parser should replace the component TNavigateBtn into suitable UniGUI component }
    //procedure NavLocationDispatch(Sender: TObject; Button: TNavigateBtn);
    procedure DisassociateSelectedLocations1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FLocation_Type_ID: Real;
    { Private declarations }
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure IQRefreshDataSet( var Msg: TMessage ); message iq_RefreshDataSets;
    procedure LocateLocationType(ALocation_Type_ID: Real);
    procedure AssignViaPicklist(APk: TIQWebHPick; ADataSet: TDataSet;
      ASource: string);
    procedure UpdateDimLabels;
    procedure AssignLocationsToLocationType;
    procedure DisassociateLocation(ALocations_ID: Real);
    procedure SetLocation_Type_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow(ALocation_Type_ID: Real = 0 );
    property Location_Type_ID : Real write SetLocation_Type_ID;
  end;


implementation

{$R *.dfm}

uses
  { TODO -oSanketG -cWebConvert : Need to revisit }
  {inv_aisle_loc_gen,
  inv_loc_type_params,
  InvParam,}
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //sys_share
  ;

const
  cnstAppendNew = 1;

class procedure TFrmInvLocationType.DoShow(ALocation_Type_ID: Real = 0 );
var
  FrmInvLocationType: TFrmInvLocationType;
begin
  FrmInvLocationType := TFrmInvLocationType.Create(uniGUIApplication.UniApplication);
  FrmInvLocationType.Location_Type_ID := ALocation_Type_ID;
  FrmInvLocationType.Show;
end;

procedure TFrmInvLocationType.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvLocationType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, gridLocations, gridItemCap, gridGroupCap, gridClassCap ]);
end;

procedure TFrmInvLocationType.LocateLocationType( ALocation_Type_ID: Real );
var
  ANeedPickList: Boolean;
begin
  ANeedPickList:= TRUE;

  if ALocation_Type_ID > 0 then
     ANeedPickList:= not QryLocationType.Locate('ID', ALocation_Type_ID, []);

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


procedure TFrmInvLocationType.IQNotify(var Msg: TMessage);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit after finding the alternative CRUD def name of UniDBNavigator }
  {case Msg.WParam of
    cnstAppendNew: if navMain.Controls[ Ord(nbInsert) ].Enabled and SR.Enabled['NavMain'] and SR.Insert['NavMain'] then
                      navMain.BtnClick( nbInsert );
  end;}
end;

procedure TFrmInvLocationType.IQRefreshDataSet(var Msg: TMessage);
begin
  case Msg.WParam of
     1: begin
          RefreshDataSetByID( QryLocationType );
          RefreshDataSetByID( QryLocations );
        end;
  end;
end;

procedure TFrmInvLocationType.JumpToAllocatingZone1Click(Sender: TObject);
begin
  JumpDirect( iq_JumpToInvZone, QryLocationsAL_INV_ZONE_ID.asInteger );
end;

procedure TFrmInvLocationType.JumpToDropZone1Click(Sender: TObject);
begin
  JumpDirect( iq_JumpToInvZone, QryLocationsDZ_INV_ZONE_ID.asInteger );
end;

procedure TFrmInvLocationType.JumpToLocatingZone1Click(Sender: TObject);
begin
  JumpDirect( iq_JumpToInvZone, QryLocationsINV_ZONE_ID.asInteger );
end;

procedure TFrmInvLocationType.JumpToLocation1Click(Sender: TObject);
begin
  JumpDirect( iq_JumpToMasterLocation, QryLocationsID.asInteger );
end;

procedure TFrmInvLocationType.JumpToWorkZone1Click(Sender: TObject);
begin
  JumpDirect( iq_JumpToInvZone, QryLocationsWK_INV_ZONE_ID.asInteger );
end;

procedure TFrmInvLocationType.Parameters1Click(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit after conversion of inv_loc_type_params}
  //TFrmInvLocTypeParams.DoShowModal( self );  // inv_loc_type_params.pas
end;

procedure TFrmInvLocationType.PkLocationTypeIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 );
end;

procedure TFrmInvLocationType.PopupMenu1Popup(Sender: TObject);
begin
  JumpToLocation1.Enabled      := QryLocationsID.asFloat > 0;
  JumpToLocatingZone1.Enabled  := QryLocationsINV_ZONE_ID.asFloat > 0;
  JumpToAllocatingZone1.Enabled:= QryLocationsAL_INV_ZONE_ID.asFloat > 0;
  JumpToDropZone1.Enabled      := QryLocationsDZ_INV_ZONE_ID.asFloat > 0;
  JumpToWorkZone1.Enabled      := QryLocationsWK_INV_ZONE_ID.asFloat > 0;
end;

procedure TFrmInvLocationType.PostParent(DataSet: TDataSet);
begin
  QryLocationType.CheckBrowseMode;
  if QryLocationType.Eof and QryLocationType.Bof then
     ABORT;
end;

procedure TFrmInvLocationType.ApplyUpdates(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

{ TODO -oSanketG -cWebConvert : Parser should replace the component TNavigateBtn into suitable UniGUI component }
{procedure TFrmInvLocationType.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;
}

procedure TFrmInvLocationType.Contents1Click(Sender: TObject);
begin
 IQHelp.HelpContext( HelpContext );
end;

procedure TFrmInvLocationType.AssignIDLocationCapacity(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'location_capacity');
end;

procedure TFrmInvLocationType.QryClassCapCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if QryClassCapSOURCE_ID.asFloat = 0 then EXIT;

  A:= SelectValueArrayFmt( 'select class, descrip from arinvt_class where id = %f', [ QryClassCapSOURCE_ID.asFloat ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to find arinvt_class id = %.0f (location_capacity, source = ''ARINVT_CLASS'')', [ QryClassCapSOURCE_ID.asFloat ]));

  QryClassCapCLASS.asString  := A[ 0 ];
  QryClassCapDESCRIP.asString:= A[ 1 ];
end;

procedure TFrmInvLocationType.QryClassCapNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('LOCATION_TYPE_ID').asFloat:= QryLocationTypeID.asFloat;
  DataSet.FieldByName('SOURCE').asString:= 'ARINVT_CLASS';
end;

procedure TFrmInvLocationType.QryGroupCapCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if QryGroupCapSOURCE_ID.asFloat = 0 then EXIT;

  A:= SelectValueArrayFmt( 'select code, descrip from arinvt_group where id = %f', [ QryGroupCapSOURCE_ID.asFloat ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to find arinvt_group id = %.0f (location_capacity, source = ''ARINVT_GROUP'')', [ QryGroupCapSOURCE_ID.asFloat ]));

  QryGroupCapCODE.asString   := A[ 0 ];
  QryGroupCapDESCRIP.asString:= A[ 1 ];
end;

procedure TFrmInvLocationType.QryGroupCapNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('LOCATION_TYPE_ID').asFloat:= QryLocationTypeID.asFloat;
  DataSet.FieldByName('SOURCE').asString:= 'ARINVT_GROUP';
end;

procedure TFrmInvLocationType.QryItemCapCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if QryItemCapSOURCE_ID.asFloat = 0 then EXIT;

  A:= SelectValueArrayFmt( 'select class, itemno, descrip, descrip2, rev from arinvt where id = %f', [ QryItemCapSOURCE_ID.asFloat ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to find arinvt id = %.0f (location_capacity, source = ''ARINVT'')', [ QryItemCapSOURCE_ID.asFloat ]));

  QryItemCapCLASS.asString   := A[0];
  QryItemCapITEMNO.asString  := A[1];
  QryItemCapDESCRIP.asString := A[2];
  QryItemCapDESCRIP2.asString:= A[3];
  QryItemCapREV.asString     := A[4];
end;

procedure TFrmInvLocationType.QryItemCapNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('LOCATION_TYPE_ID').asFloat:= QryLocationTypeID.asFloat;
  DataSet.FieldByName('SOURCE').asString:= 'ARINVT';
end;

procedure TFrmInvLocationType.QryLocationTypeBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'location_type');
end;

procedure TFrmInvLocationType.sbtnSearchClick(Sender: TObject);
begin
  with PkLocationType do
    if Execute then
       QryLocationType.Locate('id', GetValue('id'), [])
    else
       ABORT;
end;

procedure TFrmInvLocationType.SetLocation_Type_ID(const Value: Real);
begin
  FLocation_Type_ID := Value;
end;

procedure TFrmInvLocationType.wwDBComboDlgClassCapCustomDlg(Sender: TObject);
begin
  AssignViaPicklist( PkArinvt_Class, QryClassCap, 'ARINVT_CLASS' );
end;

procedure TFrmInvLocationType.wwDBComboDlgGroupCapCustomDlg(Sender: TObject);
begin
  AssignViaPicklist( PkArinvt_Group, QryGroupCap, 'ARINVT_GROUP' );
end;

procedure TFrmInvLocationType.wwDBComboDlgItemCapCustomDlg(Sender: TObject);
begin
  AssignViaPicklist( PkArinvt, QryItemCap, 'ARINVT' );
end;

procedure TFrmInvLocationType.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmInvLocationType.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvLocationType.sbtnLocationGeneratorClick(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit after conversion of inv_aisle_loc_gen}
  //TFrmInvAisleLocationGenerator.DoShow( self );  // inv_aisle_loc_gen.pas
end;


procedure TFrmInvLocationType.AssignViaPicklist( APk: TIQWebHPick; ADataSet: TDataSet; ASource: string );
var
  I: Integer;
begin
  with APk do
    if Execute then
    begin
       ADataSet.Edit;
       ADataSet.FieldByName('source_id').asFloat:= GetValue('id');
    end;
end;

procedure TFrmInvLocationType.LocationPackageUOMs1Click(Sender: TObject);
begin
 { TODO -oSanketG -cWebConvert : Need to revisit after conversion of InvParam}
 (*with TFrmInvParams.Create( self, 0 {AArinvt_ID} ) do  // InvParam.pas
 try
   ShowOnlyLocationPackageUOM:= TRUE;                  // hide General tab leaving only Location/Package UOMs
   ShowModal;
   UpdateDimLabels;
 finally
   Free;
 end;*)
end;

procedure TFrmInvLocationType.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, gridLocations, gridItemCap, gridGroupCap, gridClassCap ]);
  { TODO -oSanketG -cWebConvert : Need to revisit after sys_share conversion}
  //sys_share.CheckReplaceDivisionOfWWSelected( gridLocations.Selected );
  { TODO -oSanketG -cWebConvert : Need to revisit after finding the alternative property for ApplySelected for TIQUniGridControl}
  //gridLocations.ApplySelected;
  pgctrlDetails.ActivePageIndex:= 0;

end;

procedure TFrmInvLocationType.UniFormShow(Sender: TObject);
begin
   IQSetTablesActive( TRUE, self );
   UpdateDimLabels;

   LocateLocationType( FLocation_Type_ID );
end;

procedure TFrmInvLocationType.UpdateDimLabels;
var
  S: string;
begin
  S:= SelectValueAsString('select lower(location_dim_uom) from params');
  lblLength.Caption:= Format('Length (%s)', [S]);
  lblWidth.Caption:= Format('Width (%s)',  [S]);
  lblHeight.Caption:= Format('Height (%s)', [S]);
end;


procedure TFrmInvLocationType.QryLocationsUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arDelete:
    begin
      DisassociateLocation( DtoF( ASender.FieldByName('id').OldValue ));
       { TODO -oSanketG -cWebConvert : Need to revisit after finding the alternative property for UnselectAll for TIQUniGridControl}
      //gridLocations.UnselectAll;
      AAction := eaApplied;
    end;
  end;
end;

{ TODO -oSanketG -cWebConvert : Parser should replace the component TNavigateBtn into suitable UniGUI component }
{procedure TFrmInvLocationType.NavLocationDispatch(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);

  case Button of
     nbInsert:
       begin
         QryLocations.Cancel;
         AssignLocationsToLocationType;
         ABORT;
       end;
  end;
end;}


procedure TFrmInvLocationType.AssignLocationsToLocationType;
var
  I: Integer;
begin
  QryLocationType.CheckBrowseMode;

  with PkLoc do
   if ExecuteEx('ID') then
   begin
      for I:= 0 to ResultList.Count - 1 do
         ExecuteCommandFmt('update locations set location_type_id = %f where id = %s', [ QryLocationTypeID.asFloat, ResultList[ I ] ]);
      RefreshDataSetByID( QryLocations );
   end;
end;

procedure TFrmInvLocationType.DisassociateSelectedLocations1Click(Sender: TObject);
var
  I: Integer;
begin
  if not IQConfirmYN('Disassociate selected locations from the location type?') then
     EXIT;
  { TODO -oSanketG -cWebConvert : Need to revisit after finding the alternative property for SelectedList,UnselectAll for TIQUniGridControl}
  {with gridLocations, DataSource.DataSet do
  begin
     if (Eof and Bof) or (SelectedList.Count = 0) then
        EXIT;

     for I:= SelectedList.Count - 1 downto 0 do
     begin
       GotoBookmark( SelectedList.Items[ I ]);
       DisassociateLocation( FieldByName('id').asFloat );
     end;

     UnselectAll;
  end;}

  RefreshDataSetByID( gridLocations.DataSource.DataSet );
end;


procedure TFrmInvLocationType.DisassociateLocation( ALocations_ID: Real );
begin
  ExecuteCommandFmt('update locations set location_type_id = null where id = %f', [ ALocations_ID ]);
end;

end.
