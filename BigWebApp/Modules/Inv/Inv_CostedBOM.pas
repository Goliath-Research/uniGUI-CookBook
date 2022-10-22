unit Inv_CostedBOM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.wwDataInspector,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.SecurityRegister,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TFrmCostedBOM = class(TUniForm)
    Panel1: TUniPanel;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1ELEM_DESCRIP: TStringField;
    Query1ITEMNO: TStringField;
    Query1ITEM_DESCRIP: TStringField;
    Query1PTSPER: TFMTBCDField;
    Query1STD_COST: TFMTBCDField;
    Query1UNIT: TStringField;
    Query1DESCRIP: TStringField;
    Query1TYPE: TStringField;
    Query1INTRODUCED_BY_ITEMNO: TStringField;
    Query1INTRODUCED_BY_DESCRIP: TStringField;
    Query1ARINVT_ID: TBCDField;
    Query1INTRODUCED_BY_ARINVT_ID: TBCDField;
    Splitter1: TUniSplitter;
    Query1CLASS: TStringField;
    Query1REV: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    PrintDialog1: TPrintDialog;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    pnlGrid: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Query1EXT_COST: TFMTBCDField;
    Query1NOTE: TStringField;
    Bevel1: TUniPanel;
    Query1INTRODUCED_BY_EPLANT_ID: TFMTBCDField;
    Contents1: TUniMenuItem;
    popmMainGrid: TUniPopupMenu;
    JumpToInventory1: TUniMenuItem;
    JumpToIntroducedByBOM1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    IQJumpBOMIntoBy: TIQWebJump;
    rbtnCurrent: TUniRadioButton;
    rbtnBudget: TUniRadioButton;
    rbtnForecast: TUniRadioButton;
    JumpToIntroducedByInventory1: TUniMenuItem;
    IQJumpInvIntroBy: TIQWebJump;
    Query1INTRODUCED_BY_STANDARD_ID: TBCDField;
    rbtnFuture: TUniRadioButton;
    Query1CostCalcDateDisp: TStringField;
    N1: TUniMenuItem;
    CopyToClipboard1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    { TODO -oSanketG -cWebConvert : Parser should replace the component TNavigateBtn into suitable UniGUI component
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);}
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure Query1UpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure AbortBeforeAnyChange(DataSet: TDataSet);
    procedure wwDBGrid1UpdateFooter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Query1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Contents1Click(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure JumpToIntroducedByBOM1Click(Sender: TObject);
    procedure popmMainGridPopup(Sender: TObject);
    procedure ApplySourceSelection(Sender: TObject);
    procedure JumpToIntroducedByInventory1Click(Sender: TObject);
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure CopyToClipboard1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID : Real;
    FCost_Calc_Date         : TDateTime;
    FCost_Calc_Date_Budget  : TDateTime;
    FCost_Calc_Date_Forecast: TDateTime;
    FCost_Calc_Date_Future  : TDateTime;
    procedure AssignCaption;
    procedure SetAArinvt_ID(const Value: Real);
  public
    { Public declarations }
    property AArinvt_ID: Real write SetAArinvt_ID;
    class procedure DoShow( AArinvt_ID: Real );
  end;


implementation

{$R *.DFM}

uses
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  System.Variants;

class procedure TFrmCostedBOM.DoShow( AArinvt_ID: Real );
var
  FrmCostedBOM: TFrmCostedBOM;
begin
  FrmCostedBOM := TFrmCostedBOM.Create(uniGUIApplication.UniApplication);
  FrmCostedBOM.AArinvt_ID := AArinvt_ID;
  FrmCostedBOM.Show();
end;

procedure TFrmCostedBOM.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( HelpContext );
end;

procedure TFrmCostedBOM.CopyToClipboard1Click(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit
  [dcc32 Error] Inv_CostedBOM.pas(166): E2010 Incompatible types: 'TCustomGrid' and 'TIQUniGridControl'}
  //IQMS.Common.Controls.CopyDBGridToClipboard( wwDBGrid1 );
end;

procedure TFrmCostedBOM.UniFormShow(Sender: TObject);
var
  A: VAriant;
begin
  A:= SelectValueArrayFmt( 'select Cost_Calc_Date, Cost_Calc_Date_Budget, Cost_Calc_Date_Forecast, Cost_Calc_Date_Future '+
                      '  from arinvt where id = %f',
                      [  FArinvt_ID ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    if A[ 0 ] > 0 then
       FCost_Calc_Date:= A[ 0 ];
    if A[ 1 ] > 0 then
       FCost_Calc_Date_Budget:= A[ 1 ];
    if A[ 2 ] > 0 then
       FCost_Calc_Date_Forecast:= A[ 2 ];
    if A[ 3 ] > 0 then
       FCost_Calc_Date_Future:= A[ 3 ];
  end;
  Query1.Close;
  IQSetTablesActive( True, self );
  IQRegFormRead( self, [ self, pnlGrid, wwDBGrid1 ]);

  AssignCaption;
end;

procedure TFrmCostedBOM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlGrid, wwDBGrid1 ]);
end;

procedure TFrmCostedBOM.JumpToIntroducedByBOM1Click(Sender: TObject);
begin
  IQJumpBOMIntoBy.Execute;
end;

procedure TFrmCostedBOM.JumpToIntroducedByInventory1Click(Sender: TObject);
begin
  IQJumpInvIntroBy.Execute
end;

procedure TFrmCostedBOM.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmCostedBOM.popmMainGridPopup(Sender: TObject);
begin
  JumpToInventory1.Enabled:= Query1ARINVT_ID.asFloat > 0;
  JumpToIntroducedByInventory1.Enabled:= Query1INTRODUCED_BY_ARINVT_ID.asFloat > 0;
  JumpToIntroducedByBOM1.Enabled:= Query1INTRODUCED_BY_STANDARD_ID.asFloat > 0;
end;

procedure TFrmCostedBOM.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCostedBOM.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmCostedBOM.PrintSetup1Click(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFrmCostedBOM.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

{ TODO -oSanketG -cWebConvert : Need to revisit
  [dcc32 Error] Inv_CostedBOM.pas(249): E2003 Undeclared identifier: 'DBNavigator1BeforeAction'}
{procedure TFrmCostedBOM.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    Reopen( Query1 );
    ABORT;
  end;
end;}

procedure TFrmCostedBOM.Query1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('arinvt_id').Value := FArinvt_ID;
end;

procedure TFrmCostedBOM.AssignCaption;
begin
  Caption:= Format(inv_rscstr.cTXT0000072 {'%s Costed BOM'}, [ SelectValueByID( 'descrip', 'arinvt', FArinvt_ID )]);
end;

procedure TFrmCostedBOM.Query1UpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
// for refresh
end;

procedure TFrmCostedBOM.SetAArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmCostedBOM.AbortBeforeAnyChange(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmCostedBOM.wwDBGrid1UpdateFooter(Sender: TObject);
var
  X: Real;
begin
  if rbtnBudget.Checked then
     X:= SelectValueFmtAsFloat('select sum(ext_cost) from arinvt_use_budget where parent_arinvt_id = %f', [ FArinvt_ID ])

  else if rbtnForecast.Checked then
     X:= SelectValueFmtAsFloat('select sum(ext_cost) from arinvt_use_forecast where parent_arinvt_id = %f', [ FArinvt_ID ])
  else if rbtnFuture.Checked then
     X:= SelectValueFmtAsFloat('select sum(ext_cost) from arinvt_use_tmp where parent_arinvt_id = %f', [ FArinvt_ID ])
  else
     X:= SelectValueFmtAsFloat('select sum(ext_cost) from arinvt_use where parent_arinvt_id = %f', [ FArinvt_ID ]);

  { TODO -oSanketG -cWebConvert : Need to find the alternative property of ColumnByName for TIQUniGridControl}
  //wwDBGrid1.ColumnByName('ext_cost').FooterValue := FloatToStrF( X, ffNumber, 15, 6);
end;

procedure TFrmCostedBOM.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmCosting6{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCostedBOM.Query1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  // 01-13-2011 hide items introduced by secret eplant
  Accept:= not SecurityManager.IsInvisibleAnotherEPlant( Query1INTRODUCED_BY_EPLANT_ID.asFloat );
end;

procedure TFrmCostedBOM.ApplySourceSelection(Sender: TObject);
var
  I: Integer;
  S: string;
begin
  IQRegFormWrite( self, [ pnlGrid, wwDBGrid1 ]);

  if Sender = rbtnCurrent then       S:= 'arinvt_use u,'
  else if Sender = rbtnBudget then   S:= 'arinvt_use_budget u,'
  else if Sender = rbtnForecast then S:= 'arinvt_use_forecast u,'
  else if Sender = rbtnFuture then S:= 'arinvt_use_tmp u,'
  else raise Exception.Create('Invalid Sender in ''ApplySourceSelection'' procedure - unable to determine arinvt_use table kind');

  Query1.Close;
  IQMS.Common.StringUtils.DeleteStringsBetweenKeyWords( Query1.SQL,
                                         '_SELECT_FROM_START_',
                                         '_SELECT_FROM_END_',
                                         I );

  IQMS.Common.StringUtils.InsertStringsBetweenKeyWords( Query1.SQL,
                                         S,
                                         '_SELECT_FROM_START_',
                                         '_SELECT_FROM_END_' );

  Reopen(Query1);

  IQRegFormRead( self, [ pnlGrid, wwDBGrid1 ]);
end;

procedure TFrmCostedBOM.Query1CalcFields(DataSet: TDataSet);
var
  ADate: TDateTime;
begin
  ADate:= 0;
  if rbtnCurrent.Checked       then  ADate:= FCost_Calc_Date
  else if rbtnBudget.Checked   then  ADate:= FCost_Calc_Date_Budget
  else if rbtnForecast.Checked then  ADate:= FCost_Calc_Date_Forecast
  else if rbtnFuture.Checked   then  ADate:= FCost_Calc_Date_Future;

  if ADate > 0 then
     Query1CostCalcDateDisp.asString:= DateTimeToStr( ADate );
end;


end.
