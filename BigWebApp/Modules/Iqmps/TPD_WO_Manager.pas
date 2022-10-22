//  UpdateSQLPtOrder_Rel was modified manually to exclude ROWID being updated during update/insert
unit TPD_WO_Manager;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.AppDef,
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls,
  IQMS.Common.JumpConstants;

type
  TFrmTPD_WO_Manager = class(TUniForm)
    pnlWOHeader: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    SrcWO: TDataSource;
    QryWO: TFDQuery;
    QryWOID: TBCDField;
    QryWOSTANDARD_ID: TBCDField;
    QryWOARCUSTO_ID: TBCDField;
    QryWOEPLANT_ID: TBCDField;
    QryWOFIRM: TStringField;
    QryWOORIGIN: TStringField;
    QryWOCYCLES_REQ: TBCDField;
    QryWOPRODHRS: TFMTBCDField;
    QryWOSTART_TIME: TDateTimeField;
    QryWOEND_TIME: TDateTimeField;
    QryWOCustNo: TStringField;
    UpdateSQLWO: TFDUpdateSQL;
    QryWOBUCKET: TBCDField;
    AppDef1: TIQWebAppDef;
    QryWOMFG_TYPE: TStringField;
    QryWOCycle_Req_Disp: TFloatField;
    QryWOBOM_UOM: TStringField;
    SrcPtorder: TDataSource;
    QryPtorder: TFDQuery;
    pnlPtOrder: TUniPanel;
    Splitter2: TUniSplitter;
    Panel4: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Panel7: TUniPanel;
    Label4: TUniLabel;
    Panel9: TUniPanel;
    Label7: TUniLabel;
    QryPtorderID: TBCDField;
    QryPtorderWORKORDER_ID: TBCDField;
    QryPtorderPARTNO_ID: TBCDField;
    QryPtorderARINVT_ID: TBCDField;
    QryPtorderITEMNO: TStringField;
    QryPtorderCLASS: TStringField;
    QryPtorderREV: TStringField;
    QryPtorderDESCRIP: TStringField;
    wwDBGrid2: TIQUniGridControl;
    SrcPtOrderRel: TDataSource;
    QryPtOrderRel: TFDQuery;
    QryPtOrderRelPTORDER_ID: TBCDField;
    QryPtOrderRelREL_QUAN_DISP: TBCDField;
    QryPtOrderRelREL_DATE: TDateTimeField;
    QryPtOrderRelORDERNO: TStringField;
    QryPtOrderRelPONO: TStringField;
    QryPtOrderRelROWID: TStringField;
    UpdateSQLPtOrder_Rel: TFDUpdateSQL;
    PopupMenu1: TUniPopupMenu;
    JumpToWorkorder1: TUniMenuItem;
    IQSearchWO: TIQUniGridControl;
    QryWOMFGNO: TStringField;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoID: TFloatField;
    PkArcustoPK_HIDE: TStringField;
    wwDBComboDlgCustNo: TUniEdit;
    IQAbout1: TIQWebAbout;
    N1: TUniMenuItem;
    About1: TUniMenuItem;
    QryPtorderDESCRIP2: TStringField;
    QryWOPRIORITY_NOTE: TStringField;
    wwDBComboDlgPriorityNote: TUniEdit;
    QryPtOrderRelID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryWOBeforeOpen(DataSet: TDataSet);
    { TODO -oSanketG -cWC : Need to find alternative for  TNavigateBtn}
    //procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryWOBeforePost(DataSet: TDataSet);
    procedure QryWOBeforeEdit(DataSet: TDataSet);
    procedure CheckFirm(DataSet: TDataSet);
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] TPD_WO_Manager.pas(122): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure wwDBGridWOCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);}
    procedure QryWOCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QryPtOrderRelBeforeInsert(DataSet: TDataSet);
    procedure ApplyUpdatesFromReleases(DataSet: TDataSet);
    { TODO -oSanketG -cWC : Need to find alternative for  TNavigateBtn}
    //procedure NavRelBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure QryPtOrderRelNewRecord(DataSet: TDataSet);
    procedure QryWOBeforeInsert(DataSet: TDataSet);
    procedure QryWOAfterInsert(DataSet: TDataSet);
    procedure QryPtOrderRelBeforeEdit(DataSet: TDataSet);
    procedure JumpToWorkorder1Click(Sender: TObject);
    procedure wwDBComboDlgCustNoCustomDlg(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure wwDBComboDlgPriorityNoteCustomDlg(Sender: TObject);
    procedure QryPtOrderRelBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure CheckWorkorderIsFirm;
    procedure EnsurePtOrderExists;
    procedure UpdateWorkorderFromReleases;
    function AddToPtOrder(AWorkorder_ID, APartno_ID: Real): Real;
    procedure IQNotifyMessage( var Msg: TMessage ); message iq_Notify;
    { TODO -oSanketG -cWC : Need to find alternative for  TNavigateBtn}
    {procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure NavRelBeforeAction(Sender: TObject; Button: TNavigateBtn);}
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(  AArinvt_ID: Real );
    property Arinvt_ID: Real write SetArinvt_ID;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.UOM,
  IQMS.WebVcl.Jump,
  IQMS.Common.MfgShare,
  IQMS.Common.HelpHook,
  IQMS.Common.EditMemoStr;

{ TFrmTPD_wo_manager }

class procedure TFrmTPD_WO_Manager.DoShowModal( AArinvt_ID: Real);
var
  FrmTPD_WO_Manager: TFrmTPD_WO_Manager;
begin
  FrmTPD_WO_Manager := self.Create(UniGUIApplication.UniApplication );
  with FrmTPD_WO_Manager do
  begin
    try
      Arinvt_ID:= AArinvt_ID;
      ShowModal;
    finally
      //Free;
    end;
  end;
end;


procedure TFrmTPD_WO_Manager.UniFormCreate(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl }
  //IQSearchWO.wwDBGrid.SetControlType('PRIORITY_NOTE', fctCustom, 'wwDBComboDlgPriorityNote');

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, pnlWOHeader, pnlPtOrder ]);
end;

