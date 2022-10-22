unit inv_aisle_loc_gen;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Mask,
  IQMS.WebVcl.UDComboBox,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  Vcl.FileCtrl,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SecurityRegister,
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
  uniDBEdit,
  uniCheckBox,
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
  uniLabel, uniMainMenu, Vcl.ComCtrls, uniDBComboBox, uniComboBox, Vcl.ExtCtrls;

type
  TFrmInvAisleLocationGenerator = class;

  TLocGenCargo = class
    FOwner: TFrmInvAisleLocationGenerator;
    Aisle: string;
    Bay: string;
    Level: string;
    Loc_Desc: string;
    Descrip: string;
    Locations_ID: Real;
    constructor Create( AOwner: TFrmInvAisleLocationGenerator; ALoc_Desc, AAisle, ABay, ALevel, ADescrip: string );
  end;

  TFrmInvAisleLocationGenerator = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    btnPreviewPost: TUniButton;
    lvLocs: TListView;
    IQAbout1: TIQWebAbout;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Splitter2: TUniSplitter;
    Panel12: TUniPanel;
    wwQryDivisionLookup: TFDQuery;
    wwQryDivisionLookupNAME: TStringField;
    wwQryDivisionLookupEPLANT_NAME: TStringField;
    wwQryDivisionLookupID: TBCDField;
    PkInvZone: TIQWebHPick;
    PkInvZoneID: TBCDField;
    PkInvZoneCODE: TStringField;
    PkInvZoneDESCRIP: TStringField;
    PKEplant: TIQWebHPick;
    PKEplantID: TBCDField;
    PKEplantNAME: TStringField;
    PkInvZoneEPLANT_ID: TBCDField;
    PkInvZoneDIVISION_NAME: TStringField;
    PkAisle: TIQWebHPick;
    PkAisleID: TBCDField;
    PkAisleNAME: TStringField;
    PkAisleEPLANT_ID: TBCDField;
    PkAisleDIVISION_NAME: TStringField;
    SrcAisles: TDataSource;
    QryAisles: TFDQuery;
    QryAislesNAME: TStringField;
    QryAislesEplantDisp: TStringField;
    UpdateSQLAisles: TFDUpdateSQL;
    QryAislesBAY_PREFIX: TStringField;
    QryAislesLEVEL_PREFIX: TStringField;
    QryAislesBUILDING: TStringField;
    QryAislesLocationType: TStringField;
    QryAislesLocatingZone: TStringField;
    QryAislesAllocatingZone: TStringField;
    QryAislesWorkZone: TStringField;
    QryAislesDropZone: TStringField;
    Panel14: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    NavMain: TUniDBNavigator;
    Panel10: TUniPanel;
    edAisle: TUniDBEdit;
    wwDBLookupComboDivision: TUniDBLookupComboBox;
    wwDBComboDlgEplant: TUniEdit;
    Panel11: TUniPanel;
    Label10: TUniLabel;
    lblDivision: TUniLabel;
    Label5: TUniLabel;
    Panel13: TUniPanel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label15: TUniLabel;
    Label16: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    Panel15: TUniPanel;
    edBayPrefix: TUniDBEdit;
    edBayStart: TUniDBEdit;
    edBayEnd: TUniDBEdit;
    edBayInterval: TUniDBEdit;
    edLevelPrefix: TUniDBEdit;
    edLevelStart: TUniDBEdit;
    edLevelEnd: TUniDBEdit;
    edLevelInterval: TUniDBEdit;
    Panel16: TUniPanel;
    Label4: TUniLabel;
    Label20: TUniLabel;
    Label21: TUniLabel;
    Label22: TUniLabel;
    Label6: TUniLabel;
    Label2: TUniLabel;
    Panel17: TUniPanel;
    Panel18: TUniPanel;
    Panel19: TUniPanel;
    Panel20: TUniPanel;
    wwDBComboDlgZoneLO: TUniEdit;
    wwDBComboDlgZoneAL: TUniEdit;
    wwDBComboDlgZoneDZ: TUniEdit;
    wwDBComboDlgZoneWK: TUniEdit;
    IQUDComboBoxBuilding: TIQWebUDComboBox;
    wwDBComboDlgLocType: TUniEdit;
    chkUpdateLocType: TUniCheckBox;
    chkUpdateBuilding: TUniCheckBox;
    chkUpdateAllocatingZone: TUniCheckBox;
    chkUpdateLocatingZone: TUniCheckBox;
    chkUpdateDropZone: TUniCheckBox;
    chkUpdateWorkZone: TUniCheckBox;
    Panel21: TUniPanel;
    Panel22: TUniPanel;
    Label3: TUniLabel;
    PkLocationType: TIQWebHPick;
    PkLocationTypeID: TBCDField;
    PkLocationTypeDESCRIP: TStringField;
    PkLocationTypeLENGTH: TBCDField;
    PkLocationTypeWIDTH: TBCDField;
    PkLocationTypeHEIGHT: TBCDField;
    PkLocationTypeWEIGHT: TBCDField;
    SR: TIQWebSecurityRegister;
    Panel23: TUniPanel;
    Shape8: TShape;
    QryAislesDIVISION_ID: TBCDField;
    QryAislesID: TBCDField;
    QryAislesEPLANT_ID: TBCDField;
    QryAislesBAY_START: TBCDField;
    QryAislesBAY_END: TBCDField;
    QryAislesBAY_INTERVAL: TBCDField;
    QryAislesLEVEL_START: TBCDField;
    QryAislesLEVEL_END: TBCDField;
    QryAislesLEVEL_INTERVAL: TBCDField;
    QryAislesLOCATION_TYPE_ID: TBCDField;
    QryAislesINV_ZONE_ID: TBCDField;
    QryAislesAL_INV_ZONE_ID: TBCDField;
    QryAislesDZ_INV_ZONE_ID: TBCDField;
    QryAislesWK_INV_ZONE_ID: TBCDField;
    Contents1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlagNotReadyToPost(Sender: TObject);
    procedure btnPreviewPostClick(Sender: TObject);
    procedure wwDBComboDlgZoneLOCustomDlg(Sender: TObject);
    procedure wwDBComboDlgZoneLOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PkInvZoneBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgEplantCustomDlg(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure QryAislesBeforePost(DataSet: TDataSet);
    procedure QryAislesNewRecord(DataSet: TDataSet);
    procedure QryAislesCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgLocTypeCustomDlg(Sender: TObject);
    procedure PkAisleIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure QryAislesAfterScroll(DataSet: TDataSet);
    procedure lvLocsAdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FReadyToPost: Boolean;

    FBayStart   : Integer;
    FBayEnd     : Integer;
    FBayInterval: Integer;
    FBayCount   : Integer;

    FLevelStart   : Integer;
    FLevelEnd     : Integer;
    FLevelInterval: Integer;
    FLevelCount   : Integer;

    FPkListZoneType: string;

    procedure SetReadyToPost(const Value: Boolean);
    procedure Validate;
    procedure PopulateListView;
    procedure CreateLocations;
    procedure ClearListView;

    procedure SetLO_Inv_Zone_ID(const Value: Real);
    procedure SetAL_Inv_Zone_ID(const Value: Real);
    procedure SetDZ_Inv_Zone_ID(const Value: Real);
    procedure SetWK_Inv_Zone_ID(const Value: Real);
    procedure SetEPlant_ID(const Value: Real);
    procedure SetLocationType_ID(const Value: Real);

    function GetAL_Inv_Zone_ID: Real;
    function GetDZ_Inv_Zone_ID: Real;
    function GetLO_Inv_Zone_ID: Real;
    function GetWK_Inv_Zone_ID: Real;
    function GetEPlant_ID: Real;
    function GetLocationType_ID: Real;

    procedure AssignLookupKeyValue(const Value: Real; AField: TBCDField);
    //procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    function GetDivision_ID: Real;
  protected
    property ReadyToPost: Boolean read FReadyToPost write SetReadyToPost;
  public
    { Public declarations }
    class procedure DoShow;
    property LO_Inv_Zone_ID: Real read GetLO_Inv_Zone_ID write SetLO_Inv_Zone_ID;
    property AL_Inv_Zone_ID: Real read GetAL_Inv_Zone_ID write SetAL_Inv_Zone_ID;
    property DZ_Inv_Zone_ID: Real read GetDZ_Inv_Zone_ID write SetDZ_Inv_Zone_ID;
    property WK_Inv_Zone_ID: Real read GetWK_Inv_Zone_ID write SetWK_Inv_Zone_ID;
    property EPlant_ID: Real read GetEPlant_ID write SetEPlant_ID;
    property LocationType_ID: Real read GetLocationType_ID write SetLocationType_ID;
    property Division_ID: Real read GetDivision_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  PanelMsg,
  sys_share,
  IQMS.Common.HelpHook;

const
  cnstAppendNew = 1;

{ TGenCargo}

constructor TLocGenCargo.Create( AOwner: TFrmInvAisleLocationGenerator; ALoc_Desc, AAisle, ABay, ALevel, ADescrip: string );
begin
  FOwner:= AOwner;
  Aisle:= AAisle;
  Bay  := ABay;
  Level:= ALevel;
  Loc_Desc:= ALoc_Desc;
  Descrip:= ADescrip;
  Locations_ID:= SelectValueFmtAsFloat('select id from locations where loc_desc = ''%s'' and nvl(eplant_id,0) = %f and nvl(division_id,0) = %f',
                           [ Loc_Desc,
                             FOwner.EPlant_ID,
                             FOwner.Division_ID ]);
end;

{ TFrmInvAisleLocationGenerator }

class procedure TFrmInvAisleLocationGenerator.DoShow;
var
  aFrmInvAisleLocationGenerator : TFrmInvAisleLocationGenerator;
begin
  aFrmInvAisleLocationGenerator := TFrmInvAisleLocationGenerator.Create(uniGUIApplication.UniApplication);
  aFrmInvAisleLocationGenerator.ShowModal;
end;

procedure TFrmInvAisleLocationGenerator.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvAisleLocationGenerator.FlagNotReadyToPost(Sender: TObject);
begin
  ReadyToPost:= FALSE;
end;

procedure TFrmInvAisleLocationGenerator.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmWMS{CHM}, iqhtmWMS{HTM} );
end;

