unit plm_edit_item;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Db,
  plm_share,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  FireDAC.Comp.Client,
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
  uniGUIBaseClasses,
  uniGUIClasses,
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
  uniButton,
  uniLabel,
  uniComboBox,
  uniDBComboBox;

type
  TFrmEditPlmItem = class(TUniForm)
    Bevel1: TUniPanel;
    QryMfgTypeLookup: TFDQuery;
    QryMfgTypeLookupMFGTYPE: TStringField;
    QryMfgTypeLookupDESCRIP: TStringField;
    QryClassLookup: TFDQuery;
    QryClassLookupCLASS: TStringField;
    QryClassLookupDESCRIP: TStringField;
    QryClassLookupPRIMARY_MATERIAL: TStringField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label6: TUniLabel;
    Label5: TUniLabel;
    edItemNo: TUniEdit;
    edDescrip: TUniEdit;
    edRev: TUniEdit;
    wwDBLookupComboMfgType: TUniDBLookupComboBox;
    wwDBComboBoxKind: TUniDBComboBox;
    wwDBLookupComboClass: TUniDBLookupComboBox;
    CheckBoxPrimMat: TUniCheckBox;
    SrcClassLookup: TDataSource;
    SrcMfgTypeLookup: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure wwDBComboBoxKindChange(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FParent_ID: Real;
    procedure Validate;
    procedure LoadFrom( APLM_Param_Record: TPLM_Param_Record );
  public
    { Public declarations }
    class function DoShowModal( var APLM_Param_Record: TPLM_Param_Record; ACaption: string ): Boolean;
    procedure SaveIn( var APLM_Param_Record: TPLM_Param_Record );
    class procedure CheckCanParentHavePrimaryMaterial( AParent_ID: Real );
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.Proc,
  plm_rscstr;

{ TFrmEditPlmItem }

class function TFrmEditPlmItem.DoShowModal( var APLM_Param_Record: TPLM_Param_Record; ACaption: string ): Boolean;
begin
  with self.Create( uniGUIApplication.UniApplication ) do
  begin
    LoadFrom( APLM_Param_Record );
    Caption:= ACaption;

    Result:= ShowModal = mrOK;
    if Result then
       SaveIn( APLM_Param_Record );
  end;
end;

procedure TFrmEditPlmItem.wwDBComboBoxKindChange(Sender: TObject);
begin
  IQEnableControl( wwDBLookupComboMfgType, wwDBComboBoxKind.ItemIndex = plm_share.cPLM_KIND_RFQ );
end;

procedure TFrmEditPlmItem.LoadFrom( APLM_Param_Record: TPLM_Param_Record );
begin
  FParent_ID                   := APLM_Param_Record.Parent_ID;
  edItemNo.Text                := APLM_Param_Record.ItemNo;
  edDescrip.Text               := APLM_Param_Record.Descrip;
  edRev.Text                   := APLM_Param_Record.Rev;
  wwDBComboBoxKind.ItemIndex   := APLM_Param_Record.Kind;
  CheckBoxPrimMat.Checked      := APLM_Param_Record.Is_Prim_Mat = 'Y';
  wwDBLookupComboClass.Text    := APLM_Param_Record.FClass;
  { TODO -oathite -cWebConvert : property not available
  wwDBLookupComboClass.PerformSearch;                   }
end;

procedure TFrmEditPlmItem.SaveIn( var APLM_Param_Record: TPLM_Param_Record );
begin
  APLM_Param_Record.ItemNo     := edItemNo.Text;
  APLM_Param_Record.Descrip    := edDescrip.Text;
  APLM_Param_Record.Rev        := edRev.Text;
  APLM_Param_Record.Kind       := wwDBComboBoxKind.ItemIndex;
  APLM_Param_Record.FClass     := wwDBLookupComboClass.Text;
  APLM_Param_Record.Is_Prim_Mat:= IIf( CheckBoxPrimMat.Checked, 'Y', 'N' );
  if APLM_Param_Record.Kind = cPLM_KIND_SOURCED then
     APLM_Param_Record.MfgType:= ''
  else
     APLM_Param_Record.MfgType:= wwDBLookupComboMfgType.Text;
end;

procedure TFrmEditPlmItem.UniFormShow(Sender: TObject);
begin
  try
    CheckCanParentHavePrimaryMaterial( FParent_ID );
  except
    begin
      CheckBoxPrimMat.Checked:= FALSE;
      CheckBoxPrimMat.Enabled:= FALSE;
    end;
  end;
end;

procedure TFrmEditPlmItem.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmEditPlmItem.Validate;

{------------------------------------------------------------------------------}
  procedure CheckConfirmNewPrimaryMaterialClass( AClass: string );
  begin
    if SelectValueFmtAsString('select primary_material from arinvt_class where class = ''%s''', [ wwDBLookupComboClass.Text ]) = 'Y' then
       EXIT;

    {'Class %s cannot be primary material. Would you like to designate
      class %s as primary material?'}
    if not IQConfirmYN(Format(plm_rscstr.cTXT0000002, [ AClass, AClass ])) then
       ABORT;
    ExecuteCommandFmt('update arinvt_class set primary_material = ''Y'' where class = ''%s''', [ AClass ]);
  end;

{ MAIN ------------------------------------------------------------------------}
begin
  IQAssert( Trim(edItemNo.Text) > '',  plm_rscstr.cTXT0000001 {'Please enter an item number.'});
  IQAssert( Trim(edDescrip.Text) > '', plm_rscstr.cTXT0000003 {'Please enter a description.'});
  IQAssert( Trim(wwDBLookupComboClass.Text) > '', plm_rscstr.cTXT0000004 {'Please select a class.'});

  if wwDBComboBoxKind.ItemIndex = plm_share.cPLM_KIND_RFQ then
     IQAssert( wwDBLookupComboMfgType.Text > '', plm_rscstr.cTXT0000005 {'Please select a manufacturing type.'});

  if CheckBoxPrimMat.Checked then
  begin
     {can parent have primary material}
     CheckCanParentHavePrimaryMaterial( FParent_ID );

     {can this class be primary material}
     CheckConfirmNewPrimaryMaterialClass( wwDBLookupComboClass.Text );
  end;
end;

class procedure TFrmEditPlmItem.CheckCanParentHavePrimaryMaterial( AParent_ID: Real );
var
  S: string;
begin
  {not a top item}
  // 'Primary material cannot be the top level item'
  IQAssert( AParent_ID > 0, plm_rscstr.cTXT0000006);

  {not generic}
  IQAssert( not LikeGeneric( SelectValueFmtAsString('select mfgtype from plm_item where id = %f', [ AParent_ID ])),  {IQMS.Common.Proc.pas}
            plm_rscstr.cTXT0000007 {'Parent item does require primary material'});

  {only 1 primary material per parent. Note: if we need to EDIT item in the future we will need to EXCLUDE current plm_item.id}
  S:= SelectValueFmtAsString('select itemno from plm_item where parent_id = %f and is_prim_mat = ''Y''', [ AParent_ID ]);
  // 'Parent item already assigned primary material, %s'
  IQAssert( S = '', Format(plm_rscstr.cTXT0000008, [ S ]));
end;

end.
