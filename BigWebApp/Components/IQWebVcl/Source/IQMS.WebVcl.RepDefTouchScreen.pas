unit IQMS.WebVcl.RepDefTouchScreen;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  IQMS.WebVcl.RepDef,
  DB,
  Menus,
  StdCtrls,
  Buttons,
  ComCtrls,
  DBCtrls,
  Mask,
  DBGrids,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  ExtCtrls,
  Wwkeycb,
  ImgList,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  Data.Win.ADODB, uniImageList, IQMS.WebVcl.HPick, IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister, FireDAC.Comp.DataMove, uniMainMenu, uniMemo,
  uniDBMemo, uniEdit, uniScrollBox, uniCheckBox, uniMultiItem, uniComboBox,
  uniDBCheckBox, uniDBEdit, uniLabel, uniBasicGrid, uniDBGrid, uniPageControl,
  uniDBNavigator, IQUniGrid, uniGUIFrame, uniSplitter;

type
  TFrmRepDefTouchScreen = class(TfrmRepDef)
    Panel9: TUniPanel;
    Panel11: TUniPanel;
    sbtnNavFirst: TUniSpeedButton;
    sbtnNavPrior: TUniSpeedButton;
    Panel12: TUniPanel;
    sbtnNavNext: TUniSpeedButton;
    sbtnNavLast: TUniSpeedButton;
    sbtnToolBox: TUniSpeedButton;
    sbtnEditBoxQty: TUniSpeedButton;
    procedure sbtnNavFirstClick(Sender: TObject);
    procedure sbtnNavPriorClick(Sender: TObject);
    procedure sbtnNavNextClick(Sender: TObject);
    procedure sbtnNavLastClick(Sender: TObject);
    procedure sbtnToolBoxClick(Sender: TObject);
    procedure sbtnEditBoxQtyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBNavigator2BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
  private
    procedure SetGridRowHeight;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRepDefTouchScreen: TFrmRepDefTouchScreen;

implementation

{$R *.dfm}

uses
  IQMS.WebVcl.RepDefFilterEdit,
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
//  touchscrn,
  uniStringGrid;

procedure TFrmRepDefTouchScreen.FormCreate(Sender: TObject);
begin
  inherited;
//  touchscrn.ApplyTouchscreenFont(Self);
  WindowState := wsMaximized;
  IQMS.Common.Controls.AutoSizeTabWidths(PageControl1);
  sbtnEditBoxQty.Left := DBEdit1.Left + DBEdit1.Width + 8;
  SetGridRowHeight;

end;

procedure TFrmRepDefTouchScreen.FormResize(Sender: TObject);
begin
  inherited;

  // IQMS.Common.Controls.EnforceMaximizedWindow(Self);
  SetGridRowHeight;
end;

procedure TFrmRepDefTouchScreen.FormShow(Sender: TObject);
begin
  inherited;

  // 11-27-2008 EIQ added new incremental search. Keep it invisible on the touchscreen for now
  pnlReportSearch.Visible:= FALSE;

  // Force to bottom
  pnlButtons.Top := PnlCarrier.ClientHeight - 1;

  NavParams.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
//  IQMS.Common.Controls.AutoSizeNavBar(NavParams);
end;

procedure TFrmRepDefTouchScreen.SetGridRowHeight;
begin
  TUniStringGrid(dbgParams).DefaultRowHeight := 36; // 30 is also good
  TUniStringGrid(dbgParams).RowHeights[0] := 20;
end;

procedure TFrmRepDefTouchScreen.sbtnNavFirstClick(Sender: TObject);
begin
 RepDef.First;
end;

procedure TFrmRepDefTouchScreen.sbtnNavPriorClick(Sender: TObject);
begin
  RepDef.Prior;
end;

procedure TFrmRepDefTouchScreen.sbtnNavNextClick(Sender: TObject);
begin
 RepDef.Next;
end;

procedure TFrmRepDefTouchScreen.sbtnNavLastClick(Sender: TObject);
begin
 RepDef.Last;
end;

procedure TFrmRepDefTouchScreen.sbtnToolBoxClick(Sender: TObject);
var
   AUnary, ARangeStart, ARangeEnd, ABinary: String;
   AIncludeNulls: Boolean;
   ColName: string;
   Column : TColInfo;

   procedure _SetVal(const AFieldName, AValue: String);
   begin
     if (RepDef_Criteria.FindField(AFieldName) <> NIL) and
        (RepDef_Criteria.FieldByName(AFieldName).AsString <> AValue) then
        RepDef_Criteria.FieldByName(AFieldName).AsString := AValue;
   end;

begin
  if (RepDef_Criteria.State in [dsEdit,dsInsert]) then
     RepDef_Criteria.Post;

  // Note: We do not allow modifying unary and binary operator on the
  //       touchscreen since these concepts are too complex for plant
  //       floor folks either to understand or care about. So, keep
  //       it simple! (Per Randy)
  AUnary := '='; // default to simplest value
  ARangeStart := RepDef_CriteriaRANGE_START.AsString;
  ARangeEnd := RepDef_CriteriaRANGE_END.AsString;
  ABinary := 'AND'; // default to simplest value
  AIncludeNulls := RepDef_CriteriaINCLUDE_NULLS.AsString = 'Y';

  ColName:= RepDef_CriteriaCRW_COL_NAME.asString;
  Column := ColInfo[ColName];


  if IQRepDef_Touchscreen_EditFilter( // IQRepDefFilterEdit.pas
                                     RepDef_CriteriaDESCRIP.AsString,
                                     Column.DataType,
                                     ARangeStart,
                                     ARangeEnd,
                                     AIncludeNulls) then
     begin
       if not (RepDef_Criteria.State in [dsEdit,dsInsert]) then
          RepDef_Criteria.Edit;
       _SetVal('UNARY_OPERATOR',AUnary);
       _SetVal('RANGE_START',ARangeStart);
       _SetVal('RANGE_END',ARangeEnd);
       _SetVal('BINARY_OPERATOR',ABinary);
       _SetVal('INCLUDE_NULLS',IQMS.Common.Numbers.sIIf(AIncludeNulls,'Y','N'));
     end;
end;

procedure TFrmRepDefTouchScreen.sbtnEditBoxQtyClick(Sender: TObject);
var
   AResult: Integer;
begin
  AResult := RepDefNUM_COPIES.AsInteger;
//  if touchscrn.TouchScreen_KeyPad(Self, AResult) then
     begin
       if not (RepDef.State in [dsEdit,dsInsert]) then
          RepDef.Edit;
       if AResult <= 0 then AResult := 1;
       RepDefNUM_COPIES.AsInteger := AResult;
     end;
end;

procedure TFrmRepDefTouchScreen.DBNavigator2BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;

  if dbgParams.CanFocus then
     dbgParams.SetFocus;
end;

end.