procedure TFrmInvAisleLocationGenerator.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  ClearListView;
  Action:= caFree;
  IQRegFormWrite(self, [ self, chkUpdateLocType, chkUpdateBuilding, chkUpdateAllocatingZone,
                        chkUpdateLocatingZone, chkUpdateDropZone, chkUpdateWorkZone ]);
  IQMS.Common.Controls.PostMessageToForm( 'TFrmInvLocationType', iq_RefreshDataSets, 1, 0 );
  IQMS.Common.Controls.PostMessageToForm( 'TFrmInvAisles', iq_RefreshDataSets, 1, 0 );
end;

function TFrmInvAisleLocationGenerator.GetAL_Inv_Zone_ID: Real;
begin
  Result:= QryAislesAL_INV_ZONE_ID.asFloat;
end;

function TFrmInvAisleLocationGenerator.GetDivision_ID: Real;
begin
  Result:= QryAislesDIVISION_ID.asFloat;
end;

function TFrmInvAisleLocationGenerator.GetDZ_Inv_Zone_ID: Real;
begin
  Result:= QryAislesDZ_INV_ZONE_ID.asFloat;
end;

function TFrmInvAisleLocationGenerator.GetEPlant_ID: Real;
begin
  Result:= QryAislesEPLANT_ID.asFloat;
