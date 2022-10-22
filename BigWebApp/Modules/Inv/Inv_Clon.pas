unit Inv_Clon;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  Vcl.Menus,
  Vcl.Buttons,
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
  uniCheckBox,
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
  uniMainMenu,
  uniLabel, uniComboBox, uniDBComboBox;

type
  TFrmCloneArinvt = class(TUniForm)
    wwQryEPlant: TFDQuery;
    wwQryEPlantPLANT_NAME: TStringField;
    wwQryEPlantECODE: TStringField;
    wwQryEPlantCOMPANY_NAME: TStringField;
    wwQryEPlantPLANT_ID: TBCDField;
    wwQryClass: TFDQuery;
    wwQuery1CLASS: TStringField;
    wwQuery1DESCRIP: TStringField;
    StoredProc1: TFDStoredProc;
    PnlButtonCarrier: TUniPanel;
    PnlButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
    Label3: TUniLabel;
    Label5: TUniLabel;
    Label4: TUniLabel;
    Label1: TUniLabel;
    wwLookupClass: TUniDBLookupComboBox;
    edItemNo: TUniEdit;
    edRev: TUniEdit;
    wwcombPlant: TUniDBLookupComboBox;
    chkIncludeAutoMrp: TUniCheckBox;
    Bevel1: TUniPanel;
    chkIncludeUDForm: TUniCheckBox;
    chkIncludeAKAInfo: TUniCheckBox;
    chkSPCInspectionSetup: TUniCheckBox;
    prcSPCInspection: TFDStoredProc;
    chkIncludeCostingInformation: TUniCheckBox;
    chkIncludeInternalDocuments: TUniCheckBox;
    chkIncludeExternalDocuments: TUniCheckBox;
    chkEmailCorrespondence: TUniCheckBox;
    chkForecastGroup: TUniCheckBox;
    chkTierDiscount: TUniCheckBox;
    SecurityRegister1: TIQWebSecurityRegister;
    chkIncludePricing: TUniCheckBox;
    chkIncludeAKAInfoBuying: TUniCheckBox;
    chkIncludeGeneral: TUniCheckBox;
    PnlToolbarCheckBox: TUniPanel;
    sbtnSelectAll: TUniSpeedButton;
    sbtnUnselectAll: TUniSpeedButton;
    PControls: TUniPopupMenu;
    CheckBoxes1: TUniMenuItem;
    CheckBoxesSelectAll1: TUniMenuItem;
    CheckBoxesUnselectAll1: TUniMenuItem;
    SrcClass: TDataSource;
    SrcEPlant: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBoxesSelectAll1Click(Sender: TObject);
    procedure CheckBoxesUnselectAll1Click(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FClass    : string;
    FItemNo   : string;
    FRev      : string;
    FEPlant_ID: Real;
    FNew_Arinvt_ID: Real;
    procedure SaveOriginal;
    procedure AssignVars( AItemNo: string = ''; ARev: string = '' );
    procedure Validate;
    procedure CheckAndRaise( ACondition: Boolean; const AMsg: string );
    function GetNew_EPlant_ID: Real;
    function IsChanged: Boolean;
    procedure CloneItem;
    procedure EnableEPlantClone;
    procedure ReadCheckBoxStates;
    procedure WriteCheckBoxStates;
    procedure SetAllCheckBoxState(const AChecked: Boolean);
    procedure SetArinvt_ID(const Value: Real);
    procedure SetItemNo(const Value: String);
    procedure SetRev(const Value: String);
  public
    { Public declarations }
    property Arinvt_ID : Real write SetArinvt_ID;
    property ItemNo : String write SetItemNo;
    property Rev : String write SetRev;
    property New_EPlant_ID: Real read GetNew_EPlant_ID;
    property New_Arinvt_ID: Real read FNew_Arinvt_ID write FNew_Arinvt_ID;
  end;

function DoCloneInventoryItem( AOld_Arinvt_ID: Real; var ANew_Arinvt_ID: Real; AItemNo: string = ''; ARev: string = '' ): Boolean;

implementation

{$R *.DFM}

uses
  inv_rscstr,
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO : IQSecIns not yet converted }
  //IQSecIns,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  System.Variants,
  IQMS.Common.UserFields;

function DoCloneInventoryItem( AOld_Arinvt_ID: Real; var ANew_Arinvt_ID: Real; AItemNo: string = ''; ARev: string = '' ): Boolean;
var
  LFrmCloneArinvt : TFrmCloneArinvt;
