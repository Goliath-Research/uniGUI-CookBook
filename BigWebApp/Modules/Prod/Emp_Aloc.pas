unit Emp_Aloc;

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
  IQMS.WebVcl.Search,
  ComCtrls,
  Db,
  Wwdatsrc,
  Buttons,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniBasicGrid,
  uniStringGrid,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame;

type
  TEmpAllocLaborCargo = class
    SndOP_ID: Real;
    constructor Create( ASndOp_ID: Real );
  end;

  TFrmEmpAllocLabor = class(TUniForm)
    wwSrcSndOp: TDataSource;
    wwQrySndOpAll: TFDQuery;
    wwQrySndOpAllOPNO: TStringField;
    wwQrySndOpAllDESCRIP: TStringField;
    wwQrySndOpAllSNDOP_ID: TBCDField;
    wwSrcEmp: TDataSource;
    wwQryEmp: TFDQuery;
    wwQryEmpID: TBCDField;
    wwQryEmpEMPNO: TStringField;
    wwQryEmpFIRST_NAME: TStringField;
    wwQryEmpLAST_NAME: TStringField;
    wwQryEmpSNDOP_ID: TBCDField;
    procAppend_Free_Form: TFDStoredProc;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    Panel4: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Panel6: TUniPanel;
    sbtnRight: TUniSpeedButton;
    sbtnLeft: TUniSpeedButton;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    grdSelSndOp: TUniStringGrid;
    wwSrcCost_ALloc_Dtl: TDataSource;
    wwTblCost_ALloc_Dtl: TFDTable;
    wwSrcCost_Alloc: TDataSource;
    wwTblCost_Alloc: TFDTable;
    wwTblCost_AllocID: TBCDField;
    wwTblCost_AllocARINVT_ID: TBCDField;
    wwTblCost_AllocSTANDARD_ID: TBCDField;
    wwTblCost_AllocMFGNO: TStringField;
    wwTblCost_AllocCLASS: TStringField;
    wwTblCost_AllocITEMNO: TStringField;
    wwTblCost_AllocREV: TStringField;
    wwTblCost_AllocDESCRIP: TStringField;
    wwTblCost_ALloc_DtlID: TBCDField;
    wwTblCost_ALloc_DtlCOST_ALLOC_ID: TBCDField;
    wwTblCost_ALloc_DtlOPNO: TStringField;
    wwTblCost_ALloc_DtlDESCRIP: TStringField;
    wwTblCost_ALloc_DtlSEQ: TBCDField;
    wwTblCost_ALloc_DtlELEMENTS_ID: TBCDField;
    wwTblCost_ALloc_DtlPROD_DATE: TDateTimeField;
    wwTblCost_ALloc_DtlSTD_HRS_PART: TFMTBCDField;
    wwTblCost_ALloc_DtlSTD_RATE: TFMTBCDField;
    wwTblCost_ALloc_DtlACT_QTY: TFMTBCDField;
    wwTblCost_ALloc_DtlACT_HRS: TFMTBCDField;
    wwTblCost_ALloc_DtlPR_EMP_ID: TBCDField;
    wwTblCost_ALloc_DtlEMPNO: TStringField;
    wwTblCost_ALloc_DtlFIRST_NAME: TStringField;
    wwTblCost_ALloc_DtlLAST_NAME: TStringField;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Panel8: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    StatusBar1: TUniStatusBar;
    Panel3: TUniPanel;
    Label9: TUniLabel;
    Panel9: TUniPanel;
    Label10: TUniLabel;
    PnlLeft02: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft03: TUniPanel;
    PnlClient02: TUniPanel;
    PnlClient03: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft04: TUniPanel;
    PnlClient04: TUniPanel;
    Label4: TUniLabel;
    Label8: TUniLabel;
    DBEdit3: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    Label5: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    DBEdit4: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    Splitter4: TUniSplitter;
    Panel16: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Panel17: TUniPanel;
    Splitter5: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
    Label1: TUniLabel;
    wwComboEmp: TUniDBLookupComboBox;
    cboxAssignDefault: TUniCheckBox;
    wwTblCost_AllocDescrip2: TStringField;
    DBEdit6: TUniDBEdit;
    Label6: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwComboEmpCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnRightClick(Sender: TObject);
    procedure sbtnLeftClick(Sender: TObject);
    procedure IQSearch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdSelSndOpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IQSearch1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grdSelSndOpDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure grdSelSndOpDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure IQSearch1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure IQSearch1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnOKClick(Sender: TObject);
    procedure grdSelSndOpDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grdSelSndOpSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure grdSelSndOpEnter(Sender: TObject);
    procedure wwTblCost_ALloc_DtlBeforeInsert(DataSet: TDataSet);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwTblCost_AllocBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure wwTblCost_AllocCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AssignGridCaption;
    procedure ClearSelSndOp;
    procedure AddSelSndOp( ASndOp_ID: Real; AHrs: Real = 0; AQty: Real = 0);
    procedure DeleteSelSndOp;
    procedure Validate;
    procedure Append_Labor_To_Cost_Alloc( ASndOp_ID, AHrs, AQty: Real );
    procedure SetDay_Part_ID(const Value: Real);
  public
    { Public declarations }
    FDay_Part_ID: Real;
    FArinvt_ID  : Real;
    FStandard_ID: Real;
    FProdDate   : TDateTime;
    FProdHrs    : Real;
    FGoodPts    : Real;
    procedure AssignItemInfoFromProd( ADay_Part_ID: Real ); virtual;
    property Day_Part_ID: Real write SetDay_Part_ID;
  end;