end;

function TFrmInvAisleLocationGenerator.GetLocationType_ID: Real;
begin
  Result:= QryAislesLOCATION_TYPE_ID.asFloat;
end;

function TFrmInvAisleLocationGenerator.GetLO_Inv_Zone_ID: Real;
begin
  Result:= QryAislesINV_ZONE_ID.asFloat;
end;

function TFrmInvAisleLocationGenerator.GetWK_Inv_Zone_ID: Real;
begin
  Result:= QryAislesWK_INV_ZONE_ID.asFloat;
end;

//procedure TFrmInvAisleLocationGenerator.IQNotify(var Msg: TMessage);
//begin
//  case Msg.WParam of
//    cnstAppendNew: if NavMain.Controls[ Ord(nbInsert) ].Enabled and SR.Enabled['NavMain'] and SR.Insert['NavMain'] then
//                      NavMain.BtnClick( nbInsert );
//  end;
//end;

procedure TFrmInvAisleLocationGenerator.AssignLookupKeyValue(const Value: Real; AField: TBCDField );
begin
  QryAisles.Edit;
  if Value > 0 then
     AField.asFloat:= Value
  else
     AField.Clear;
end;

procedure TFrmInvAisleLocationGenerator.SetAL_Inv_Zone_ID(const Value: Real);
begin
  AssignLookupKeyValue( Value, QryAislesAL_INV_ZONE_ID );