procedure TFrmTPD_WO_Manager.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlWOHeader, pnlPtOrder ]);
end;

procedure TFrmTPD_WO_Manager.QryWOBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('arinvt_id').asFloat:= FArinvt_ID;
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

{ TODO -oSanketG -cWC : Need to find alternative for TNavigateBtn component }
{procedure TFrmTPD_WO_Manager.NavMainBeforeAction(Sender: TObject;  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh: IQCheckRefresh( Sender, Button );
  end;
end;}

procedure TFrmTPD_WO_Manager.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
  RefreshDataSetByID(DataSet);
end;

procedure TFrmTPD_WO_Manager.QryWOBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);

  with DataSet do
    if (State = dsEdit) and (FieldByName('FIRM').asString = 'Y') and (FieldByName('bucket').asInteger > 0) then
    begin
       ExecuteCommandFmt('begin irv32.convert_to_firm(%f); end;', [ DataSet.FieldByName('id').asFloat ]);
       FieldByName('bucket').Clear;
    end;
end;


procedure TFrmTPD_WO_Manager.QryWOBeforeEdit(DataSet: TDataSet);
begin
  // QryWOFIRM.ReadOnly:= DataSet.FieldByName('FIRM').asString = 'Y';

  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl}
  {if not (IQSearchWO.wwDBGrid.GetActiveField = QryWOFIRM) then
     CheckWorkorderIsFirm;}
end;


procedure TFrmTPD_WO_Manager.CheckWorkorderIsFirm;
begin
  if (QryWOID.asFloat > 0) then
     IQAssert( (QryWOFIRM.asString = 'Y') or (QryWOBUCKET.asFloat = 0), 'Workorder must be either FIRM or not system generated - operation aborted.');
end;


procedure TFrmTPD_WO_Manager.CheckFirm(DataSet: TDataSet);
begin
  CheckWorkorderIsFirm;
end;

{ TODO -oSanketG -cWC : Need to revisit ,
[dcc32 Error] TPD_WO_Manager.pas(271): E2003 Undeclared identifier: 'wwDBGridWOCalcCellColors'}
{procedure TFrmTPD_WO_Manager.wwDBGridWOCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if (QryWOFIRM.asString <> 'Y') and (Field <> QryWOFIRM ) then
     ABrush.Color:= $00F3F1F1;
end;}