begin
  LFrmCloneArinvt := TFrmCloneArinvt.Create( UniGUIApplication.UniApplication);
  with LFrmCloneArinvt do
  begin
    Arinvt_ID := AOld_Arinvt_ID;
    ItemNo :=  AItemNo;
    Rev := ARev;
    Result:= ShowModal = mrOK;
    if Result then
       ANew_Arinvt_ID:= New_Arinvt_ID;
  end;
end;

procedure TFrmCloneArinvt.FormShow(Sender: TObject);
begin
  Caption   := Format(inv_rscstr.cTXT0000069 {'Clone Inventory Item [ ID = %.0f ]'}, [ FArinvt_ID ]);
 { TODO : GetUD_MenuCaption of IQMS.Common.UserFields is not compiling }
 // chkIncludeUDForm.Caption:= inv_rscstr.cTXT0000135 {'Include'} + ' ' + DefaultToString( GetUD_MenuCaption('ARINVT'), inv_rscstr.cTXT0000134 {'User Defined Form Information'});
  SaveOriginal;
  IQSetTablesActive( TRUE, self );
  AssignVars(FItemNo, FRev);
  EnableEPlantClone;
  IQRegFormRead( self, [self, PnlLeft01]);
  ReadCheckBoxStates;
  { TODO : IQSecIns not yet converted }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmCloneArinvt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01]);
  WriteCheckBoxStates;
end;

procedure TFrmCloneArinvt.ReadCheckBoxStates;
var
  i: Integer;
begin
  for i := 0 to PnlClient01.ControlCount - 1 do
   if PnlClient01.Controls[i] is TUniCheckBox then
    IQRegFormRead( self, [TUniCheckBox(PnlClient01.Controls[i])]);
end;

procedure TFrmCloneArinvt.WriteCheckBoxStates;
var
  i: Integer;
begin
  for i := 0 to PnlClient01.ControlCount - 1 do
   if PnlClient01.Controls[i] is TUniCheckBox then
    IQRegFormWrite( self, [TUniCheckBox(PnlClient01.Controls[i])]);
end;

procedure TFrmCloneArinvt.SaveOriginal;
var
  A: Variant;
begin
    A:= SelectValueArrayFmt( 'select class, itemno, rev, eplant_id from arinvt where id = %f', [ FArinvt_ID ]);
    if VarArrayDimCount( A ) > 0 then             // check to see if array is not empty
    begin
      FClass    := A[ 0 ];
      if SelectValueAsString('select enable_inv_num_gen from iqsys') = 'Y' then
        FItemNo:= FloatToStr( GetNextSequenceNumber( 'S_ARINVT_ITEMNO' ))
      else
        FItemNo   := A[ 1 ];
      FRev      := Trim(A[ 2 ]);
      FEPlant_ID:= A[ 3 ];
    end;
end;

procedure TFrmCloneArinvt.AssignVars( AItemNo: string = ''; ARev: string = '' );
begin
{ TODO : TUniDBLookupComboBox does not contain any member LookupValue and PerformSearch }
 { wwLookupClass.LookupValue:= FClass;
  wwLookupClass.PerformSearch;

  wwcombPlant.LookupValue:= SelectValueFmtAsString('select name from eplant where id = %f', [ FEPlant_ID ]);
  wwcombPlant.PerformSearch;  }

  if AItemNo <> '' then
     edItemNo.Text:= AItemNo
  else
     edItemNo.Text:= FItemNo;

  if ARev <> '' then
     edRev.Text:= ARev
  else
     edRev.Text:= FRev;
end;

procedure TFrmCloneArinvt.EnableEPlantClone;
begin
  IQEnableControl( wwcombPlant, SecurityManager.EPlant_ID = 'NULL' );
end;

procedure TFrmCloneArinvt.btnOKClick(Sender: TObject);
begin
  Validate;
  if edRev.Text = '' then edRev.Text:= ' ';
  CloneItem;
  ModalResult:= mrOK;
end;

procedure TFrmCloneArinvt.Validate;
begin
  CheckAndRaise( Trim(wwLookupClass.Text) <> '', inv_rscstr.cTXT0000007 {'Please enter a class.'});
  CheckAndRaise( Trim(edItemNo.Text) <> '',      inv_rscstr.cTXT0000070 {'Please enter an item number.'});
  // CheckAndRaise( edRev.Text <> '',               'Please enter an item revision number.'   );
  CheckAndRaise( IsChanged,                      inv_rscstr.cTXT0000071 {'Please enter values before attempting to save this record.'});