end;

procedure TFrmInvAisleLocationGenerator.SetDZ_Inv_Zone_ID(const Value: Real);
begin
  AssignLookupKeyValue( Value, QryAislesDZ_INV_ZONE_ID );
end;

procedure TFrmInvAisleLocationGenerator.SetEPlant_ID(const Value: Real);
begin
  AssignLookupKeyValue( Value, QryAislesEPLANT_ID );
end;

procedure TFrmInvAisleLocationGenerator.SetLocationType_ID(const Value: Real);
begin
  AssignLookupKeyValue( Value, QryAislesLOCATION_TYPE_ID );
end;

procedure TFrmInvAisleLocationGenerator.SetLO_Inv_Zone_ID(const Value: Real);
begin
  AssignLookupKeyValue( Value, QryAislesINV_ZONE_ID );
end;

procedure TFrmInvAisleLocationGenerator.SetWK_Inv_Zone_ID(const Value: Real);
begin
  AssignLookupKeyValue( Value, QryAislesWK_INV_ZONE_ID);
end;

procedure TFrmInvAisleLocationGenerator.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self, chkUpdateLocType, chkUpdateBuilding, chkUpdateAllocatingZone,
                        chkUpdateLocatingZone, chkUpdateDropZone, chkUpdateWorkZone ]);

  IQSetTablesActive( TRUE, self );

  lblDivision.Caption:= sys_share.CheckReplaceDivisionCaption( lblDivision.Caption );

  LocateOrPickList( self, 0, QryAisles, PkAisle );
end;

procedure TFrmInvAisleLocationGenerator.SetReadyToPost(const Value: Boolean);
begin
  FReadyToPost:= Value;

  if FReadyToPost then
     begin
       lvLocs.ParentFont:= TRUE;
       btnPreviewPost.Caption:= 'Post';
     end
  else
     begin
       lvLocs.Font.Color:= clGray;
       btnPreviewPost.Caption:= 'Preview';
       ClearListView;
     end;
end;

procedure TFrmInvAisleLocationGenerator.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvAisleLocationGenerator.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmInvAisleLocationGenerator.btnPreviewPostClick(Sender: TObject);
begin
  QryAisles.CheckBrowseMode;

  // check prepare
  if not ReadyToPost then
  begin
    Validate;
    PopulateListView;
    ReadyToPost:= TRUE;
    EXIT;
  end;

  // execute!
  CreateLocations;

  IQInformation('Finished generating locations.');
  ReadyToPost:= FALSE;
end;

procedure TFrmInvAisleLocationGenerator.Validate;
begin
  FReadyToPost  := FALSE;
  FBayStart     := QryAislesBAY_START.asInteger;
  FBayEnd       := QryAislesBAY_END.asInteger;
  FBayInterval  := QryAislesBAY_INTERVAL.asInteger;
  FBayCount     := 0;
  FLevelStart   := QryAislesLEVEL_START.asInteger;
  FLevelEnd     := QryAislesLEVEL_END.asInteger;
  FLevelInterval:= QryAislesLEVEL_INTERVAL.asInteger;
  FLevelCount   := 0;

  // check mandatory params
  IQAssert( FBayStart > 0, 'Invalid Bay ''Start'' - operation aborted.');
  IQAssert( FBayEnd > 0, 'Invalid Bay ''End'' - operation aborted.');
  IQAssert( FBayInterval > 0, 'Invalid Bay ''Interval'' - operation aborted.');
  IQAssert( FBayEnd >= FBayStart, 'Invalid Bay start/end range - operation aborted.');
  FBayCount:= (FBayEnd - FBayStart) div FBayInterval + 1;
  IQAssert( FBayStart + FBayInterval * ( FBayCount - 1 ) = FBayEnd, 'Bay ''End'' conflicts with ''Start'' and ''Interval'' settings - operation aborted');

  // populate level optional numeric params
  if (QryAislesLEVEL_PREFIX.asString > '') or (FLevelStart > 0) or (FLevelEnd > 0) or (FLevelInterval > 0) then
  begin
    IQAssert( FLevelStart > 0, 'Invalid Level ''Start'' - operation aborted.');
    IQAssert( FLevelEnd > 0, 'Invalid Level ''End'' - operation aborted.');
    IQAssert( FLevelInterval > 0, 'Invalid Level ''Interval'' - operation aborted.');
    IQAssert( FLevelEnd >= FLevelStart, 'Invalid Level start/end range - operation aborted.');
    FLevelCount:= (FLevelEnd - FLevelStart) div FLevelInterval + 1;
    IQAssert( FLevelStart + FLevelInterval * ( FLevelCount - 1 ) = FLevelEnd, 'Level ''End'' conflicts with ''Start'' and ''Interval'' settings - operation aborted');
  end;

  IQAssert( LocationType_ID > 0, 'Location type must be selected - operation aborted');
