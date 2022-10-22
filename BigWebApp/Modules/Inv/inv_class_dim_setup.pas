unit inv_class_dim_setup;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Mask,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmInvClassDimSetup = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    SrcArinvtDim: TDataSource;
    QryArinvtDim: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    QryArinvtDimID: TBCDField;
    QryArinvtDimNAME: TStringField;
    QryArinvtDimUOM: TStringField;
    wwDBComboBoxUOM: TUniDBComboBox;
    UpdateSQLArinvtDim: TFDUpdateSQL;
    QryArinvtDimARINVT_CLASS_ID: TBCDField;
    QryArinvtDimIsDimMandatory: TStringField;
    QryArinvtDimDEFAULT_VALUE: TFMTBCDField;
    QryArinvtDimCALCULATED: TStringField;
    QryArinvtDimFORMULA: TStringField;
    PnlFormulaBtns: TUniPanel;
    sbtnEditFormula: TUniSpeedButton;
    sbtnTestCalculatedParameters: TUniSpeedButton;
    PnlLegend: TUniPanel;
    shpCalculated: TUniPanel;
    sbtnInsertCalculated: TUniSpeedButton;
    PMain: TUniPopupMenu;
    InsertCalculatedRecord1: TUniMenuItem;
    EditFormula1: TUniMenuItem;
    TestFormula1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryArinvtDimBeforePost(DataSet: TDataSet);
    procedure QryArinvtDimBeforeOpen(DataSet: TDataSet);
    procedure QryArinvtDimNewRecord(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : No corresponding uniGui component
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn); }
    procedure QryArinvtDimCalcFields(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : No corresponding uniGui component type
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush); }
    procedure FormShow(Sender: TObject);
    procedure InsertCalculatedRecord1Click(Sender: TObject);
    procedure EditFormula1Click(Sender: TObject);
    procedure TestFormula1Click(Sender: TObject);
    procedure SrcArinvtDimDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FArinvtClass_ID: Real;
    procedure SetControls;
    procedure SetArinvt_Class_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(AArinvt_Class_ID: Real );
    property Arinvt_Class_ID: Real write SetArinvt_Class_ID;
  end;

implementation

{$R *.dfm}

uses
  formula_editor_inv_class_dim,
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm;
  { TODO -oathite -cWebConvert : Dependent on iqsecins
  iqsecins, }
  { TODO -oathite -cWebConvert : Dependent on uom_lst
  uom_lst;  }

{ TFrmInvDimSetup }

class procedure TFrmInvClassDimSetup.DoShowModal(AArinvt_Class_ID: Real);
var
  LFrmInvClassDimSetup :TFrmInvClassDimSetup;
begin
  LFrmInvClassDimSetup := TFrmInvClassDimSetup.Create( uniGUIApplication.UniApplication );
  LFrmInvClassDimSetup.Arinvt_Class_ID := AArinvt_Class_ID;
  LFrmInvClassDimSetup.ShowModal;
end;

procedure TFrmInvClassDimSetup.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  SetControls;
  Self.BringToFront;

  { TODO -oathite -cWebConvert : Dependent on iqsecins
  iqsecins.EnsureSecurityInspectorOnTopOf(Self);}

  { TODO -oathite -cWebConvert : Dependent on uom_lst
  uom_lst.PopulateUOMs( wwDBComboBoxUOM.Items ); }

  IQSetTablesActive(TRUE, self);
end;

procedure TFrmInvClassDimSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

{ TODO -oathite -cWebConvert : No corresponding uniGui component
procedure TFrmInvClassDimSetup.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end; }

procedure TFrmInvClassDimSetup.QryArinvtDimBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('arinvt_class_id').Value := FArinvtClass_ID;
end;

procedure TFrmInvClassDimSetup.QryArinvtDimBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'arinvt_class_dim');
end;

procedure TFrmInvClassDimSetup.QryArinvtDimCalcFields(DataSet: TDataSet);
  function _IsDimensionMandatory: Boolean;
  begin
    Result:= SelectValueByID('mandatory_dim', 'arinvt_class', QryArinvtDimARINVT_CLASS_ID.asFloat ) = 'Y';
  end;