procedure DoEmployeeLaborAllocation( ADay_Part_ID: Real );



implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  prod_rscstr,
  variants;


procedure DoEmployeeLaborAllocation( ADay_Part_ID: Real );
var
  FrmEmpAllocLabor: TFrmEmpAllocLabor;
begin
  FrmEmpAllocLabor := TFrmEmpAllocLabor.Create( uniGUIApplication.uniApplication );
  FrmEmpAllocLabor.Day_Part_ID := ADay_Part_ID;
  FrmEmpAllocLabor.ShowModal;
end;


{ TEmpAllocLaborCargo }

constructor TEmpAllocLaborCargo.Create( ASndOp_ID: Real );
begin
  inherited Create;
  SndOp_ID:= ASndOp_ID;
end;

{ TFrmEmpAllocLabor }

procedure TFrmEmpAllocLabor.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self, wwDBGrid1, cboxAssignDefault,
   PnlLeft01, PnlLeft02, PnlLeft03, PnlLeft04]);
  PageControl1.ActivePage:= TabSheet1;

  // ensure the check box caption is visible
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlClient01);

  AssignGridCaption;
  
end;

procedure TFrmEmpAllocLabor.UniFormShow(Sender: TObject);
begin
  AssignItemInfoFromProd( FDay_Part_ID );
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmEmpAllocLabor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClearSelSndOp;
  IQRegFormWrite(self, [self, wwDBGrid1, cboxAssignDefault,
   PnlLeft01, PnlLeft02, PnlLeft03, PnlLeft04]);
end;

procedure TFrmEmpAllocLabor.AssignGridCaption;
begin
  with grdSelSndOp do
  begin
    Cells[ 0, 0 ]:= 'Oper #';
    Cells[ 1, 0 ]:= 'Description';
    Cells[ 2, 0 ]:= 'Act Hours';
    Cells[ 3, 0 ]:= 'Act Qty';
  end;
end;

procedure TFrmEmpAllocLabor.AssignItemInfoFromProd( ADay_Part_ID: Real );
var
  A: Variant;