end;

procedure TFrmInvAisleLocationGenerator.wwDBComboDlgEplantCustomDlg(
  Sender: TObject);
begin
  if SecurityManager.EPlant_ID_AsFloat > 0 then
     ABORT;

  with PkEPlant do
    if Execute then
       EPlant_ID:= GetValue('id');
end;

procedure TFrmInvAisleLocationGenerator.wwDBComboDlgLocTypeCustomDlg(
  Sender: TObject);
begin
  with PkLocationType do
    if Execute then
       LocationType_ID:= GetValue('ID');
end;

procedure TFrmInvAisleLocationGenerator.wwDBComboDlgZoneLOCustomDlg(
  Sender: TObject);
begin
  if   Sender = wwDBComboDlgZoneLO then    FPkListZoneType:= 'LO'
  else if Sender = wwDBComboDlgZoneAL then FPkListZoneType:= 'AL'
  else if Sender = wwDBComboDlgZoneDZ then FPkListZoneType:= 'DZ'
  else if Sender = wwDBComboDlgZoneWK then FPkListZoneType:= 'WK'
  else                                     ABORT;

  with PkInvZone do
    if Execute then
    begin
      if      Sender = wwDBComboDlgZoneLO then LO_Inv_Zone_ID:= GetValue('ID')
      else if Sender = wwDBComboDlgZoneAL then AL_Inv_Zone_ID:= GetValue('ID')
      else if Sender = wwDBComboDlgZoneDZ then DZ_Inv_Zone_ID:= GetValue('ID')
      else if Sender = wwDBComboDlgZoneWK then WK_Inv_Zone_ID:= GetValue('ID')
      else    ABORT;
    end;
end;


procedure TFrmInvAisleLocationGenerator.wwDBComboDlgZoneLOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TUniEdit) then
  begin
    if      Sender = wwDBComboDlgZoneLO then LO_Inv_Zone_ID:= 0
    else if Sender = wwDBComboDlgZoneAL then AL_Inv_Zone_ID:= 0
    else if Sender = wwDBComboDlgZoneDZ then DZ_Inv_Zone_ID:= 0
    else if Sender = wwDBComboDlgZoneWK then WK_Inv_Zone_ID:= 0
    else if (Sender = wwDBComboDlgEPlant) and (SecurityManager.EPlant_ID_AsFloat = 0) then EPlant_ID:= 0
    else if (Sender = wwDBComboDlgLocType) then LocationType_ID:= 0
    else    ABORT;

    if Sender is TUniEdit then
       TUniEdit(Sender).Text:= '';

    Key:= 0;
  end;
end;

procedure TFrmInvAisleLocationGenerator.PkAisleIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 );
end;

procedure TFrmInvAisleLocationGenerator.PkInvZoneBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'zone_type', FPkListZoneType);
end;

procedure TFrmInvAisleLocationGenerator.PopulateListView;
var
  ABay, ALevel: Integer;
  AAisleBay: string;
  AAisleBayStripped: string;
  AListItem: TListItem;
  ACargo: TLocGenCargo;
  ALoc_Desc: string;
  ADescrip : string;
