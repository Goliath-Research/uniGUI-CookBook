unit mat_xcpt_alternate_wo_alloc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
//  vcl.Wwdatainspector,
  Data.DB,
//  vcl.wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TFrmMatXcptAlternateWorkorderAlloc = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtID: TBCDField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtCLASS: TStringField;
    Splitter1: TUniSplitter;
    wwDBGrid1: TIQUniGridControl;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    DBNavigator1: TUniDBNavigator;
    SrcWO: TDataSource;
    QryWO: TFDQuery;
    QryWOWORKORDER_ID: TBCDField;
    QryWOTOT_MAT_QTY: TFMTBCDField;
    QryWOHARD_ALLOC_QTY: TFMTBCDField;
    QryWOORIGIN: TStringField;
    QryWOMFGNO: TStringField;
    QryWOSTANDARD_ID: TBCDField;
    QryWOCODE: TStringField;
    QryWOAlternateComponentItemNo: TStringField;
    QryWOAlternateBlendItemno: TStringField;
    wwDBComboDlgAlternateComponent: TUniEdit;
    wwDBComboDlgAlternateBlend: TUniEdit;
    QryWOALTERNATE_ITEM_CODE_ID: TBCDField;
    QryWOBlend_Sndop_ID: TFloatField;
    QryWOARINVT_ID_MAT: TBCDField;
    QryWOBelongsToBlend: TStringField;
    QryWOCOMPONENT_ARINVT_ALTERNATE_ID: TFMTBCDField;
    QryWOBLEND_ARINVT_ALTERNATE_ID: TFMTBCDField;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure QryWOBeforeOpen(DataSet: TDataSet);
    procedure QryWOCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgAlternateComponentKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure wwDBComboDlgAlternateBlendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgAlternateComponentCustomDlg(Sender: TObject);
    procedure QryWOAfterPost(DataSet: TDataSet);
    procedure QryWOUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure wwDBComboDlgAlternateBlendCustomDlg(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID          : Real;
    FFirstMustArriveDate: TDateTime;
    FDivision_ID        : Real;
    FCost_Object_ID     : Real;
    FCost_Object_Source : string;
//
    procedure Process;
    procedure Validate;
    function ReplaceWorkorderBomItemtWithAlternate(AWorkorder_ID,  AArinvtAlternate_ID: Real; AKind: string): Boolean;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetCost_Object_ID(const Value: Real);
    procedure SetCost_Object_Source(const Value: string);
    procedure SetDivision_ID(const Value: Real);
  public
    { Public declarations }
    class function DoShowModal(AArinvt_ID, ADivision_ID, ACost_Object_ID: Real; ACost_Object_Source: string): Boolean;
    class procedure DoReplaceWorkorderBomItemtWithAlternate(AWorkorder_ID, AArinvtAlternate_ID: Real; AKind: string; AFirstMustArriveDate: TDateTime);
    property Arinvt_ID: Real write SetArinvt_ID;
    property Division_ID: Real write SetDivision_ID;
    property Cost_Object_ID: Real write SetCost_Object_ID;
    property Cost_Object_Source: string write SetCost_Object_Source;

  end;

implementation

{$R *.dfm}

uses
  capacity_rscstr,
  { TODO -oathite -cWebConvert : unit not converted 'inv_alternate_items_pk.pas'
  inv_alternate_items_pk, }
  { TODO -oathite -cWebConvert : unit not converted IQErrDlg
  IQErrDlg,}
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  wo_misc;

class function TFrmMatXcptAlternateWorkorderAlloc.DoShowModal(AArinvt_ID, ADivision_ID, ACost_Object_ID: Real; ACost_Object_Source: string): Boolean;
var
  LFrmMatXcptAlternateWorkorderAlloc : TFrmMatXcptAlternateWorkorderAlloc;
begin
  LFrmMatXcptAlternateWorkorderAlloc := TFrmMatXcptAlternateWorkorderAlloc.Create( uniGUIApplication.UniApplication );

  LFrmMatXcptAlternateWorkorderAlloc.Arinvt_ID          := AArinvt_ID;
  LFrmMatXcptAlternateWorkorderAlloc.Division_ID        := ADivision_ID;
  LFrmMatXcptAlternateWorkorderAlloc.Cost_Object_ID     := ACost_Object_ID;
  LFrmMatXcptAlternateWorkorderAlloc.Cost_Object_Source := ACost_Object_Source;

  Result:= LFrmMatXcptAlternateWorkorderAlloc.ShowModal = mrOK;
end;


procedure TFrmMatXcptAlternateWorkorderAlloc.btnOKClick(Sender: TObject);
begin
  if not IQConfirmYN( capacity_rscstr.cTXT0000009 {'Proceed with alternate item(s) replacement?'}) then
     EXIT;
  Validate;
  Process;
  ModalResult:= mrOK;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.Exit1Click(Sender: TObject);
begin
  Close;
end;


procedure TFrmMatXcptAlternateWorkorderAlloc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.About1Click(Sender: TObject);
begin
//  IQAbout1.Execute;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.Validate;
begin

end;

procedure TFrmMatXcptAlternateWorkorderAlloc.wwDBComboDlgAlternateBlendKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryWO.Edit;
    QryWO.FieldByName('blend_arinvt_alternate_id').Clear;
    (Sender as TUniEdit).Text:= '';
    Key:= 0;
  end;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.wwDBComboDlgAlternateComponentKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryWO.Edit;
    QryWO.FieldByName('component_arinvt_alternate_id').Clear;
    (Sender as TUniEdit).Text:= '';
    Key:= 0;
  end;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.wwDBGrid1CalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
  AFont: TFont; ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.ReadOnly then
     ABrush.Color:= clBtnFace
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.QryArinvtBeforeOpen(
  DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('arinvt_id').asFloat:= FArinvt_ID
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.QryWOAfterPost(DataSet: TDataSet);
begin
  {since we don't really update any table on the backend just clear the buffer}
  TFDQuery(DataSet).CommitUpdates;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.QryWOBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('arinvt_id').asFloat          := FArinvt_ID;
  //   ParamByName('division_id').asFloat        := FDivision_ID;
  //   ParamByName('cost_object_id').asFloat     := FCost_Object_ID;
  //   ParamByName('cost_object_source').asString:= FCost_Object_Source;
  //   ParamByName('must_arrive').asDateTime     := FFirstMustArriveDate;
  // end;
  AssignQueryParamValue(DataSet, 'arinvt_id',         FArinvt_ID);
  AssignQueryParamValue(DataSet, 'division_id',       FDivision_ID);
  AssignQueryParamValue(DataSet, 'cost_object_id',    FCost_Object_ID);
  AssignQueryParamValue(DataSet, 'cost_object_source',FCost_Object_Source);
  AssignQueryParamValue(DataSet, 'must_arrive',       FFirstMustArriveDate);
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.QryWOCalcFields(DataSet: TDataSet);

  function _get_alternate_itemno( AAlternateItem_ID: Real ): string;
  begin
    Result:= SelectValueFmtAsString('select a.itemno from arinvt_alternate alt, arinvt a where alt.id = %f and alt.arinvt_id = a.id', [ AAlternateItem_ID ]);
  end;

begin
  if QryWoCOMPONENT_ARINVT_ALTERNATE_ID.asFloat > 0 then
     QryWOAlternateComponentItemNo.asString:= _get_alternate_itemno( QryWOCOMPONENT_ARINVT_ALTERNATE_ID.asFloat );

  if QryWoBLEND_ARINVT_ALTERNATE_ID.asFloat > 0 then
     QryWOAlternateBlendItemno.asString:= _get_alternate_itemno( QryWOBLEND_ARINVT_ALTERNATE_ID.asFloat );

  // part of a blend?
  if QryWoARINVT_ID_MAT.asFloat > 0 then
  begin
    QryWOBlend_Sndop_ID.asFloat:= SelectValueFmtAsFloat('select id from sndop where arinvt_id = %f', [ QryWOARINVT_ID_MAT.asFloat ]);
    if (QryWOBlend_Sndop_ID.asFloat > 0)
       and
       (SelectValueFmtAsFloat('select 1 from opmat where sndop_id = %f and arinvt_id = %f', [ QryWOBlend_Sndop_ID.asFloat, FArinvt_ID ]) = 1) then
    begin
      QryWOBelongsToBlend.asString:= 'Y';
    end;
  end;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.QryWOUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  AAction := eaApplied;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.wwDBComboDlgAlternateComponentCustomDlg(Sender: TObject);
var
  AArinvt_Alternate_ID: Real;
begin
  { TODO -oathite -cWebConvert : unit not converted 'inv_alternate_items_pk.pas'
  if TFrmInvAlternateItemsPk.DoShowModal( self, FArinvt_ID, AArinvt_Alternate_ID, QryWOALTERNATE_ITEM_CODE_ID.asFloat ) then
  begin
    QryWO.Edit;
    QryWO.FieldByName('component_arinvt_alternate_id').asFloat:= AArinvt_Alternate_ID;
    QryWO.FieldByName('blend_arinvt_alternate_id').Clear;
    QryWO.Post;
  end; }
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.wwDBComboDlgAlternateBlendCustomDlg(Sender: TObject);
var
  AArinvt_Alternate_ID: Real;
begin
  IQAssert( QryWOBelongsToBlend.asString = 'Y',
            Format('Item %s does not belong to a blend for work order # %.0f', [ QryArinvtITEMNO.asString, QryWOWORKORDER_ID.asFloat ]));

  { TODO -oathite -cWebConvert : unit not converted 'inv_alternate_items_pk.pas'
  if TFrmInvAlternateItemsPk.DoShowModal( self, QryWOARINVT_ID_MAT.asFloat, AArinvt_Alternate_ID, QryWOALTERNATE_ITEM_CODE_ID.asFloat ) then
  begin
    QryWO.Edit;
    QryWO.FieldByName('blend_arinvt_alternate_id').asFloat:= AArinvt_Alternate_ID;
    QryWO.FieldByName('component_arinvt_alternate_id').Clear;
    QryWO.Post;
  end;   }
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.Process;
var
  ASuccess: Boolean;
begin
  ASuccess:= True;
  with QryWO do while not Eof do
  begin
    if QryWoCOMPONENT_ARINVT_ALTERNATE_ID.asFloat > 0 then
       ASuccess:= ReplaceWorkorderBomItemtWithAlternate( QryWoWorkorder_ID.asFloat, QryWoCOMPONENT_ARINVT_ALTERNATE_ID.asFloat, 'COMPONENT' )

    else if QryWoBLEND_ARINVT_ALTERNATE_ID.asFloat > 0 then
       ASuccess:= ReplaceWorkorderBomItemtWithAlternate( QryWoWorkorder_ID.asFloat, QryWoBLEND_ARINVT_ALTERNATE_ID.asFloat, 'PRIMARY MATERIAL' );

    if not ASuccess then
       BREAK;

    Next;
  end;
end;

function TFrmMatXcptAlternateWorkorderAlloc.ReplaceWorkorderBomItemtWithAlternate(AWorkorder_ID,  AArinvtAlternate_ID: Real; AKind: string ): Boolean;
begin
  // check - firm and populate workorder_bom
  Result:= True;
  try
    DoReplaceWorkorderBomItemtWithAlternate( AWorkorder_ID,  AArinvtAlternate_ID, AKind, FFirstMustArriveDate );
  except on E: Exception do
    {'Encountered error while processing the request - please confirm to continue.'}
    { TODO -oathite -cWebConvert : unit not converted IQErrDlg
    Result:= ShowIQErrorMessageB( capacity_rscstr.cTXT0000010, E.Message, ''); // iqerrdlg.pas   }
  end;
end;


procedure TFrmMatXcptAlternateWorkorderAlloc.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.SetCost_Object_ID(
  const Value: Real);
begin
  FCost_Object_ID := Value;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.SetCost_Object_Source(
  const Value: string);
begin
  FCost_Object_Source := Value;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.SetDivision_ID(const Value: Real);
begin
  FDivision_ID := Value;
end;

procedure TFrmMatXcptAlternateWorkorderAlloc.UniFormShow(Sender: TObject);
begin
  FFirstMustArriveDate:= SelectValueFmtAsFloat('select min(x.must_arrive ) from xcpt_mat_req x where x.arinvt_id = %f                       '+
                                   '   and mat_po_xcpt.filter_cost_object( ''%s'', %f, cost_object_source, cost_object_id ) = 1 '+
                                   '   and NVL(division_id,0) = NVL(%f,0)',
                                   [ DtoF(SelectValueByID( 'parent_arinvt_id', 'arinvt_alternate', FArinvt_ID)),
                                     FCost_Object_Source,
                                     FCost_Object_ID,
                                     FDivision_ID ]);

  IQSetTablesActive( TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

class procedure TFrmMatXcptAlternateWorkorderAlloc.DoReplaceWorkorderBomItemtWithAlternate( AWorkorder_ID,  AArinvtAlternate_ID: Real; AKind: string; AFirstMustArriveDate: TDateTime );
begin
  wo_misc.EnsureExistsWorkorder_BOM( AWorkorder_ID );

  ExecuteCommandFmt('declare                                                                           '+
            '  v_workorder_id        number::= %f;                                             '+
            '  v_arinvt_alternate_id number::= %f;                                             '+
            '  v_kind                varchar2(20)::= ''%s'';                                   '+
            'begin                                                                             '+
            '   wo_bom.replace_with_alternate( v_workorder_id, v_arinvt_alternate_id, v_kind); '+
            'end;                                                                              ',
            [ AWorkorder_ID,
              AArinvtAlternate_ID,
              AKind ]);

  wo_misc.UpdateDayUseAlternateItem( AWorkorder_ID,
                                     AArinvtAlternate_ID,
                                     AFirstMustArriveDate );

end;

end.