begin
  FDay_Part_ID:= ADay_Part_ID;
  FArinvt_ID  := 0;
  FStandard_ID:= 0;
  FProdDate   := 0;

  A:= SelectValueArrayFmt( 'select d.prod_date,                '+
                      '       h.standard_id,              '+
                      '       n.arinvt_id,                '+
                      '       t.itemno,                   '+
                      '       t.rev,                      '+
                      '       h.mfgno,                    '+
                      '       d.prod_hrs,                 '+
                      '       p.good_pts                  '+
                      '  from dayprod d,                  '+
                      '       day_part p,                 '+
                      '       hist_illum_rt h,            '+
                      '       hist_illum_part t,          '+
                      '       partno n                    '+
                      ' where p.id = %f                   '+   // position day_part
                      '   and p.dayprod_id = d.id         '+   // link dayprod to get prod_date and illum_rt_id
                      '   and h.id = d.hist_illum_rt_id   '+   // link hist_illum_rt for standard_id
                      '   and p.hist_illum_part_id = t.id '+   // link hist_illum_part for partno_id
                      '   and n.id = t.partno_id          ',   // link partno to get arinvt_id
                      [ FDay_Part_ID ]);

  if VarArrayDimCount( A ) > 0 then
  begin
    FProdDate   := A[ 0 ];
    FStandard_ID:= A[ 1 ];
    FArinvt_ID  := A[ 2 ];
    FProdHrs    := A[ 6 ];
    FGoodPts    := A[ 7 ];

    StatusBar1.Panels[ 0 ].Text := Format(prod_rscstr.cTXT0000020 {'Manufacturing # %s'}, [A[5]]);
    StatusBar1.Panels[ 1 ].Text := Format(prod_rscstr.cTXT0000021 {'Production Date %s'}, [DateToStr( FProdDate )]);
    StatusBar1.Panels[ 2 ].Text := Format(prod_rscstr.cTXT0000022 {'Item # %s'}         , [Trim(A[ 3 ]) + sIIf( Trim(A[ 4 ]) = '', '', ' / '+ A[ 4 ])]);
    StatusBar1.Update;
  end;

end;

procedure TFrmEmpAllocLabor.wwComboEmpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
  ID: Real;
begin
  if cboxAssignDefault.Checked then
  begin
     ClearSelSndOp;
     ID:= LookupTable.FieldByName('sndop_id').asFloat;
     if ID > 0 then
     begin
       wwQrySndOpAll.Locate('sndop_id', ID, []);
       AddSelSndOp( ID, FProdHrs, FGoodPts );
     end;
  end;
end;

procedure TFrmEmpAllocLabor.ClearSelSndOp;
var
  I: Integer;
begin
  with grdSelSndOp do
  begin
    { TODO -oSanketG -cWebConvert : Need to find alternative event for Objects, Rows in TUniStringGrid,
    [dcc32 Error] Emp_Aloc.pas(356): E2003 Undeclared identifier: 'Objects' }
    {for I:= 1 to RowCount - 1 do
    begin
      if Assigned( Objects[ 0, I ]) then
         Objects[ 0, I ].Free;
      Rows[ I ].Clear;
    end;}
    RowCount:= 2;
  end;
end;

procedure TFrmEmpAllocLabor.AddSelSndOp( ASndOp_ID: Real; AHrs: Real = 0; AQty: Real = 0);
var
  A: Variant;
  I: Integer;
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative event for Objects in TUniStringGrid,
  [dcc32 Error] Emp_Aloc.pas(373): E2003 Undeclared identifier: 'Objects'
  {with grdSelSndOp do
    for I:= 1 to RowCount - 1 do
      if Assigned( Objects[ 0, I ]) and
         ( TEmpAllocLaborCargo( Objects[ 0, I ]).SndOp_ID = ASndOp_ID ) then
        EXIT;}

  A:= SelectValueArrayFmt( 'select opno, opdesc from sndop where id = %f', [ ASndOp_ID ]);
  if VarArrayDimCount( A ) > 0 then
     with grdSelSndOp do
     begin
       Cells  [ 0, RowCount - 1 ]:= A[ 0 ];
       Cells  [ 1, RowCount - 1 ]:= A[ 1 ];
       Cells  [ 2, RowCount - 1 ]:= FloatToStr( AHrs );
       Cells  [ 3, RowCount - 1 ]:= FloatToStr( AQty );

       { TODO -oSanketG -cWebConvert : Need to find alternative event for Objects in TUniStringGrid,
        [dcc32 Error] Emp_Aloc.pas(388): E2003 Undeclared identifier: 'Objects'}
       //Objects[ 0, RowCount - 1 ]:= TEmpAllocLaborCargo.Create( ASndOp_ID );

       RowCount:= RowCount + 1;
     end;