begin
  ClearListView;

  ABay:= FBayStart;
  while ABay <= FBayEnd do
  begin
    // build AISLE-BAY string, ex AISLE-BAY1
    AAisleBay:= Format( '%s-%s%d', [ edAisle.Text, edBayPrefix.Text, ABay ]);
    AAisleBayStripped:= Format( '%s%s%d', [ edAisle.Text, edBayPrefix.Text, ABay ]);

    // add bay column, ex BAY1
    AListItem:= lvLocs.Items.Add;
    AListItem.Caption:= Format( '%s%d', [ edBayPrefix.Text, ABay ]);  // just bay prefix+number

    // check append level
    if FLevelCount > 0 then
       begin
         ALevel:= FLevelStart;
         while ALevel <= FLevelEnd do
         begin
            // if this is the 1st time we print level use ListItem created above otherwise create new one w/o caption
            if ALevel > FLevelStart then
               AListItem:= lvLocs.Items.Add;

            // add as a subitem - full location name: aisle-bay-level, ex AISLE-BAY1-LEVEL1
            ALoc_Desc:= AAisleBayStripped + Format( '%s%d', [ edLevelPrefix.Text, ALevel ]);
            ADescrip := AAisleBay + Format( '-%s%d', [ edLevelPrefix.Text, ALevel ]);
            AListItem.SubItems.Add( ADescrip );
            AListItem.SubItems.Add( ALoc_Desc );

            // add the object with ready to go aisle, bay and level
            AListItem.Data:= TLocGenCargo.Create( self,                                     {owner }
                                          ALoc_Desc,                                        {loc_desc }
                                          edAisle.Text,                                     {aisle, ex AISLE}
                                          Format( '%s%d', [ edBayPrefix.Text, ABay ]),      {bay, ex BAY1}
                                          Format( '%s%d', [ edLevelPrefix.Text, ALevel ]),  {level, ex LEVEL1}
                                          ADescrip);

            ALevel:= ALevel + FLevelInterval;
         end;
       end
    else
       begin
         // show aisle + bay
         ALoc_Desc:= AAisleBayStripped;
         ADescrip := AAisleBay;
         AListItem.SubItems.Add( ADescrip );
         AListItem.SubItems.Add( ALoc_Desc );

         // add the object with ready to go aisle & bay (level is blank)
         AListItem.Data:= TLocGenCargo.Create( self,                                          {owner}
                                               ALoc_Desc,                                     {loc_desc }
                                               edAisle.Text,                                  {aisle}
                                               Format( '%s%d', [ edBayPrefix.Text, ABay ]),   {bay}
                                               '',                                            {level}
                                               ADescrip);
       end;

    ABay:= ABay + FBayInterval;
  end;
end;

procedure TFrmInvAisleLocationGenerator.QryAislesAfterScroll(DataSet: TDataSet);
begin
  ReadyToPost:= FALSE;
end;

procedure TFrmInvAisleLocationGenerator.QryAislesBeforePost(DataSet: TDataSet);
begin
  IQAssert( Trim(QryAislesNAME.asString) > '', 'Aisle must be entered - operation aborted.');
  IQAssignIDBeforePost( DataSet, 'inv_aisles');
end;

procedure TFrmInvAisleLocationGenerator.ClearListView;
var
  I: Integer;
begin
  for i:= 0 to lvLocs.Items.Count - 1 do
    if Assigned( lvLocs.Items[ i ].Data  ) then
       TLocGenCargo( lvLocs.Items[ i ].Data ).Free;

  lvLocs.Items.Clear;
end;


procedure TFrmInvAisleLocationGenerator.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( HelpContext );
end;

