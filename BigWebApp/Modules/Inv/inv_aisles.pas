unit inv_aisles;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.wwDataInspector,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  IQMS.Common.JumpConstants,
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
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame;

type
  TFrmInvAisles = class(TUniForm)
    Panel9: TUniPanel;
    pnlAislesMain: TUniPanel;
    Splitter4: TUniSplitter;
    Splitter5: TUniSplitter;
    Panel15: TUniPanel;
    Panel16: TUniPanel;
    Panel22: TUniPanel;
    Panel5: TUniPanel;
    pnlProxAisles: TUniPanel;
    Panel24: TUniPanel;
    Panel25: TUniPanel;
    Panel26: TUniPanel;
    gridProxAisleLocations: TIQUniGridControl;
    gridAisleLocations: TIQUniGridControl;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Splitter1: TUniSplitter;
    pnlAislesTop: TUniPanel;
    gridAisles: TIQUniGridControl;
    Panel13: TUniPanel;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    PrintDialog1: TPrintDialog;
    IQAbout1: TIQWebAbout;
    srchProxAisles: TIQUniGridControl;
    QryAisles: TFDQuery;
    SrcAisles: TDataSource;
    wwQryDivisionLookup: TFDQuery;
    wwQryDivisionLookupNAME: TStringField;
    wwQryDivisionLookupEPLANT_NAME: TStringField;
    wwQryDivisionLookupID: TBCDField;
    QryAislesID: TBCDField;
    QryAislesNAME: TStringField;
    QryAislesEPLANT_ID: TBCDField;
    QryAislesDIVISION_ID: TBCDField;
    QryAislesEplantDisp: TStringField;
    wwDBLookupComboDivision: TUniDBLookupComboBox;
    wwDBComboDlgEplant: TUniEdit;
    UpdateSQLAisles: TFDUpdateSQL;
    PkAisle: TIQWebHPick;
    PkAisleID: TBCDField;
    PkAisleNAME: TStringField;
    PkAisleEPLANT_ID: TBCDField;
    PkAisleDIVISION_NAME: TStringField;
    SrcAisleLoc: TDataSource;
    QryAisleLoc: TFDQuery;
    QryAisleLocID: TBCDField;
    QryAisleLocLOC_DESC: TStringField;
    QryAisleLocDESCRIP: TStringField;
    PkAislesLocations: TIQWebHPick;
    PkAislesLocationsID: TBCDField;
    PkAislesLocationsLOC_DESC: TStringField;
    PkAislesLocationsDESCRIP: TStringField;
    PkAislesLocationsEPLANT_ID: TBCDField;
    PkAislesLocationsAISLE_NAME: TStringField;
    PkAislesLocationsDIVISION_NAME: TStringField;
    PkAislesLocationsINV_AISLES_ID: TBCDField;
    SrcProxAisles: TDataSource;
    QryProxAisles: TFDQuery;
    QryProxAislesID: TBCDField;
    QryProxAislesINV_AISLES_ID1: TBCDField;
    QryProxAislesINV_AISLES_ID2: TBCDField;
    QryProxAislesPROXIMITY_LEVEL: TBCDField;
    QryProxAislesAISLE_NAME: TStringField;
    PkProxAisle: TIQWebHPick;
    PkProxAisleID: TBCDField;
    PkProxAisleName: TStringField;
    PkProxAisleEplant_ID: TBCDField;
    PkProxAisleDivision_Name: TStringField;
    UpdateSQLProxAisles: TFDUpdateSQL;
    IQRepDef1: TIQWebRepDef;
    SrcProxAisleLoc: TDataSource;
    QryProxAisleLoc: TFDQuery;
    QryProxAisleLocLOC_DESC: TStringField;
    QryProxAisleLocDESCRIP: TStringField;
    QryProxAisleLocID: TBCDField;
    QryProxAislesINV_AISLE_ID: TFMTBCDField;
    PkProxAisleLocations: TIQWebHPick;
    PkProxAisleLocationsID: TBCDField;
    PkProxAisleLocationsLOC_DESC: TStringField;
    PkProxAisleLocationsDESCRIP: TStringField;
    PkProxAisleLocationsEPLANT_ID: TBCDField;
    PkProxAisleLocationsAISLE_NAME: TStringField;
    PkProxAisleLocationsDIVISION_NAME: TStringField;
    PkProxAisleLocationsINV_AISLES_ID: TBCDField;
    QryAislesDivsionName: TStringField;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryAislesCalcFields(DataSet: TDataSet);
    procedure QryAislesBeforePost(DataSet: TDataSet);
    procedure QryAislesNewRecord(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure wwDBComboDlgEplantCustomDlg(Sender: TObject);
    procedure sbtnSearchLocatingRuleClick(Sender: TObject);
    { TODO -oysingh -cWeb Convert : Can't upload the form because of the security register. }
    //procedure PkAisleIQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
    { TODO -oysingh -cWeb Convert : No corresponding uni component for TNavigatBtn }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    { TODO -oysingh -cWeb Convert : Dependent on IQSearchPickList. }
    //procedure PkAislesLocationsIQAfterHPickCreate(Sender: TObject);
    { TODO -oysingh -cWeb Convert : No corresponding uni component for TNavigatBtn }
    //procedure AisleLocationsDisptachAction(Sender: TObject; Button: TNavigateBtn);
    { TODO -oysingh -cWeb Convert : No corresponding uni component for TNavigatBtn }
    //procedure DispatchProxAisles(Sender: TObject; Button: TNavigateBtn);
    { TODO -oysingh -cWeb Convert : Dependent o  the unit IQSearchPickList }
    //procedure PkProxAisleIQAfterHPickCreate(Sender: TObject);
    procedure PkProxAisleBeforeOpen(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    { TODO -oysingh -cWeb Convert : No corresponding uni component for TNavigatBtn }
    //procedure ProxAisleLocationsDispatchAction(Sender: TObject; Button: TNavigateBtn);
    { TODO -oysingh -cWeb Convert : Dependent o  the unit IQSearchPickList }
    //procedure PkProxAisleLocationsIQAfterHPickCreate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    { TODO -oysingh -cWeb Convert : Dependent on  the unit inv_aisle_loc_gen }
    //procedure sbtnLocationGeneratorClick(Sender: TObject);
    procedure wwDBLookupComboDivisionCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure UniFormShow(Sender: TObject);
  private
    FID: Real;
    { TODO -oysingh -cWeb Convert : No corresponding uni component for TGridDrawState }
    //procedure IQSearchAisleLocationCalcCellColors(Sender: TObject;Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;ABrush: TBrush);
    { TODO -oysingh -cWeb Convert : No corresponding uni component for TGridDrawState }
    //procedure AssignAisleLocationCalcCellColors( Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush; APickListAisle_ID, AIsle_ID: Real );
    function AppendLocationsToAisle( AInvAisles_ID: Real; APk: TIQWebHPick ): Boolean;
    function DeleteLocationsFromAisle( ALocations_ID: Real ): Boolean;
    function AppendProxAislesToAisle(AInvAisles_ID: Real): Boolean;
    { TODO -oysingh -cWeb Convert : No corresponding uni component for TGridDrawState }
    //procedure IQSearchProxAisleCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    function IsProximityDefinedBetweenAisles(AInvAisles_ID1,
      AInvAisles_ID2: Real): Boolean;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure IQRefreshDataSet( var Msg: TMessage ); message iq_RefreshDataSets;
    procedure CheckAppendSelfToProximityTable;
    { TODO -oysingh -cWeb Convert : Dependent on  the unit inv_aisle_loc_gen }
    //procedure InsertInvAislesProximity(AID1, AID2: Real);
    { TODO -oysingh -cWeb Convert : No corresponding uni component for TGridDrawState }
    //procedure IQSearchProxAisleLocationCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure SetID(const Value: Real);
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent; AID: Real = 0);
    class procedure DoShow(AID: Real = 0);
    property ID : Real write SetID;
  end;

{var
  FrmInvAisles: TFrmInvAisles;  }

implementation

{$R *.dfm}

uses
  //inv_aisle_loc_gen,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  //IQSearchPickList,
  IQMS.WebVcl.SecurityManager,
  //SetPlant,
  Sys_Share;

{ TFrmInvAisles }
class procedure TFrmInvAisles.DoShow(AID: Real = 0);
var
  LFrmInvAisles : TFrmInvAisles;
begin
  LFrmInvAisles := TFrmInvAisles.create(UniGUIApplication.UniApplication);
  LFrmInvAisles.id := AID;
  with LFrmInvAisles.gridAisles do
  begin
     { TODO -oysingh -cWeb Convert : property selected for  'gridAisles' doesn't exist. }
    //CheckReplaceDivisionOfWWSelected( Selected );
    { TODO -oysingh -cWeb Convert : propertyApplySelected (which is a procedure) for  'gridAisles' doesn't exist. }
    //ApplySelected;
  end;

  IQRegFormRead( LFrmInvAisles, [ LFrmInvAisles, LFrmInvAisles.pnlAislesMain, LFrmInvAisles.pnlAislesTop, LFrmInvAisles.pnlProxAisles ]);

  { TODO -oysingh -cWeb Convert : No properties for the component srchProxAisles }
  //srchProxAisles.TopToolPanel.Visible:= FALSE;
  //srchProxAisles.wwFilterDialog.SelectedFields.Clear;
  //srchProxAisles.wwDBGrid.KeyOptions:= [ dgAllowDelete ];

  LocateOrPickList( LFrmInvAisles, AID, LFrmInvAisles.QryAisles, LFrmInvAisles.PkAisle );
end;

procedure TFrmInvAisles.Exit1Click(Sender: TObject);
begin
  Close;
end;

{constructor TFrmInvAisles.Create(AOwner: TComponent; AID: Real = 0);
begin
  inherited Create(AOwner);

  IQSetTAblesActive(TRUE, self);

  // warehouse vs division
  with gridAisles do
  begin
    CheckReplaceDivisionOfWWSelected( Selected );
    ApplySelected;
  end;

  IQRegFormRead( self, [ self, pnlAislesMain, pnlAislesTop, pnlProxAisles ]);

  srchProxAisles.TopToolPanel.Visible:= FALSE;
  srchProxAisles.wwFilterDialog.SelectedFields.Clear;
  srchProxAisles.wwDBGrid.KeyOptions:= [ dgAllowDelete ];

  LocateOrPickList( self, AID, QryAisles, PkAisle );
end;  }

procedure TFrmInvAisles.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvAisles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlAislesMain, pnlAislesTop, pnlProxAisles ]);
  //Action:= caFree;
end;

(*procedure TFrmInvAisles.PkAisleIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  { TODO -oysingh -cWeb Convert : Can't upload the form because of the security register. }
  SendInsertViaNavigator( NavMain, Action, ResultValue, SR );
end;*)

{procedure TFrmInvAisles.PkAislesLocationsIQAfterHPickCreate(Sender: TObject);
begin
  TFrmIQSearchPickList(Sender).IQSearch1.OnCalcCellColors:= IQSearchAisleLocationCalcCellColors;  // IQSearchPickList.pas
end;}

procedure TFrmInvAisles.PkProxAisleBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'inv_aisles_id', QryAislesID.asFloat);
//  TFDQuery(DataSet).ParamByName('inv_aisles_id').Value := QryAislesID.asFloat;
end;

{procedure TFrmInvAisles.PkProxAisleIQAfterHPickCreate(Sender: TObject);
begin
  TFrmIQSearchPickList(Sender).IQSearch1.OnCalcCellColors:= IQSearchProxAisleCalcCellColors;  // IQSearchPickList.pas
end; }

{procedure TFrmInvAisles.PkProxAisleLocationsIQAfterHPickCreate(Sender: TObject);
begin
  TFrmIQSearchPickList(Sender).IQSearch1.OnCalcCellColors:= IQSearchProxAisleLocationCalcCellColors;  // IQSearchPickList.pas
end; }

procedure TFrmInvAisles.Print1Click(Sender: TObject);
begin
  IQRepdef1.Execute
end;

procedure TFrmInvAisles.PrintSetup1Click(Sender: TObject);
begin
  PrintDialog1.Execute
end;

procedure TFrmInvAisles.IQNotify(var Msg: TMessage);
begin
   case Msg.WParam of
        // ensure inv_aisles_proximity is populated
     1: CheckAppendSelfToProximityTable;
   end;
end;

procedure TFrmInvAisles.IQRefreshDataSet(var Msg: TMessage);
begin
  case Msg.WParam of
     1: begin
          RefreshDataSetByID( QryAisles );
          RefreshDataSetByID( QryAisleLoc );
          RefreshDataSetByID( QryProxAisles );
          RefreshDataSetByID( QryProxAisleLoc );
        end;
  end;
end;

{procedure TFrmInvAisles.IQSearchAisleLocationCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  AInvAsiles_ID: Real;
begin
  if Sender is TIQUniGridControl then
     AInvAsiles_ID:= TIQUniGridControl(Sender).DataSource.DataSet.FieldByName('INV_AISLES_ID').asFloat
  else
     AInvAsiles_ID:= PkAislesLocationsINV_AISLES_ID.asFloat;
  AssignAisleLocationCalcCellColors( Sender, Field, State, Highlight, AFont, ABrush, AInvAsiles_ID, QryAislesID.asFloat );
end;  }

{procedure TFrmInvAisles.IQSearchProxAisleLocationCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  AInvAsiles_ID: Real;
begin
  if Sender is TIQUniGridControl then
     AInvAsiles_ID:= TIQUniGridControl(Sender).DataSource.DataSet.FieldByName('INV_AISLES_ID').asFloat
  else
     AInvAsiles_ID:= PkProxAisleLocationsINV_AISLES_ID.asFloat;
  AssignAisleLocationCalcCellColors( Sender, Field, State, Highlight, AFont, ABrush, AInvAsiles_ID, QryProxAislesINV_AISLE_ID.asFloat );
end; }

{procedure TFrmInvAisles.IQSearchProxAisleCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  case Highlight of
    FALSE:
       if PkProxAisleID.asFloat = QryAislesID.asFloat then
          AFont.Color := clGreen;
    TRUE :
       if PkProxAisleID.asFloat = QryAislesID.asFloat then
          begin
            ABrush.Color:= clBlack;
            AFont.Color := clLime;
          end
    end;
end; }

{procedure TFrmInvAisles.AssignAisleLocationCalcCellColors( Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush; APickListAisle_ID, AIsle_ID: Real );
begin
  case Highlight of
    FALSE:
       if APickListAisle_ID = AIsle_ID then
          AFont.Color := clGreen
       else if APickListAisle_ID > 0  then
          AFont.Color := clGray;
    TRUE :
       if APickListAisle_ID = AIsle_ID then
          begin
            ABrush.Color:= clBlack;
            AFont.Color := clLime;
          end
       else if APickListAisle_ID > 0  then
          begin
            ABrush.Color:= clBlack;
            AFont.Color := clYellow;
          end
    end;
end; }


procedure TFrmInvAisles.QryAislesBeforePost(DataSet: TDataSet);
begin
  IQAssert( Trim(QryAislesNAME.asString) > '', 'Aisle must be entered - operation aborted.');

  IQAssignIDBeforePost( DataSet, 'inv_aisles');
  QryAislesNAME.asString:= UpperCase(QryAislesNAME.asString);

  if DataSet.State = dsInsert then
     PostMessage( self.Handle, iq_Notify, 1, 0 );  // ensure inv_aisles_proximity is populated
end;

procedure TFrmInvAisles.QryAislesCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('eplant_id').asFloat > 0 then
     DataSet.FieldByName('EplantDisp').asString:= Format('[%.0f] %s',
                                                         [ DataSet.FieldByName('eplant_id').asFloat,
                                                           SelectValueByID('name', 'eplant', DataSet.FieldByName('eplant_id').asFloat )]);

  if QryAislesDIVISION_ID.asFloat <> 0 then
    QryAislesDivsionName.asString := SelectValueFmtAsString('select name from division where id = %f', [QryAislesDIVISION_ID.AsFloat]);

end;

procedure TFrmInvAisles.QryAislesNewRecord(DataSet: TDataSet);
begin
  if SecurityManager.EPlant_ID_AsFloat > 0 then
     QryAislesEPLANT_ID.asFloat:= SecurityManager.EPlant_ID_AsFloat;
end;

procedure TFrmInvAisles.sbtnSearchLocatingRuleClick(Sender: TObject);
begin
  with PkAisle do
    if Execute then
       QryAisles.Locate('id', GetValue('id'), [])
    else
       ABORT;
end;

procedure TFrmInvAisles.SetID(const Value: Real);
begin
  FID := Value;
end;

{procedure TFrmInvAisles.UniFormCreate(Sender: TObject);
begin
  // warehouse vs division
  with gridAisles do
  begin
    CheckReplaceDivisionOfWWSelected( Selected );
    ApplySelected;
  end;

  IQRegFormRead( self, [ self, pnlAislesMain, pnlAislesTop, pnlProxAisles ]);

  srchProxAisles.TopToolPanel.Visible:= FALSE;
  srchProxAisles.wwFilterDialog.SelectedFields.Clear;
  srchProxAisles.wwDBGrid.KeyOptions:= [ dgAllowDelete ];

  LocateOrPickList( self, AID, QryAisles, PkAisle );
end;     }

procedure TFrmInvAisles.UniFormShow(Sender: TObject);
begin
  IQSetTAblesActive(TRUE, self);
end;

procedure TFrmInvAisles.wwDBComboDlgEplantCustomDlg(Sender: TObject);
begin
  QryAisles.CheckBrowseMode;
  { TODO -oysingh -cWeb Convert : Dependent on  the unit SetPlant }
  // DoChangePlantID( self, QryAisles );  {SetPlant.pas}
end;

procedure TFrmInvAisles.wwDBLookupComboDivisionCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if not (QryAisles.State in [dsInsert, dsEdit]) then
    QryAisles.Edit;

  QryAislesDIVISION_ID.Value := wwQryDivisionLookupID.Value;
end;

procedure TFrmInvAisles.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

{procedure TFrmInvAisles.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  QCheckRefresh(Sender, Button);
end;  }

procedure TFrmInvAisles.Contents1Click(Sender: TObject);
begin
 IQHelp.HelpContext( HelpContext );
end;

procedure TFrmInvAisles.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

{procedure TFrmInvAisles.AisleLocationsDisptachAction(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        RefreshDataSetByID( QryAisleLoc );
        ABORT;
      end;
    nbInsert:
      begin
        QryAisles.CheckBrowseMode;
        if AppendLocationsToAisle( QryAislesID.asFloat, PkAislesLocations ) then
           RefreshDataSetByID( QryAisleLoc );
        ABORT;
      end;
    nbDelete:
      begin
        if DeleteLocationsFromAisle( QryAisleLocID.asFloat ) then
           RefreshDataSetByID( QryAisleLoc );
        ABORT;
      end;
  end;
end; }

function TFrmInvAisles.AppendLocationsToAisle( AInvAisles_ID: Real; APk: TIQWebHPick ): Boolean;
var
  I: Integer;
begin
  Result:= False;
  if AInvAisles_ID = 0 then EXIT;

  with APk do
   if ExecuteEx('ID') then
   begin
      for I:= 0 to ResultList.Count - 1 do
        ExecuteCommandFmt('update locations set inv_aisles_id = %f where id = %s', [ AInvAisles_ID, ResultList[ I ] ]);
      Result:= TRUE;
   end;
end;


function TFrmInvAisles.DeleteLocationsFromAisle( ALocations_ID: Real ): Boolean;
begin
  Result:= False;
  if ALocations_ID = 0 then
     EXIT;
  if not IQConfirmYN('Remove selected location from the aisle?') then
     EXIT;

  ExecuteCommandFmt('update locations set inv_aisles_id = null where id = %f', [ ALocations_ID  ]);
  Result:= True;
end;


{procedure TFrmInvAisles.DispatchProxAisles(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      IQCheckRefresh(Sender, Button);
    nbInsert:
      begin
        if AppendProxAislesToAisle( QryAislesID.asFloat ) then
           RefreshDataSetByID( QryProxAisles );
        ABORT;
      end;
  end;
end; }

function TFrmInvAisles.AppendProxAislesToAisle( AInvAisles_ID: Real ): Boolean;
var
  I: Integer;
begin
  Result:= False;
  QryAisles.CheckBrowseMode;
  if QryAislesID.asFloat = 0 then EXIT;

  with PkProxAisle do
   if ExecuteEx('ID') then
   begin
      for I:= 0 to ResultList.Count - 1 do
        if not IsProximityDefinedBetweenAisles( AInvAisles_ID, StrToFloat( ResultList[ I ])) then  // precaution
           { TODO -oysingh -cWeb Convert : Dependent on  the unit inv_aisle_loc_gen }
           //InsertInvAislesProximity( AInvAisles_ID, StrToFloat( ResultList[ I ]));

      Result:= TRUE;
   end;
end;

function TFrmInvAisles.IsProximityDefinedBetweenAisles( AInvAisles_ID1, AInvAisles_ID2: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from inv_aisles_proximity                 '+
                     ' where inv_aisles_id1 = %f and inv_aisles_id2 = %f '+
                     '       or                                          '+
                     '       inv_aisles_id1 = %f and inv_aisles_id2 = %f ',
                     [ AInvAisles_ID1,
                       AInvAisles_ID2,
                       AInvAisles_ID2,
                       AInvAisles_ID1]) = 1;
end;

{procedure TFrmInvAisles.ProxAisleLocationsDispatchAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        RefreshDataSetByID( QryProxAisleLoc );
        ABORT;
      end;
    nbInsert:
      begin
        if AppendLocationsToAisle( QryProxAislesINV_AISLE_ID.asFloat, PkProxAisleLocations ) then
           RefreshDataSetByID( QryProxAisleLoc );
        ABORT;
      end;
    nbDelete:
      begin
        if DeleteLocationsFromAisle( QryProxAisleLocID.asFloat ) then
           RefreshDataSetByID( QryProxAisleLoc );
        ABORT;
      end;
  end;
end;    }

procedure TFrmInvAisles.CheckAppendSelfToProximityTable;
begin
  //  done via TI_INV_AISLES trigger. Just refresh the QryProxAisles
  // if not IsProximityDefinedBetweenAisles( QryAislesID.asFloat, QryAislesID.asFloat ) then
  //   InsertInvAislesProximity( QryAislesID.asFloat, QryAislesID.asFloat );
  Reopen(QryProxAisles);
end;

{ TODO -oysingh -cWeb Convert : Dependent on  the unit inv_aisle_loc_gen }
{procedure TFrmInvAisles.InsertInvAislesProximity( AID1, AID2: Real );
begin
  ExecuteCommandFmt('insert into inv_aisles_proximity                         '+
            '     ( inv_aisles_id1, inv_aisles_id2, proximity_level ) '+
            ' values                                                  '+
            '      ( %f, %f, 1 )',
            [ AID1, AID2 ]);
  Reopen(QryProxAisles);
end;    }

{procedure TFrmInvAisles.sbtnLocationGeneratorClick(Sender: TObject);
begin
  TFrmInvAisleLocationGenerator.DoShow( self );  // inv_aisle_loc_gen.pas
end;            }


end.
