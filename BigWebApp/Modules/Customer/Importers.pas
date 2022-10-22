unit Importers;

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
  TFrmImporters = class(TUniForm)
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
    SrcImporter: TDataSource;
    TblImporter: TFDTable;
    TblImporterEPlant_Name: TStringField;
    TblImporterATTN: TStringField;
    TblImporterADDR1: TStringField;
    TblImporterADDR2: TStringField;
    TblImporterADDR3: TStringField;
    TblImporterCITY: TStringField;
    TblImporterSTATE: TStringField;
    TblImporterCOUNTRY: TStringField;
    TblImporterZIP: TStringField;
    TblImporterPHONE_NUMBER: TStringField;
    TblImporterEXT: TStringField;
    TblImporterFAX: TStringField;
    TblImporterPRIME_CONTACT: TStringField;
    TblImporterUSE_USA_MASK: TStringField;
    TblImporterNOTES: TStringField;
    TblImporterEPLANT_ID: TBCDField;
    TblImporterID: TBCDField;
    TblImporterSHIP_TIME: TBCDField;
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
    procedure TblImporterBeforeDelete(DataSet: TDataSet);
    procedure TblImporterBeforeOpen(DataSet: TDataSet);
    procedure TblImporterBeforePost(DataSet: TDataSet);
    procedure TblImporterNewRecord(DataSet: TDataSet);
    procedure DoGetTelephoneText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure dbeShipCountryChange(Sender: TObject);
    procedure SrcImporterDataChange(Sender: TObject; Field: TField);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDataSource:TDataSource;
  public
    { Public declarations }
    class procedure DoShow;
  end;


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

class procedure TFrmImporters.DoShow;
var
  frm: TFrmImporters;
begin
  frm := TFrmImporters.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmImporters.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Grid, PnlLeft01, PnlLeft02]);

  IQMS.Common.Controls.AdjustPageControlToParent(PC);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient04);
end;

procedure TFrmImporters.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  // 07/24/2012
  IQMS.Common.Regional.LoadCountries(dbeShipCountry);
  dbeShipCountryChange(dbeShipCountry);
end;

procedure TFrmImporters.dbeShipCountryChange(Sender: TObject);
begin
  IQMS.Common.Regional.LoadStateCombo(dbcShipState,dbeShipCountry);
end;

procedure TFrmImporters.sbtnEPlantClick(Sender: TObject);
begin
  DoChangePlantID( TblImporter ); { IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmImporters.sbtnTableFormClick(Sender: TObject);
begin
//  IQMS.Common.Controls.TogglePageControl(PC);
  PC.ActivePageIndex := abs(PC.ActivePageIndex -1);
end;

procedure TFrmImporters.SrcImporterDataChange(Sender: TObject; Field: TField);
begin
  if (TblImporter.State = dsBrowse) then
    dbeShipCountryChange(dbeShipCountry);
end;

procedure TFrmImporters.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmImporters.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid, PnlLeft01, PnlLeft02]);
end;

procedure TFrmImporters.sbtnSearchClick(Sender: TObject);
begin
  with PkSearch do
    if Execute then
       SrcImporter.DataSet.Locate('ID',  GetValue('ID'), []);
end;

procedure TFrmImporters.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmImporters.TblImporterBeforeDelete(DataSet: TDataSet);
begin
  ExecuteCommandFmt('update ship_to set importer_id = null where importer_id = %f', [ TblImporterID.asFloat ]);
{ TODO -oLema : Dependent on WC-5863 Customer - Cust}
//  if (Owner is TFrm_Cust) then
//    PostMessage( TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_ImporterChanged, 0);    {IQMS.Common.UserMessages.pas}
end;

procedure TFrmImporters.TblImporterBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmImporters.TblImporterBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  // Validate data entry for state
  IQMS.Common.Regional.CheckClearStateCode(TblImporterSTATE, dbcShipState);
{ TODO -oLema : Dependent on WC-5863 Customer - Cust}
//  if (Owner is TFrm_Cust) then
//    PostMessage( TFrm_Cust(Owner).Handle, iq_Notify, cust_const.notify_ImporterChanged, 0);    {IQMS.Common.UserMessages.pas}
end;

procedure TFrmImporters.TblImporterNewRecord(DataSet: TDataSet);
begin
  // 04/04/2012
  CheckApplyUSAMask(TblImporterUSE_USA_MASK);
end;

procedure TFrmImporters.DoGetTelephoneText( Sender: TField; var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, TblImporterUSE_USA_MASK.AsString = 'Y');
end;

procedure TFrmImporters.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmImporters.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1220827 );
end;

end.