end;

function TFrmCloneArinvt.IsChanged: Boolean;
begin
  Result:= ( FClass     <> wwLookupClass.Text ) or
           ( FItemNo    <> edItemNo.Text      ) or
           ( FRev       <> Trim(edRev.Text)   ) or
           ( FEPlant_ID <> New_EPlant_ID      );
end;

procedure TFrmCloneArinvt.CheckAndRaise( ACondition: Boolean; const AMsg: string );
begin
  if not ACondition then
    raise Exception.Create( AMsg );
end;

function TFrmCloneArinvt.GetNew_EPlant_ID: Real;
begin
  if wwcombPlant.Text = '' then
     Result:= 0
  else
     Result:= wwQryEPlantPLANT_ID.asFloat;
end;

procedure TFrmCloneArinvt.CloneItem;
begin
  with StoredProc1 do
  begin
    ParamByName('v_old_arinvt').Value := FArinvt_ID;
    ParamByName('v_class').Value := wwLookupClass.Text;
    ParamByName('v_itemno').Value := edItemNo.Text;
    ParamByName('v_rev').Value := edRev.Text;
    if New_EPlant_ID = 0 then
       ParamByName('v_eplant_id').Clear
    else
       ParamByName('v_eplant_id').Value := New_EPlant_ID;

    ParamByName('v_include_auto_mrp').Value := BoolToYN( chkIncludeAutoMrp.Checked );
    ParamByName('v_include_ud_form').Value := BoolToYN( chkIncludeUDForm.Checked );
    ParamByName('v_include_aka').Value := BoolToYN( chkIncludeAKAInfo.Checked );
    ParamByName('v_include_aka_buying').Value := BoolToYN( chkIncludeAKAInfoBuying.Checked );
    ParamByName('v_include_costing').Value := BoolToYN( chkIncludeCostingInformation.Checked );
    ParamByName('v_include_internal').Value := BoolToYN( chkIncludeInternalDocuments.Checked );
    ParamByName('v_include_external').Value := BoolToYN( chkIncludeExternalDocuments.Checked );
    ParamByName('v_include_email').Value := BoolToYN( chkEmailCorrespondence.Checked );
    ParamByName('v_include_fr_group_id').Value := BoolToYN( chkForecastGroup.Checked );
    ParamByName('v_include_spcinspection').Value := BoolToYN( chkSPCInspectionSetup.Checked );
    ParamByName('v_include_tier_disc').Value := BoolToYN( chkTierDiscount.Checked );
    ParamByName('v_include_pricing').Value := BoolToYN( chkIncludePricing.Checked );
    ParamByName('v_include_general').Value := BoolToYN( chkIncludeGeneral.Checked );

    Prepare;
    ExecProc;
    New_Arinvt_ID:= ParamByName('result').asFloat;
  end;
(*
  // 02/05/2007 Clone Inspection Setup parameters and gage/device information
  if chkSPCInspectionSetup.Checked then
     with prcSPCInspection do
     begin
       ParamByName('v_from_source').Value := 'ARINVT';
       ParamByName('v_from_source_id').Value := FArinvt_ID;
       ParamByName('v_to_source').Value := 'ARINVT';
       ParamByName('v_to_source_id').Value := New_Arinvt_ID;
       Prepare;
       ExecProc;
     end;  *)
end;

procedure TFrmCloneArinvt.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCloneArinvt.CheckBoxesSelectAll1Click(Sender: TObject);
begin
  SetAllCheckBoxState(True);
end;

procedure TFrmCloneArinvt.CheckBoxesUnselectAll1Click(Sender: TObject);
begin
  SetAllCheckBoxState(False);
end;

procedure TFrmCloneArinvt.SetAllCheckBoxState(const AChecked: Boolean);
var
  i: Integer;
begin
  for i := 0 to PnlClient01.ControlCount - 1 do
   if PnlClient01.Controls[i] is TUniCheckBox then
     TUniCheckBox(PnlClient01.Controls[i]).Checked := AChecked;
end;

procedure TFrmCloneArinvt.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmCloneArinvt.SetItemNo(const Value: String);
begin
  FItemNo := Value;
end;

procedure TFrmCloneArinvt.SetRev(const Value: String);
begin
  FRev := Value;
end;

end.
