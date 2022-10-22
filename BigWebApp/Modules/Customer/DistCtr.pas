unit DistCtr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  DM_Cust,
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
  TFrmDistCtr = class(TUniForm)
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
    SrcDistCtr: TDataSource;
    TblDistCtr: TFDTable;
    TblDistCtrEPlant_Name: TStringField;
    TblDistCtrATTN: TStringField;
    TblDistCtrADDR1: TStringField;
    TblDistCtrADDR2: TStringField;
    TblDistCtrADDR3: TStringField;
    TblDistCtrCITY: TStringField;
    TblDistCtrSTATE: TStringField;
    TblDistCtrCOUNTRY: TStringField;
    TblDistCtrZIP: TStringField;
    TblDistCtrPHONE_NUMBER: TStringField;
    TblDistCtrEXT: TStringField;
    TblDistCtrFAX: TStringField;
    TblDistCtrPRIME_CONTACT: TStringField;
    TblDistCtrUSE_USA_MASK: TStringField;
    TblDistCtrNOTES: TStringField;
    TblDistCtrEPLANT_ID: TBCDField;
    TblDistCtrID: TBCDField;
    TblDistCtrSHIP_TIME: TBCDField;
    QryEPlant: TFDQuery;
    QryEPlantID: TBCDField;
    QryEPlantPLANT_NAME: TStringField;
    Contents1: TUniMenuItem;
    Panel2: TUniPanel;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    PnlFormView: TUniPanel;
    Splitter3: TUniSplitter;
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
    Splitter2: TUniSplitter;
    PnlLeft02: TUniPanel;
    Label57: TUniLabel;
    Label58: TUniLabel;
    Label59: TUniLabel;
    lblEPlantName: TUniLabel;
    Label65: TUniLabel;
    PnlClient04: TUniPanel;
    sbtnEPlant: TUniSpeedButton;
    dbeShipContact: TUniDBEdit;
    dbchkUSAmaskShipTo: TUniDBCheckBox;
    dbeShipPhone: TUniDBEdit;
    dbeShipFax: TUniDBEdit;
    dbePlantName: TUniDBEdit;
    dbeShipToExtension: TUniDBEdit;
    TabGrid: TUniTabSheet;
    Grid: TIQUniGridControl;
    procedure sbtnEPlantClick(Sender: TObject);
    procedure sbtnTableFormClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSearchClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure TblDistCtrBeforeDelete(DataSet: TDataSet);
    procedure TblDistCtrBeforeOpen(DataSet: TDataSet);
    procedure TblDistCtrBeforePost(DataSet: TDataSet);
    procedure TblDistCtrNewRecord(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DoGetTelephoneText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbeShipCountryChange(Sender: TObject);
    procedure SrcDistCtrDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource:TDataSource;
    procedure SetSrc_DistCtr(const Value: TDataSource);
  public
    { Public declarations }
    DM: TCust_DM;
    property Src_DistCtr : TDataSource write SetSrc_DistCtr;
  end;

procedure DoDistStr( ASrcDistCtr: TDataSource );

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Regional,
  IQMS.COmmon.SetPlant;

procedure DoDistStr( ASrcDistCtr: TDataSource );
var
  LFrmDistCtr : TFrmDistCtr;
begin
  LFrmDistCtr := TFrmDistCtr.Create( UniApplication );
  LFrmDistCtr.Src_DistCtr := ASrcDistCtr;
  LFrmDistCtr.Show;
end;

procedure TFrmDistCtr.FormShow(Sender: TObject);
begin
  // Update controls by calling datasource change
  SrcDistCtrDataChange(FDataSource, NIL);
end;

procedure TFrmDistCtr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
end;

procedure TFrmDistCtr.dbeShipCountryChange(Sender: TObject);
begin
  IQMS.Common.Regional.LoadStateCombo(dbcShipState,dbeShipCountry);
end;

procedure TFrmDistCtr.sbtnEPlantClick(Sender: TObject);
begin
  DoChangePlantID( FDataSource.DataSet ); { IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmDistCtr.sbtnTableFormClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(PC);
end;

procedure TFrmDistCtr.SetSrc_DistCtr(const Value: TDataSource);
var
  I:Integer;
begin
  if Assigned( Value ) then
     begin
       FDataSource:= Value;
       FDataSource.OnDataChange := Self.SrcDistCtrDataChange;
     end
  else
     begin
       IQSetTablesActive( TRUE, self );
       FDataSource:= SrcDistCtr;
     end;

  for I := 0 to self.ComponentCount - 1 do
    if      (self.Components[I] is TUniDBEdit)      then TUniDBEdit(self.Components[I]).Datasource := FDataSource
    else if (self.Components[I] is TUniDBComboBox)  then TUniDBComboBox(self.Components[I]).Datasource := FDataSource
    else if (self.Components[I] is TUniDBCheckBox)  then TUniDBCheckBox(self.Components[I]).Datasource := FDataSource
    else if (self.Components[I] is TUniDBNavigator) then TUniDBNavigator(self.Components[I]).Datasource := FDataSource
    else if (self.Components[I] is TIQUniGridControl)    then TIQUniGridControl(self.Components[I]).Datasource := FDataSource;
end;

procedure TFrmDistCtr.SrcDistCtrDataChange(Sender: TObject; Field: TField);
var
  ADataSet: TDataSet;
begin
  if (Sender is TDataSource) then
    ADataSet := TDataSource(Sender).DataSet
  else if (Sender is TDataSource) then
    ADataSet := TDataSource(Sender).DataSet
  else
    Exit;

  if Assigned(ADataSet) and (ADataSet.State = dsBrowse) then
    dbeShipCountryChange(dbeShipCountry);
end;

procedure TFrmDistCtr.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDistCtr.sbtnSearchClick(Sender: TObject);
begin
  with PkSearch do
    if Execute then
       FDataSource.DataSet.Locate('ID',  GetValue('ID'), []);
end;

procedure TFrmDistCtr.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmDistCtr.TblDistCtrBeforeDelete(DataSet: TDataSet);
begin
  ExecuteCommandFmt('update ship_to set dist_center_id = null where dist_center_id = %f', [ TblDistCtrID.asFloat ]);
end;

procedure TFrmDistCtr.TblDistCtrBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmDistCtr.TblDistCtrBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  // Validate data entry for state
  IQMS.Common.Regional.CheckClearStateCode(TblDistCtrSTATE, dbcShipState);
end;

procedure TFrmDistCtr.TblDistCtrNewRecord(DataSet: TDataSet);
begin
  // 04/04/2012
  CheckApplyUSAMask(TblDistCtrUSE_USA_MASK);
end;

procedure TFrmDistCtr.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Grid, PnlLeft01, PnlLeft02]);
  IQMS.Common.Controls.AdjustPageControlToParent(PC);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient04);

  // 07/24/2012
  IQMS.Common.Regional.LoadCountries(dbeShipCountry);
  dbeShipCountryChange(dbeShipCountry);
end;

procedure TFrmDistCtr.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1118642 );
end;

procedure TFrmDistCtr.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmDistCtr.DoGetTelephoneText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, TblDistCtrUSE_USA_MASK.AsString = 'Y'); // pas
end;

end.