procedure TFrmInvAisleLocationGenerator.CreateLocations;
var
  I: Integer;
  hMsg: TPanelMesg;
  ADB: TFDCustomConnection;
  ADivision_ID: string;
  ABuilding: string;

  // ---------------------------------------------------------------------------
  procedure _Add( ALoc_Desc, AAisle, ABay, ALevel, ADescrip: string );
  begin
    ExecuteCommandFmt('declare                                                '+
              '  v_inv_aisles_id number::= %f;                        '+
              '  v_aisle         varchar2(9):= ''%s'';                '+
              '  v_building      varchar2(60):= ''%s'';               '+
              '  v_division_id   number:= %s;                         '+
              '  v_eplant_id     number:= %s;                         '+
              'begin                                                  '+
              // insert into locations
              '  insert into locations                                '+
              '       ( loc_desc,                                     '+
              '         descrip,                                      '+
              '         inv_aisles_id,                                '+
              '         loc_bay,                                      '+
              '         loc_level,                                    '+
              '         location_type_id,                             '+
              '         auto_dispo_default_loc,                       '+
              '         disable_del_empty,                            '+
              '         non_conform,                                  '+
              '         non_conform_allocatable,                      '+
              '         no_backflush,                                 '+
              '         no_ship,                                      '+
              '         recv_default,                                 '+
              '         ship_default,                                 '+
              '         ship_dock,                                    '+
              '         transit,                                      '+
              '         vmi,                                          '+
              '         division_id,                                  '+
              '         inv_zone_id,                                  '+
              '         al_inv_zone_id,                               '+
              '         dz_inv_zone_id,                               '+
              '         wk_inv_zone_id,                               '+
              '         eplant_id,                                    '+
              '         building )                                    '+
              '  select                                               '+
              '         ''%s'',                                       '+     // loc_desc
              '         ''%s'',                                       '+     // descrip
              '         v_inv_aisles_id,                              '+     // loc_aisle
              '         ''%s'',                                       '+     // loc_bay
              '         ''%s'',                                       '+     // loc_level
              '         id,                                           '+     // location_type_id
              '         auto_dispo_default_loc,                       '+
              '         disable_del_empty,                            '+
              '         non_conform,                                  '+
              '         non_conform_allocatable,                      '+
              '         no_backflush,                                 '+
              '         no_ship,                                      '+
              '         recv_default,                                 '+
              '         ship_default,                                 '+
              '         ship_dock,                                    '+
              '         transit,                                      '+
              '         vmi,                                          '+
              '         v_division_id,                                '+     // division_id
              '         %s,                                           '+     // inv_zone_id
              '         %s,                                           '+     // al_inv_zone_id
              '         %s,                                           '+     // dz_inv_zone_id
              '         %s,                                           '+     // wk_inv_zone_id
              '         v_eplant_id,                                  '+
              '         v_building                                    '+
              '    from location_type                                 '+
              '   where id = %f;                                      '+
              'end;                                                   ',
              [ QryAislesID.asFloat,
                UpperCase(FixStr( AAisle )),                           // declaration of the block
                FixStr( ABuilding ),
                ADivision_ID,
                IQMS.Common.StringUtils.FloatToStr0asNull( EPlant_ID, 'null'),
                FixStr( ALoc_Desc ),
                FixStr( ADescrip ),
                FixStr( ABay ),
                FixStr( ALevel ),
                IQMS.Common.StringUtils.FloatToStr0asNull( LO_Inv_Zone_ID, 'null' ),
                IQMS.Common.StringUtils.FloatToStr0asNull( AL_Inv_Zone_ID, 'null' ),
                IQMS.Common.StringUtils.FloatToStr0asNull( DZ_Inv_Zone_ID, 'null' ),
                IQMS.Common.StringUtils.FloatToStr0asNull( WK_Inv_Zone_ID, 'null' ),
                LocationType_ID ]);
  end;

  // ---------------------------------------------------------------------------
  procedure _UpdateLookupField( ALocations_ID: Real; AFieldName: string; AValue: Real );
  begin
    // update locations set INV_ZONE_ID = 123 where id =456
    ExecuteCommandFmt('update locations set %s = %s where id = %f',
              [ AFieldName,
                IQMS.Common.StringUtils.FloatToStr0asNull( AValue, 'null' ),
                ALocations_ID ]);
  end;

  // ---------------------------------------------------------------------------
  procedure _Update( ALocations_ID: Real );
  begin
    if chkUpdateLocType.Checked then
       _UpdateLookupField( ALocations_ID, 'location_type_id', LocationType_ID );

    if chkUpdateAllocatingZone.Checked then
       _UpdateLookupField( ALocations_ID, 'al_inv_zone_id', AL_Inv_Zone_ID );

    if chkUpdateLocatingZone.Checked then
       _UpdateLookupField( ALocations_ID, 'inv_zone_id', LO_Inv_Zone_ID );

    if chkUpdateDropZone.Checked then
       _UpdateLookupField( ALocations_ID, 'dz_inv_zone_id', DZ_Inv_Zone_ID );

    if chkUpdateWorkZone.Checked then
       _UpdateLookupField( ALocations_ID, 'wk_inv_zone_id', WK_Inv_Zone_ID );

    if chkUpdateBuilding.Checked then
       ExecuteCommandFmt('update locations set building = ''%s'' where id = %f', [ ABuilding, ALocations_ID ]);
  end;