begin
  if _IsDimensionMandatory() then
      QryArinvtDimIsDimMandatory.asString:= 'Y';
end;

procedure TFrmInvClassDimSetup.QryArinvtDimNewRecord(DataSet: TDataSet);
begin
  QryArinvtDimARINVT_CLASS_ID.asFloat:= FArinvtClass_ID;
end;

{ TODO -oathite -cWebConvert : No corresponding uniGui component type
procedure TFrmInvClassDimSetup.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then
     EXIT;

  if QryArinvtDimCALCULATED.AsString = 'Y' then
     ABrush.Color := shpCalculated.Brush.Color
  else if Field.ReadOnly then
     ABrush.Color:= clBtnFace;
end; }

procedure TFrmInvClassDimSetup.ApplyUpdates(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmInvClassDimSetup.SetArinvt_Class_ID(const Value: Real);
begin
  FArinvtClass_ID := Value;
  Caption:= Format(inv_rscstr.cTXT0000189 , [ SelectValueByID('class', 'arinvt_class', Value)]);  {'%s Class Dimensional Inventory / Characteristics'}
end;

procedure TFrmInvClassDimSetup.SetControls;
begin
  // Edit Formula is available only for calculated
  IQMS.Common.Controls.IQEnableControl([sbtnEditFormula, EditFormula1],
    QryArinvtDimCALCULATED.AsString = 'Y');

  // Test Formula is available only for calculated with formula text
  IQMS.Common.Controls.IQEnableControl([sbtnTestCalculatedParameters, TestFormula1],
   (QryArinvtDimCALCULATED.AsString = 'Y') and
   (QryArinvtDimFORMULA.AsString > ''));

  // Default Value is unavailable for calculated
  QryArinvtDimDEFAULT_VALUE.ReadOnly :=
    (QryArinvtDimCALCULATED.AsString = 'Y') or
    not SR.ReadWrite['QryArinvtDimDEFAULT_VALUE'];
end;

procedure TFrmInvClassDimSetup.SrcArinvtDimDataChange(Sender: TObject;
  Field: TField);
begin
  if Showing then
    SetControls;
end;

procedure TFrmInvClassDimSetup.InsertCalculatedRecord1Click(Sender: TObject);
begin
  // 10/23/2015  EIQ-9205
  if not SR.Enabled['InsertCalculatedRecord1'] then
    Exit;

  if (QryArinvtDim.State in [dsEdit, dsInsert]) then
    QryArinvtDim.Post;
  QryArinvtDim.Append;
  // Ensure the CALCULATED field is set
  ForceValue(SrcArinvtDim, QryArinvtDimCALCULATED, 'Y');
  // Edit the formula (see below)
  EditFormula1Click(Sender);
end;

procedure TFrmInvClassDimSetup.EditFormula1Click(Sender: TObject);
var
  S: string;
begin
  // 10/23/2015  EIQ-9205
  if not SR.Enabled['EditFormula1'] then
    Exit;
  S := QryArinvtDimFORMULA.AsString;
  if formula_editor_inv_class_dim.DoEditFormula(Trunc(FArinvtClass_ID),
    QryArinvtDimNAME.AsString, S) then
    begin
      if not (QryArinvtDim.State in [dsEdit, dsInsert]) then
        QryArinvtDim.Edit;
      QryArinvtDimFORMULA.AsString := S;
      //QryArinvtDim.Post;
    end;
end;

procedure TFrmInvClassDimSetup.TestFormula1Click(Sender: TObject);
var
  AErrorMsg: string;
begin
  // 10/23/2015  EIQ-9205
  if not SR.Enabled['TestFormula1'] then
    Exit;

  if not formula_editor_inv_class_dim.TFrmFormulaEditorInvClassDim.TestFormula(
    QryArinvtDimFORMULA.AsString, 'arinvt_class_dim', {var} AErrorMsg) then
    raise Exception.Create(AErrorMsg)
  else
    // inv_rscstr.cTXT0000208 = 'Success!  No errors found.';
    IQMS.Common.Dialogs.IQInformation(inv_rscstr.cTXT0000208);
end;

end.