procedure TFrmTPD_WO_Manager.QryWOCalcFields(DataSet: TDataSet);
begin
  if IQMS.Common.MfgShare.lookup_mfgtype( QryWOMfg_Type.asString ) = 'EXTRUSION' then
     QryWOCycle_Req_Disp.asFloat:= IQConvertUom( QryWOCYCLES_REQ.asFloat,   {length in ft}
                                                 'FT',                      {from ft}
                                                 QryWOBom_UoM.asString,     {to whatever in BOM}
                                                 -1)                        {Arinvt_ID - N/A}
  else
     QryWOCycle_Req_Disp.asFloat:= QryWOCYCLES_REQ.asFloat;

  if QryWOID.asInteger > 0 then
     QryWOCustNo.asString:= SelectValueByID('custno', 'arcusto', QryWOID.asInteger);
end;

procedure TFrmTPD_WO_Manager.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmTPD_WO_Manager.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl }
  {IQSearchWO.wwDBGrid.ColumnByName('Cycle_Req_Disp').DisplayLabel:= AppDef1.Execute( 'Lbl_Cycle_Req',  [NIL] ).asString;
  IQSearchWO.wwDBGrid.KeyOptions:= [dgAllowDelete]}
end;


procedure TFrmTPD_WO_Manager.EnsurePtOrderExists;
var
  APtOrder_ID: Real;
begin
  if QryPtorderID.asFloat > 0 then EXIT;

  IQAssert( QryPtorderPARTNO_ID.asFloat > 0, 'Undefined partno_id - unable to continue' );

  APtOrder_ID:= AddToPtOrder( QryWOID.asFloat, QryPtorderPARTNO_ID.asFloat );

  Reopen( QryPtorder );
  IQAssert( QryPtorder.Locate('ID', APtOrder_ID, []), Format('Unable to find appended ptorder id = %.0f', [APtOrder_ID]));
end;

function TFrmTPD_WO_Manager.AddToPtOrder( AWorkorder_ID, APartno_ID: Real ): Real;
begin
  Result:= GetNextID('ptorder');
  ExecuteCommandFmt('insert into ptorder( id, workorder_id, partno_id ) values( %f, %f, %f )',
             [ Result, AWorkorder_ID, APartno_ID ]);
end;

procedure TFrmTPD_WO_Manager.ApplyUpdatesFromReleases(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
  RefreshDataSetByID(DataSet, 'ROWID');

  UpdateWorkorderFromReleases;
end;

{ TODO -oSanketG -cWC : Need to revisit }
{procedure TFrmTPD_WO_Manager.NavRelBeforeAction(Sender: TObject;  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet), 'ROWID');
        ABORT;
      end;
  end;
end;}

procedure TFrmTPD_WO_Manager.UpdateWorkorderFromReleases;
var
  ShotsReq, ProdHrs    : Real;
  StartTime,CalcEndTime: TDateTime;
  Bk1, Bk2             : TBookMark;
begin
  Bk1:= QryPtorder.GetBookMark;
  Bk2:= QryPtorderRel.GetBookMark;
  QryPtorder.DisableControls;
  QryPtorderRel.DisableControls;
  try
    try
      // Calcs
      AppDef1.Execute( 'Calc_Shots_Hours_Start_End', [ QryWOID.asFloat ]);
      ProdHrs    := AppDef1.ParamByName('V_PROD_HRS').asFloat;
      ShotsReq   := AppDef1.ParamByName('V_SHOTS_REQ').asFloat;
      StartTime  := AppDef1.ParamByName('V_CALCSTARTTIME').asDateTime;
      CalcEndTime:= AppDef1.ParamByName('V_CALCENDTIME').asDateTime;

      // Assign
      QryWo.Edit;
      QryWoPRODHRS.Value        := ProdHrs;
      QryWoCYCLES_REQ.Value     := ShotsReq;
      QryWoSTART_TIME.asDateTime:= StartTime;
      QryWoEND_TIME.asDateTime  := CalcEndTime;
      QryWo.Post;
    finally
        QryPtorder.GotoBookMark(Bk1);
        QryPtorder.FreeBookMark(Bk1);
        QryPtorderRel.GotoBookMark(Bk2);
        QryPtorderRel.FreeBookMark(Bk2);
        QryPtorder.EnableControls;
        QryPtorderRel.EnableControls;
    end;
  except
    if QryWo.State in [dsEdit] then QryWo.Cancel;
  end;