end;

procedure TFrmEmpAllocLabor.sbtnRightClick(Sender: TObject);
begin
  AddSelSndOp( wwQrySndOpAllSNDOP_ID.asFloat );
end;

procedure TFrmEmpAllocLabor.SetDay_Part_ID(const Value: Real);
begin
  FDay_Part_ID := Value;
end;

procedure TFrmEmpAllocLabor.sbtnLeftClick(Sender: TObject);
begin
  DeleteSelSndOp;
end;

procedure TFrmEmpAllocLabor.DeleteSelSndOp;
var
  I: Integer;
begin
  with grdSelSndOp do
    if Trim(Cells[0, Row]) <> '' then
    begin
      { TODO -oSanketG -cWebConvert : Need to find alternative event for Objects, Rows in TUniStringGrid ,
      [dcc32 Error] Emp_Aloc.pas(419): E2003 Undeclared identifier: 'Objects'}
      {for I:= Row to RowCount - 2 do
        Rows[ I ]:= Rows[ I + 1 ];

      if Assigned( Objects[0, RowCount - 2 ]) then
         Objects[ 0, RowCount - 2 ].Free;}

      RowCount:= RowCount - 1;
    end;
end;

procedure TFrmEmpAllocLabor.IQSearch1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    sbtnRightClick( NIL );
    Key:= 0;
  end;
end;

procedure TFrmEmpAllocLabor.grdSelSndOpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
     begin
       sbtnLeftClick( NIL );
       Key:= 0;
     end
  else if Key = VK_RETURN then
     with Sender as TUniStringGrid do
       if Col < ColCount - 1 then
       begin
          Col:= Col + 1;
          Key:= 0;
       end
end;

procedure TFrmEmpAllocLabor.IQSearch1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft  then
     TControl(Sender).BeginDrag(FALSE, 10);
end;

procedure TFrmEmpAllocLabor.grdSelSndOpDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl}
  //Accept:= Source = IQSearch1.wwDBGrid;
end;

procedure TFrmEmpAllocLabor.grdSelSndOpDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  sbtnRightClick( NIL );
end;

procedure TFrmEmpAllocLabor.IQSearch1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= Source = grdSelSndOp;
end;

procedure TFrmEmpAllocLabor.IQSearch1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  sbtnLeftClick( NIL );
end;

procedure TFrmEmpAllocLabor.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  Validate;
  { TODO -oSanketG -cWebConvert : Need to find alternative event for Objects in TUniStringGrid,
  [dcc32 Error] Emp_Aloc.pas(494): E2003 Undeclared identifier: 'Objects' }
  (*for I:= 1 to grdSelSndOp.RowCount - 2 do with grdSelSndOp do
    if Assigned( Objects[ 0, I ]) then
       Append_Labor_To_Cost_Alloc( TEmpAllocLaborCargo( Objects[ 0, I ]).SndOp_ID, {sndop_id}
                                   StrToFloat( Cells[ 2, I ]),                     {hrs}
                                   StrToFloat( Cells[ 3, I ]));                    {qty} *)
  ClearSelSndOp;
  wwTblCost_Alloc.Refresh;
  wwTblCost_ALloc_Dtl.Refresh;
end;

