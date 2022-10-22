unit wo_alloc_substitute;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmWO_Alloc_Substitute = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    GroupBox1: TUniGroupBox;
    pnlArinvt: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    lblItemDescrip: TUniLabel;
    lblItemDescripExt: TUniLabel;
    lblItemClass: TUniLabel;
    lblItemRev: TUniLabel;
    Panel5: TUniPanel;
    wwDBComboDlgArinvt: TUniEdit;
    edItemDescrip: TUniEdit;
    edItemExtDescrip: TUniEdit;
    edItemClass: TUniEdit;
    edItemRev: TUniEdit;
    GroupBox2: TUniGroupBox;
    chkUnknown: TUniCheckBox;
    chkPrimary: TUniCheckBox;
    chkProcess: TUniCheckBox;
    wwDBGridProcess: TIQUniGridControl;
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
    PkArinvtSTANDARD_ID: TBCDField;
    PkArinvtPHANTOM: TStringField;
    SrcProcess: TDataSource;
    QryProcess: TFDQuery;
    QryProcessPTOPER_ID: TBCDField;
    QryProcessOPSEQ: TBCDField;
    QryProcessSNDOP_ID: TBCDField;
    QryProcessOPNO: TStringField;
    QryProcessOPDESC: TStringField;
    QryProcessOP_CLASS: TStringField;
    Panel1: TUniPanel;
    sbtnAlternateItems: TUniSpeedButton;
    procedure wwDBComboDlgArinvtCustomDlg(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure QryProcessBeforeOpen(DataSet: TDataSet);
    procedure ProcessCheckBoxClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FSndop_ID: Real;
    FWorkorder_Bom_ID: Real;
    FTop_Workorder_BOM_ID: Real;
    FParent_Arinvt_ID: Real;
    FParent_Standard_ID: Real;
    FSubstituted_Arinvt_ID: Real;
    FMfgtype_Lookup: string;

    procedure AssignItem(AArinvt_ID: Real);
    procedure EnableComponents;
    procedure AppendToWorkorder_BOM;
    function GetProcessFieldAsString(AFieldName: string): string;
  public
    { Public declarations }
    class function DoShowModal(ATop_Workorder_BOM_ID: Real;
      var AWorkorder_BOM_ID: Real; ASubstituted_Arinvt_ID: Real = 0): Boolean;
    property Workorder_Bom_ID: Real read FWorkorder_Bom_ID
      write FWorkorder_Bom_ID;
  end;

implementation

{$R *.dfm}

uses
  inv_alternate_items_pk,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.MfgShare,
  wo_rscstr;

class function TFrmWO_Alloc_Substitute.DoShowModal(ATop_Workorder_BOM_ID: Real;
  var AWorkorder_BOM_ID: Real; ASubstituted_Arinvt_ID: Real = 0): Boolean;
var
  FrmWO_Alloc_Substitute: TFrmWO_Alloc_Substitute;
begin
  FrmWO_Alloc_Substitute := self.Create(uniGUIApplication.UniApplication);
  with FrmWO_Alloc_Substitute do
  begin
    try
      FTop_Workorder_BOM_ID := ATop_Workorder_BOM_ID;
      FSubstituted_Arinvt_ID := ASubstituted_Arinvt_ID;
      Result := ShowModal = mrOK;
      if Result then
        AWorkorder_BOM_ID := Workorder_Bom_ID;
    finally
      // Release;
    end;
  end;
end;

procedure TFrmWO_Alloc_Substitute.UniFormCreate(Sender: TObject);
begin

  // ProcessCheckBoxClick( chkUnknown );
  if IQMS.Common.MfgShare.IsMfgTypeSimilarToASSY1(FMfgtype_Lookup) then
  begin
    chkUnknown.Enabled := FALSE;
    ProcessCheckBoxClick(chkProcess);
  end
  else
    ProcessCheckBoxClick(chkUnknown);

  EnableComponents;
end;

procedure TFrmWO_Alloc_Substitute.UniFormShow(Sender: TObject);
var
  A: Variant;
begin
  A := SelectValueArrayFmt
    ('select arinvt_id, standard_id from workorder_bom where id = %f',
    [FTop_Workorder_BOM_ID]);
  // wo_rscstr.cTXT0000027 = 'Unable to find Work Order'#13#13'[WORKORDER_BOM_ID = %.0f]';
  IQAssert(VarArrayDimCount(A) > 0, Format(wo_rscstr.cTXT0000027,
    [FTop_Workorder_BOM_ID]));
  FParent_Arinvt_ID := A[0];
  FParent_Standard_ID := A[1];
  FMfgtype_Lookup := IQMS.Common.MfgShare.Lookup_MfgType
    (SelectValueByID('mfg_type', 'standard', FParent_Standard_ID));

  IQRegFormRead(self, [self]);
  IQSetTablesActive(TRUE, self);

end;

procedure TFrmWO_Alloc_Substitute.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmWO_Alloc_Substitute.QryProcessBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id', FParent_Arinvt_ID);
  AssignQueryParamValue(DataSet, 'standard_id', FParent_Standard_ID);
end;

procedure TFrmWO_Alloc_Substitute.wwDBComboDlgArinvtCustomDlg(Sender: TObject);
var
  AAlternate_Arinvt_ID: Real;
begin
  if sbtnAlternateItems.Enabled and sbtnAlternateItems.Down then
  begin
    if TFrmInvAlternateItemsPk.DoShowModal(FSubstituted_Arinvt_ID,
      AAlternate_Arinvt_ID) then { inv_alternate_items_pk.pas }
      AssignItem(SelectValueByID('arinvt_id', 'arinvt_alternate',
        AAlternate_Arinvt_ID));
    EXIT;
  end;

  with PkArinvt do
    if Execute then
      AssignItem(GetValue('ID'));
end;

procedure TFrmWO_Alloc_Substitute.AssignItem(AArinvt_ID: Real);
var
  A: Variant;
begin
  A := SelectValueArrayFmt
    ('select itemno, descrip, descrip2, class, rev, is_linked_to_serial ' +
    'from arinvt where id = %f', [AArinvt_ID]);
  // wo_rscstr.cTXT0000028 =
  // 'Unable to find Inventory Item.'#13#13'[ARINVT_ID = %f]';
  IQAssert(VarArrayDimCount(A) > 0, Format(wo_rscstr.cTXT0000028,
    [AArinvt_ID]));

  FArinvt_ID := AArinvt_ID;
  wwDBComboDlgArinvt.Text := A[0];
  edItemDescrip.Text := A[1];
  edItemExtDescrip.Text := A[2];
  edItemClass.Text := A[3];
  edItemRev.Text := A[4];
end;

procedure TFrmWO_Alloc_Substitute.ProcessCheckBoxClick(Sender: TObject);
begin
  chkUnknown.OnClick := nil;
  chkPrimary.OnClick := nil;
  chkProcess.OnClick := nil;
  try
    chkUnknown.Checked := Sender = chkUnknown;
    chkPrimary.Checked := Sender = chkPrimary;
    chkProcess.Checked := Sender = chkProcess;
  finally
    chkUnknown.OnClick := ProcessCheckBoxClick;
    chkPrimary.OnClick := ProcessCheckBoxClick;
    chkProcess.OnClick := ProcessCheckBoxClick;
  end;
  IQEnableControl(wwDBGridProcess, chkProcess.Checked);
end;

procedure TFrmWO_Alloc_Substitute.EnableComponents;
begin
  chkPrimary.Enabled := not IsLikeGeneric
    (SelectValueByID('mfg.lookup_mfgtype( mfg_type )', 'standard',
    FParent_Standard_ID));

  chkProcess.Enabled := SelectValueFmtAsFloat
    ('select 1 from partno, ptoper, sndop  ' +
    ' where partno.arinvt_id = %f         ' +
    '   and partno.standard_id = %f       ' +
    '   and partno.id = ptoper.partno_id  ' +
    '   and ptoper.sndop_id = sndop.id    ' +
    '   and rownum < 2                    ',
    [FParent_Arinvt_ID, FParent_Standard_ID]) = 1;

  sbtnAlternateItems.Enabled := FSubstituted_Arinvt_ID > 0;
end;

procedure TFrmWO_Alloc_Substitute.btnOKClick(Sender: TObject);
begin
  // validate
  // wo_rscstr.cTXT0000029 = 'Please select an Inventory item.';
  IQAssert(FArinvt_ID > 0, wo_rscstr.cTXT0000029);
  // wo_rscstr.cTXT0000030 = 'Circular reference detected.  Operation aborted.';
  IQAssert(SelectValueByID('arinvt_id', 'workorder_bom', FTop_Workorder_BOM_ID)
    <> FArinvt_ID, wo_rscstr.cTXT0000030);

  // execute
  AppendToWorkorder_BOM;

  ModalResult := mrOK;
end;

procedure TFrmWO_Alloc_Substitute.AppendToWorkorder_BOM;
begin
  Workorder_Bom_ID := GetNextID('workorder_bom');

  ExecuteCommandFmt('declare                                               ' +
    '  v_workorder_bom_id    number:= %f;                  ' +
    '  v_parent_id           number:= %f;                  ' +
    '  v_arinvt_id           number:= %f;                  ' +
    '  v_standard_id         number:= %f;                  ' +
    '  v_parent_arinvt_id    number:= %f;                  ' +
    '  v_parent_standard_id  number:= %f;                  ' +
    '  v_attribute           varchar2(20):= ''%s'';        ' +
    '  v_class               varchar2(2):= ''%s'';         ' +
    '  v_workorder_id        number:= %f;                  ' +
    '  v_ptoper_id           number:= %s;                  ' + // note %s
    '  v_sndop_id            number:= %s;                  ' + // same
    '  v_kind                varchar2(20):= ''%s'';        ' +
    'begin                                                 ' +
    '  wo_bom.insert_workorder_bom( v_workorder_bom_id,    ' +
    '                               v_parent_id,           ' +
    '                               v_arinvt_id,           ' +
    '                               v_standard_id,         ' +
    '                               v_parent_arinvt_id,    ' +
    '                               v_parent_standard_id,  ' +
    '                               null,                  ' + // v_opmat_id
    '                               0,                     ' + // v_ptsper,
    '                               v_kind,                ' + // v_kind
    '                               v_attribute,           ' +
    '                               0,                     ' + // v_scrap
    '                               1,                     ' +
    // v_ptsper_internal
    '                               v_class,               ' +
    '                               ''Y'',                 ' + // v_manual
    '                               v_sndop_id,            ' + // v_sndop_id
    '                               v_ptoper_id,           ' + // v_ptoper_id
    '                               null );                ' +
    // v_top_phantom_arinvt _id

    '  if v_attribute = ''PHANTOM'' then                   ' +
    '     wo_bom.add_opmat_of( v_workorder_bom_id,         ' + // v_parent_id
    '                          v_arinvt_id,                ' + // v_arinvt_id
    '                          v_standard_id,              ' + // v_standard_id
    '                          ''Y'',                      ' + // v_manual
    '                          v_arinvt_id );              ' +
    // v_top_phantom_arinvt _id
    '  end if;                                             ' +
    '                                                      ' +
    '  wo_bom.assign_quan_required( v_workorder_id );      ' +
    'end;                                                  ',
    [Workorder_Bom_ID, FTop_Workorder_BOM_ID, FArinvt_ID,
    DtoF(SelectValueByID('standard_id', 'arinvt', FArinvt_ID)),
    FParent_Arinvt_ID, FParent_Standard_ID, sIIf(SelectValueByID('phantom',
    'arinvt', FArinvt_ID) = 'Y', 'PHANTOM', ''), SelectValueByID('class',
    'arinvt', FArinvt_ID), DtoF(SelectValueByID('workorder_id', 'workorder_bom',
    FTop_Workorder_BOM_ID)), GetProcessFieldAsString('ptoper_id'),
    GetProcessFieldAsString('sndop_id'), sIIf(chkPrimary.Checked,
    'PRIMARY MATERIAL', 'COMPONENT')]);
end;

function TFrmWO_Alloc_Substitute.GetProcessFieldAsString
  (AFieldName: string): string;
begin
  if not chkProcess.Checked or (QryProcess.State = dsInactive) or
    (QryProcess.Eof and QryProcess.Bof) then
    Result := 'null'
  else
    Result := QryProcess.FieldByName(AFieldName).asString;
end;

end.