end;

procedure TFrmTPD_WO_Manager.QryPtOrderRelNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('id').asBCD:= 0;
  QryPtOrderRelPTORDER_ID.asFloat:= QryPtorderID.asFloat;
end;

procedure TFrmTPD_WO_Manager.QryWOBeforeInsert(DataSet: TDataSet);
begin
  QryWOFIRM.ReadOnly:= FALSE;
end;

procedure TFrmTPD_WO_Manager.QryWOAfterInsert(DataSet: TDataSet);
var
  AStandard_ID, AArcusto_ID: Real;
  AWorkorder_ID: Real;
  APartno_ID   : Real;
  function NumToStr( AValue: Real ): string;
  begin
    if AValue > 0 then Result:= FloatToStr(AValue) else Result:= 'NULL'
  end;
begin
  AWorkorder_ID:= GetNextID('workorder');
  AStandard_ID := SelectValueByID('standard_id', 'arinvt', FArinvt_ID);
  APartno_ID   := SelectValueFmtAsFloat('select id from partno where standard_id = %f and arinvt_id = %f', [ AStandard_ID, FArinvt_ID ]);
  AArcusto_ID  := SelectValueByID('arcusto_id', 'standard', AStandard_ID);

  // workorder
  ExecuteCommandFmt('insert into workorder                      '+
            '     ( id, firm, standard_id, arcusto_id ) '+
            'values                                     '+
            // '     ( %f,  ''Y'', %s, %s )                ',
            '     ( %f,  NULL, %s, %s )                ',
            [ AWorkorder_ID,
              NumToStr(AStandard_ID),
              NumToStr(AArcusto_ID) ]);

  // ptorder
  AddToPtOrder( AWorkorder_ID, APartno_ID );

  DataSet.Cancel;
  PostMessage( self.Handle, iq_Notify, Trunc(AWorkorder_ID), 0 );
end;

procedure TFrmTPD_WO_Manager.IQNotifyMessage(var Msg: TMessage);
var
  AWorkorder_ID: Real;
begin
  AWorkorder_ID:= Msg.WParam;
  Reopen( QryWO );
  QryWO.Locate('ID', AWorkorder_ID, []);
end;

procedure TFrmTPD_WO_Manager.QryPtOrderRelBeforeInsert(DataSet: TDataSet);
begin
  QryPtOrderRelBeforeEdit(DataSet);
  EnsurePtOrderExists;
end;

procedure TFrmTPD_WO_Manager.QryPtOrderRelBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'ptorder_rel');
end;

procedure TFrmTPD_WO_Manager.QryPtOrderRelBeforeEdit(DataSet: TDataSet);
begin
  QryWO.CheckBrowseMode;
  CheckFirm(DataSet);
end;

procedure TFrmTPD_WO_Manager.JumpToWorkorder1Click(Sender: TObject);
begin
  JumpDirect( iq_JumpToWorkOrder, QryWoID.asInteger );  {IQJump}
end;

procedure TFrmTPD_WO_Manager.wwDBComboDlgCustNoCustomDlg(Sender: TObject);
begin
  CheckFirm( QryWO );
  QryWO.Edit;
  IQPickAndReplace( QryWoARCUSTO_ID, PkArcusto, 'ID');
end;

procedure TFrmTPD_WO_Manager.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmTPD_WO_Manager.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTPD_WO_Manager.wwDBComboDlgPriorityNoteCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= QryWOPRIORITY_NOTE.asString;
  if DoEditMemoStr( S, 255, 'Priority Note' ) then    {IQMS.Common.EditMemoStr.pas}
  begin
    QryWO.Edit;
    QryWOPRIORITY_NOTE.asString:= S;
  end;
end;

end.