// -----------------------------------------------------------------------------
begin
  if not IQConfirmYN( Format('About to create/update %d locations in the master location table. Please confirm to continue.', [ lvLocs.Items.Count ])) then
     ABORT;

  ADivision_ID:= 'null';
  if Division_ID > 0 then
     ADivision_ID:= FloatToStr(Division_ID);
  ABuilding:= QryAislesBUILDING.asString;

  hMsg:= hPleaseWait('');
  ADB:= FDManager.FindConnection('IQFD');
  ADB.StartTransaction;
  try
    for I:= 0 to lvLocs.Items.Count - 1 do
    begin
       if TLocGenCargo( lvLocs.Items[ I ].Data ).Locations_ID > 0  then
          _Update( TLocGenCargo( lvLocs.Items[ I ].Data ).Locations_ID )

       else
          _Add( TLocGenCargo( lvLocs.Items[ I ].Data ).Loc_Desc,   //  lvLocs.Items[ I ].SubItems[ 0 ],
                TLocGenCargo( lvLocs.Items[ I ].Data ).Aisle,
                TLocGenCargo( lvLocs.Items[ I ].Data ).Bay,
                TLocGenCargo( lvLocs.Items[ I ].Data ).Level,
                TLocGenCargo( lvLocs.Items[ I ].Data ).Descrip );
    end;

    ADB.Commit;
  finally
    hMsg.Free;
    if ADB.InTransaction then
       ADB.RollBack;
  end;

end;

procedure TFrmInvAisleLocationGenerator.sbtnSearchClick(
  Sender: TObject);
begin
  if PkAisle.Execute then
     QryAisles.Locate('ID', PkAisle.GetValue('ID'), [])
end;


procedure TFrmInvAisleLocationGenerator.QryAislesNewRecord(DataSet: TDataSet);
begin
  if SecurityManager.EPlant_ID_AsFloat > 0 then
     EPlant_ID:= SecurityManager.EPlant_ID_AsFloat;

  QryAislesBAY_START.asFloat:= 1;
  QryAislesBAY_INTERVAL.asFloat:= 1;
end;


procedure TFrmInvAisleLocationGenerator.QryAislesCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('eplant_id').asFloat > 0 then
     DataSet.FieldByName('EplantDisp').asString:= Format('[%.0f] %s',
                                                         [ DataSet.FieldByName('eplant_id').asFloat,
                                                           SelectValueByID('name', 'eplant', DataSet.FieldByName('eplant_id').asFloat )]);

  if QryAislesINV_ZONE_ID.asFloat > 0 then
     QryAislesLocatingZone.asString:= SelectValueByID('code', 'inv_zone', QryAislesINV_ZONE_ID.asFloat);

  if QryAislesAL_INV_ZONE_ID.asFloat > 0 then
     QryAislesAllocatingZone.asString:= SelectValueByID('code', 'inv_zone', QryAislesAL_INV_ZONE_ID.asFloat);

  if QryAislesDZ_INV_ZONE_ID.asFloat > 0 then
     QryAislesDropZone.asString:= SelectValueByID('code', 'inv_zone', QryAislesDZ_INV_ZONE_ID.asFloat );

  if QryAislesWK_INV_ZONE_ID.asFloat > 0 then
     QryAislesWorkZone.asString:= SelectValueByID('code', 'inv_zone', QryAislesWK_INV_ZONE_ID.asFloat );

  if QryAislesLOCATION_TYPE_ID.asFloat > 0 then
     QryAislesLocationType.asString:= SelectValueByID('descrip', 'location_type', QryAislesLOCATION_TYPE_ID.asFloat );
end;


procedure TFrmInvAisleLocationGenerator.lvLocsAdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  ALocations_ID: Real;
begin
  if Assigned(Item) and Assigned(Item.Data) then
     ALocations_ID:= TLocGenCargo( Item.Data ).Locations_ID
  else
     EXIT;

  if ALocations_ID = 0 then
     Sender.Canvas.Font.Color := clBlue;
end;

end.
