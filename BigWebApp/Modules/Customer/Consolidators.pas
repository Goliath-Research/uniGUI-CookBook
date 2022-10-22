unit Consolidators;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  Vcl.Wwdatsrc,
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
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmConsolidator = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    sbtnTableForm: TUniSpeedButton;
    sbtnSearch: TUniSpeedButton;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    ToggleGridForm1: TUniMenuItem;
    PkSearch: TIQWebHPick;
    PkSearchID: TBCDField;
    PkSearchATTN: TStringField;
    PkSearchADDR1: TStringField;
    PkSearchADDR2: TStringField;
    PkSearchADDR3: TStringField;
    PkSearchCITY: TStringField;
    PkSearchSTATE: TStringField;
    PkSearchCOUNTRY: TStringField;
    PkSearchZIP: TStringField;
    PkSearchPHONE_NUMBER: TStringField;
    PkSearchEXT: TStringField;
    PkSearchFAX: TStringField;
    PkSearchPRIME_CONTACT: TStringField;
    PkSearchEPLANT_ID: TBCDField;
    IQAbout1: TIQWebAbout;
    SrcConsolidator: TDataSource;
    TblConsolidator: TFDTable;
    TblConsolidatorEPlant_Name: TStringField;
    TblConsolidatorATTN: TStringField;
    TblConsolidatorADDR1: TStringField;
    TblConsolidatorADDR2: TStringField;
    TblConsolidatorADDR3: TStringField;
    TblConsolidatorCITY: TStringField;
    TblConsolidatorSTATE: TStringField;
    TblConsolidatorCOUNTRY: TStringField;
    TblConsolidatorZIP: TStringField;
    TblConsolidatorPHONE_NUMBER: TStringField;
    TblConsolidatorEXT: TStringField;
    TblConsolidatorFAX: TStringField;
    TblConsolidatorPRIME_CONTACT: TStringField;
    TblConsolidatorUSE_USA_MASK: TStringField;
    TblConsolidatorNOTES: TStringField;
    TblConsolidatorEPLANT_ID: TBCDField;
    TblConsolidatorID: TBCDField;
    TblConsolidatorSHIP_TIME: TBCDField;
    QryEPlant: TFDQuery;
    QryEPlantID: TBCDField;
    QryEPlantPLANT_NAME: TStringField;
    PnlMain: TUniPanel;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    PnlFormView: TUniPanel;
    Splitter2: TUniSplitter;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label36: TUniLabel;
    Label37: TUniLabel;
    Label38: TUniLabel;
    Label39: TUniLabel;
    Label40: TUniLabel;
    Label41: TUniLabel;
    Label56: TUniLabel;
    Label42: TUniLabel;
    PnlClient02: TUniPanel;
    dbeShipCompany: TUniDBEdit;
    dbeShipAddr1: TUniDBEdit;
    dbeShipAddr2: TUniDBEdit;
    dbeShipAddr3: TUniDBEdit;
    dbeShipCity: TUniDBEdit;
    dbcShipState: TUniDBComboBox;
    dbeShipCountry: TUniDBComboBox;
    dbeShipZIP: TUniDBEdit;
    PnlClient03: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft02: TUniPanel;
    Label57: TUniLabel;
    Label58: TUniLabel;
    Label59: TUniLabel;
    lblEPlantName: TUniLabel;
    Label65: TUniLabel;
    PnlClient04: TUniPanel;
    sbtnEPlant: TUniSpeedButton;
    dbchkUSAmaskShipTo: TUniDBCheckBox;
    dbeShipPhone: TUniDBEdit;
    dbeShipFax: TUniDBEdit;
    dbePlantName: TUniDBEdit;
    dbeShipToExtension: TUniDBEdit;
    dbeShipContact: TUniDBEdit;
    TabGrid: TUniTabSheet;
    Grid: TIQUniGridControl;
    N2: TUniMenuItem;
    Contents1: TUniMenuItem;
    procedure sbtnEPlantClick(Sender: TObject);
    procedure sbtnTableFormClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSearchClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure TblConsolidatorBeforeDelete(DataSet: TDataSet);
    procedure TblConsolidatorBeforeOpen(DataSet: TDataSet);
    procedure TblConsolidatorBeforePost(DataSet: TDataSet);
    procedure TblConsolidatorNewRecord(DataSet: TDataSet);
    procedure DoGetTelephoneText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure dbeShipCountryChange(Sender: TObject);
    procedure SrcConsolidatorDataChange(Sender: TObject; Field: TField);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource:TDataSource;
  public
    { Public declarations }
  end;

