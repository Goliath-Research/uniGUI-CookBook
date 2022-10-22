unit wo_assign_rework_loc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
//  Mask,
  Vcl.DBCtrls, //TNavigateBtn
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmAssignReworkNonConformLoc = class(TUniForm)
    Panel9: TUniPanel;
    GridRework: TIQUniGridControl;
    wwDBComboDlgReworkNonConformingLoc: TUniEdit;
    SrcRework: TDataSource;
    QryRework: TFDQuery;
    QryReworkLoc_Desc: TStringField;
    QryReworkLotNo: TStringField;
    QryReworkOnHand: TFloatField;
    QryReworkID: TBCDField;
    QryReworkFGMULTI_ID: TBCDField;
    QryReworkPTORDER_ID: TBCDField;
    UpdateSQLRework: TFDUpdateSQL;
    PkFgMultiNonConform: TIQWebHPick;
    FloatField2: TBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField3: TBCDField;
    FloatField8: TBCDField;
    StringField4: TStringField;
    FloatField9: TBCDField;
    FloatField10: TBCDField;
    DateTimeField1: TDateTimeField;
    procedure wwDBComboDlgReworkNonConformingLocCustomDlg(Sender: TObject);
    procedure ApplyUpdateToTable(DataSet: TDataSet);
    procedure QryReworkBeforePost(DataSet: TDataSet);
    procedure QryReworkCalcFields(DataSet: TDataSet);
    procedure QryReworkNewRecord(DataSet: TDataSet);
    procedure QryReworkBeforeOpen(DataSet: TDataSet);
    procedure PkFgMultiNonConformBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FPTOrder_ID: Real;
    FWorkorder_ID: Real;
    FArinvt_ID: Real;
    procedure SetPTOrder_ID(const Value: Real);
  public
    { Public declarations }
    property PTOrder_ID: Real write FPTOrder_ID;
    class procedure DoShowModal(APtorder_ID: Real);
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  wo_rscstr;


class procedure TFrmAssignReworkNonConformLoc.DoShowModal(APtorder_ID: Real);
var
  frm: TFrmAssignReworkNonConformLoc;
begin
  frm := TFrmAssignReworkNonConformLoc.Create(uniGUIApplication.UniApplication);
  frm.FPTOrder_ID  := APtorder_ID;
  frm.FWorkorder_ID:= SelectValueByID('workorder_id', 'ptorder', APtorder_ID);
  frm.FArinvt_ID   := SelectValueFmtAsFloat('select b.arinvt_id from ptorder a, partno b where a.id = %f and a.partno_id = b.id', [ APtorder_ID ]);
  frm.ShowModal;
end;

procedure TFrmAssignReworkNonConformLoc.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self, GridRework ]);
  IQSetTablesActive(TRUE, self);
  wwDBComboDlgReworkNonConformingLoc.Visible := False;
end;

procedure TFrmAssignReworkNonConformLoc.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, GridRework ]);
end;

procedure TFrmAssignReworkNonConformLoc.wwDBComboDlgReworkNonConformingLocCustomDlg(Sender: TObject);
begin
  with PkFgMultiNonConform do
    if Execute then
    begin
      QryRework.Append;
      QryReworkFGMULTI_ID.asFloat:= GetValue('fgmulti_id');
    end
end;

procedure TFrmAssignReworkNonConformLoc.ApplyUpdateToTable(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmAssignReworkNonConformLoc.QryReworkBeforePost( DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'rework_ptorder_fgmulti'); {in IQlib}
end;

procedure TFrmAssignReworkNonConformLoc.QryReworkCalcFields( DataSet: TDataSet);
var
  A: Variant;
begin
  if QryReworkFGMULTI_ID.asFloat = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select loc_desc, lotno, onhand from v_fgmulti_locations where id = %f', [ QryReworkFGMULTI_ID.asFloat ]);
  if VarArrayDimCount( A ) = 0 then
  begin
    // wo_rscstr.cTXT0000031 = '(%.0f-N/A)';
    QryReworkLoc_Desc.asString:= Format(wo_rscstr.cTXT0000031, [ QryReworkFGMULTI_ID.asFloat ]);
    EXIT;
  end;

  QryReworkLoc_Desc.asString:= A[ 0 ];
  QryReworkLotNo.asString   := A[ 1 ];
  QryReworkOnHand.asFloat   := A[ 2 ];
end;

procedure TFrmAssignReworkNonConformLoc.QryReworkNewRecord(DataSet: TDataSet);
begin
  QryReworkPTORDER_ID.asFloat:= FPTOrder_ID;
end;

procedure TFrmAssignReworkNonConformLoc.SetPTOrder_ID(const Value: Real);
begin
  FPTOrder_ID := Value;
end;

procedure TFrmAssignReworkNonConformLoc.QryReworkBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ptorder_id', FPTOrder_ID);
end;

procedure TFrmAssignReworkNonConformLoc.PkFgMultiNonConformBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

procedure TFrmAssignReworkNonConformLoc.CheckRefresh(Sender: TObject;  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

end.