procedure TFrmEmpAllocLabor.Validate;
begin
  IQAssert( wwComboEmp.Text > '', prod_rscstr.cTXT0000023 {'Employee must be selected'});
  IQAssert( FArinvt_ID > 0, prod_rscstr.cTXT0000024 {'Inventory item not found'} );
  IQAssert( grdSelSndOp.RowCount > 2, prod_rscstr.cTXT0000025 {'No operation selected'} );
  IQAssert( FStandard_ID > 0, prod_rscstr.cTXT0000026 {'Manufacturing # not found'} );
end;


procedure TFrmEmpAllocLabor.Append_Labor_To_Cost_Alloc( ASndOp_ID, AHrs, AQty: Real );
begin
  with procAppend_Free_Form do
  begin
    ParamByName('v_arinvt_id'     ).AsFMTBCD:= FArinvt_ID;
    ParamByName('v_standard_id_in').AsFMTBCD:= FStandard_ID;
    ParamByName('v_sndop_id'      ).AsFMTBCD:= ASndOp_ID;
    ParamByName('v_pr_emp_id'     ).AsFMTBCD:= wwQryEmpID.asFloat;
    ParamByName('v_prod_date'     ).AsDateTime := FProdDate;
    ParamByName('v_act_hrs'       ).AsFMTBCD:= AHrs;
    ParamByName('v_act_qty'       ).AsFMTBCD:= AQty;
    ParamByName('v_day_part_id'   ).AsFMTBCD:= FDay_Part_ID;
    Prepare;
    ExecProc;
  end;
end;

procedure TFrmEmpAllocLabor.grdSelSndOpDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  R    : TRect;
  S    : string;
  PtPos: Integer;
begin
  R:= Rect;
  with Sender as TUniStringGrid, Canvas do
  begin
    if ARow < FixedRows then EXIT;
    if ACol < 2 then EXIT;
    if ARow = RowCount - 1 then EXIT;

    S:= StrTran( Cells[ ACol, ARow ], ',', '');
    try
      StrToFloat( S );
    except on EConvertError do
      begin
        Cells[ ACol, ARow ]:= '0';
        S:= '0';
      end;
    end;

    if Pos('.', S) = 0 then
       S:= S + '.00';
    PtPos:= Pos('.', S);

    {right align left of decimal point}
    R.Right:= R.Right - TextWidth('.0000');
    SetTextAlign( Handle, TA_RIGHT );
    TextRect( R, R.Right, R.Top+2, Copy( S, 1, PtPos - 1 ));

    {left align right of decimal point}
    R.Left := R.Right;
    R.Right:= Rect.Right;
    SetTextAlign( Handle, TA_LEFT );
    TextRect( R, R.Left, R.Top+2, Copy( S, PtPos, 255 ));
  end;
end;

procedure TFrmEmpAllocLabor.grdSelSndOpSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  with Sender as TUniStringGrid do
    if (ACol >= 2) and (ARow < RowCount - 1) then
       Options:= Options + [goEditing]
    else
       Options:= Options - [goEditing];
end;

procedure TFrmEmpAllocLabor.grdSelSndOpEnter(Sender: TObject);
begin
  with Sender as TUniStringGrid do
    if Col < 2 then
       Col:= 2;
end;

procedure TFrmEmpAllocLabor.wwTblCost_ALloc_DtlBeforeInsert(
  DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmEmpAllocLabor.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight then
     if not Field.ReadOnly then
        ABrush.Color:= clWindow;
end;

procedure TFrmEmpAllocLabor.wwTblCost_AllocBeforeOpen(DataSet: TDataSet);
begin
  with DataSet do
    Filter:= IQFormat('ARINVT_ID = %.0f and STANDARD_ID = %.0f', [ FArinvt_ID, FStandard_ID ]);
end;

procedure TFrmEmpAllocLabor.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmEmpAllocLabor.wwTblCost_AllocCalcFields(DataSet: TDataSet);
begin
   wwTblCost_AllocDescrip2.asString:= SelectValueByID('descrip2', 'arinvt', wwTblCost_AllocARINVT_ID.asFloat);
end;

end.