procedure DoConsolidator;

implementation

{$R *.DFM}

uses
{ TODO -oLema : Dependent on WC-5863 Customer - Cust}
//  Cust,
  cust_const,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.JumpConstants,
//  IQMS.Common.UserMessages,
  IQMS.Common.Regional,
  IQMS.COmmon.SetPlant;

procedure DoConsolidator;
var
  frm: TFrmConsolidator;
begin
  frm := TFrmConsolidator.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmConsolidator.UniFormCreate(Sender: TObject);
begin
  // if Assigned( ASrcConsolidator ) then
  //    FDataSource:= ASrcConsolidator
  // else
  //    begin
  //      FDataSource:= SrcConsolidator;
  //    end;
  //
  // for I := 0 to self.ComponentCount - 1 do
  //   if      (self.Components[I] is TDbEdit)      then TDbEdit(self.Components[I]).Datasource := FDataSource
  //   else if (self.Components[I] is TDbComboBox)  then TDbComboBox(self.Components[I]).Datasource := FDataSource
  //   else if (self.Components[I] is TDbCheckBox)  then TDbCheckBox(self.Components[I]).Datasource := FDataSource
  //   else if (self.Components[I] is TDbNavigator) then TDbNavigator(self.Components[I]).Datasource := FDataSource
  //   else if (self.Components[I] is TwwDbGrid)    then TwwDbGrid(self.Components[I]).Datasource := FDataSource;

  IQRegFormRead( self, [self, Grid, PnlLeft01, PnlLeft02]);
  IQMS.Common.Controls.AdjustPageControlToParent(PC);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient04);

end;

procedure TFrmConsolidator.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQMS.Common.Regional.LoadCountries(dbeShipCountry);
  dbeShipCountryChange(dbeShipCountry);
end;

procedure TFrmConsolidator.dbeShipCountryChange(Sender: TObject);
begin
  IQMS.Common.Regional.LoadStateCombo(dbcShipState,dbeShipCountry);
end;

procedure TFrmConsolidator.sbtnEPlantClick(Sender: TObject);
begin
  DoChangePlantID(TBlConsolidator ); { IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmConsolidator.sbtnTableFormClick(Sender: TObject);
begin
//  IQMS.Common.Controls.TogglePageControl(PC);
  PC.ActivePageIndex := abs(PC.ActivePageIndex -1);

end;

procedure TFrmConsolidator.SrcConsolidatorDataChange(Sender: TObject;
  Field: TField);
begin
  if (TblConsolidator.State = dsBrowse) then
    dbeShipCountryChange(dbeShipCountry);
end;

procedure TFrmConsolidator.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsolidator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid, PnlLeft01, PnlLeft02]);
end;

procedure TFrmConsolidator.sbtnSearchClick(Sender: TObject);
begin
  with PkSearch do
    if Execute then
       SrcConsolidator.DataSet.Locate('ID',  GetValue('ID'), []);
end;

procedure TFrmConsolidator.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmConsolidator.TblConsolidatorBeforeDelete(DataSet: TDataSet);
begin
  ExecuteCommandFmt('update ship_to set consolidator_id = null where consolidator_id = %f', [ TblConsolidatorID.asFloat ]);
{ TODO -oLema : Dependent on WC-5863 Customer - Cust}
//  if (Owner is TFrm_Cust) then
//    PostMessage( TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_ConsolidatorChanged, 0);    {IQMS.Common.UserMessages.pas}
end;

procedure TFrmConsolidator.TblConsolidatorBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmConsolidator.TblConsolidatorBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  // Validate data entry for state
  IQMS.Common.Regional.CheckClearStateCode(TblConsolidatorSTATE, dbcShipState);

{ TODO -oLema : Dependent on WC-5863 Customer - Cust}
//  if (Owner is TFrm_Cust) then
//    PostMessage( TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_ConsolidatorChanged, 0);    {IQMS.Common.UserMessages.pas}
end;

procedure TFrmConsolidator.TblConsolidatorNewRecord(DataSet: TDataSet);
begin
  CheckApplyUSAMask(DataSet.FieldByName('USE_USA_MASK'));
//  DataSet.FieldByName('USE_USA_MASK').asString:= 'Y';
end;

procedure TFrmConsolidator.DoGetTelephoneText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, TblConsolidatorUSE_USA_MASK.AsString = 'Y');
end;

procedure TFrmConsolidator.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmConsolidator.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1198359 );
end;

end.
