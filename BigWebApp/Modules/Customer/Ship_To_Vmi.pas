unit Ship_To_Vmi;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
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
  TFrmShip_To_VMI = class(TUniForm)
    Panel1: TUniPanel;
    wwDataSource1: TDataSource;
    wwTblShip_To_VMI: TFDTable;
    wwTblShip_To_VMIID: TBCDField;
    wwTblShip_To_VMISHIP_TO_ID: TBCDField;
    wwTblShip_To_VMILOCATIONS_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    wwDBGrid1: TIQUniGridControl;
    wwTblShip_To_VMILoc_Desc: TStringField;
    wwQryLocationsLookup: TFDQuery;
    wwQryLocationsLookupLOC_DESC: TStringField;
    wwQryLocationsLookupDESCRIP: TStringField;
    wwQryLocationsLookupEPLANT_ID: TBCDField;
    wwQryLocationsLookupID: TBCDField;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwTblShip_To_VMILoc_Full_Description: TStringField;
    sbtnMasterLocations: TUniSpeedButton;
    Bevel1: TUniPanel;
    SrcQryLocation: TDataSource;
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure wwTblShip_To_VMIBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMasterLocationsClick(Sender: TObject);
    procedure wwDBLookupCombo1BeforeDropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwTblShip_To_VMICalcFields(DataSet: TDataSet);
    procedure wwDBLookupCombo1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure UniFormCreate(Sender: TObject);
  private
    FSrcShip_To: TDataSource;
    procedure SetSrcShip_To(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowModeless( ASrcShip_To: TDataSource );
    class procedure ShowModal( ASrcShip_To: TDataSource );
    property SrcShip_To : TDataSource write SetSrcShip_To;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;
  { TODO -oathite -cWebConvert : Depends on IqSecIns
  iqsecins, }
  { TODO -oathite -cWebConvert : Depends on Location
  Location, }

class procedure TFrmShip_To_VMI.ShowModeless( ASrcShip_To: TDataSource );
var
  AForm: TUniForm;
begin
  AForm:= FindFormByClassName( 'TFrmShip_To_VMI' );
  if not Assigned( AForm ) then
  begin
    AForm:= TFrmShip_To_VMI.Create( uniGUIApplication.UniApplication );
    TFrmShip_To_VMI(AForm).SrcShip_To := ASrcShip_To;
  end;

  AForm.Show;
end;

procedure TFrmShip_To_VMI.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, wwDBGrid1 ]);
end;

procedure TFrmShip_To_VMI.SetSrcShip_To(const Value: TDataSource);
begin
  wwTblShip_To_VMI.MasterSource:= Value;
end;

class procedure TFrmShip_To_VMI.ShowModal( ASrcShip_To: TDataSource );
var
  AForm: TUniForm;
begin
  AForm:= FindFormByClassName( 'TFrmShip_To_VMI' );
  if not Assigned( AForm ) then
  begin
    AForm:= TFrmShip_To_VMI.Create( uniGUIApplication.UniApplication );
    TFrmShip_To_VMI(AForm).SrcShip_To := ASrcShip_To;
  end;
  AForm.ShowModal;
end;

procedure TFrmShip_To_VMI.FormShow(Sender: TObject);
begin
  // 09/29/2015 (Byron, EIQ-8899) Security inspector
  { TODO -oathite -cWebConvert : Depends on IqSecIns
  iqsecins.EnsureSecurityInspectorOnTopOf(Self);     }
end;

procedure TFrmShip_To_VMI.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, wwDBGrid1 ]);
end;

procedure TFrmShip_To_VMI.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
end;

procedure TFrmShip_To_VMI.wwDBLookupCombo1BeforeDropDown(Sender: TObject);
begin
  wwQryLocationsLookup.Close;
  wwQryLocationsLookup.Open;
end;

procedure TFrmShip_To_VMI.wwTblShip_To_VMIBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;


procedure TFrmShip_To_VMI.wwTblShip_To_VMICalcFields(DataSet: TDataSet);
begin
  if wwTblShip_To_VMILOCATIONS_ID.asFloat <> 0 then
  begin
    wwTblShip_To_VMILoc_Desc.asString := SelectValueByID('LOC_DESC', 'LOCATIONS', wwTblShip_To_VMILOCATIONS_ID.asFloat);
    wwTblShip_To_VMILoc_Full_Description.asString := SelectValueByID('DESCRIP', 'LOCATIONS', wwTblShip_To_VMILOCATIONS_ID.asFloat);
  end;
end;

procedure TFrmShip_To_VMI.sbtnMasterLocationsClick(Sender: TObject);
begin
  (*DoLocations; *) {Locaiton.pas}
end;

procedure TFrmShip_To_VMI.wwDBLookupCombo1CloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  wwTblShip_To_VMILOCATIONS_ID.asFloat := wwQryLocationsLookupID.asFloat;
end;

end.
