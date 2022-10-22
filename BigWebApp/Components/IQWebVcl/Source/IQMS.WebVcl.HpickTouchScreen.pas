unit IQMS.WebVcl.HpickTouchScreen;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  IQMS.WebVcl.HpickBase,
  wwDialog,
  Vcl.Wwfltdlg,
  Data.DB,
  Vcl.Buttons,
  Vcl.DBGrids,
  IQMS.WebVcl.LargeGrid,
  Vcl.Wwdatsrc,
  System.Math,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,  uniGUITypes,
  uniSpeedButton,
  uniImageList,
  uniPanel,
  uniBasicGrid, IQUniGrid,
  uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.AppEvnts, Vcl.Menus, uniMainMenu,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniLabel, uniStatusBar,
  uniCheckBox, uniEdit, Vcl.Forms, uniScrollBox;

type
  TFrmTouchScreenPickList = class(TFrmPickListBase)
    tsGrid: TIQWebTouchScreenGrid;
    TITLEIMAGES: TUniImageList;
    PnlTouchscreenCtrls: TUniPanel;
    sbtnClear: TUniSpeedButton;
    sbtnKeyboard: TUniSpeedButton;
    Bevel1: TUniPanel;
    procedure sbtnClearClick(Sender: TObject);
    procedure sbtnKeyboardClick(Sender: TObject);
    // TwwDBGrid Routines
    procedure DoGridCalcCellColors(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure DoGridCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure DoGridCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure DoGridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DoGridTitleButtonClick(Sender: TObject; AFieldName: String);
  private
    { Private declarations }
    procedure AdjustButtonSizes;
    procedure AutoSizeGrid;
  protected
    { Protected declarations }
    procedure ReadGrid; override;
    procedure WriteGrid; override;
    function Grid: TUniDBGrid; override;
    procedure AfterShow; override;
    procedure Startup; override;
  public
    { Public declarations }
  end;

const
  c_touchscreen_btn_size: Integer = 40;

var
  FrmTouchScreenPickList: TFrmTouchScreenPickList;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.Screen,
  IQMS.Common.RegFrm;
//  touchscrn;

{ TFrmTouchScreenPickList }


procedure TFrmTouchScreenPickList.Startup;
begin
  tsGrid.GridName := 'TouchScreenGrid';

  inherited;

//  touchscrn.ApplyTouchscreenFont(Self);

  // do this first
  AdjustButtonSizes;
end;

procedure TFrmTouchScreenPickList.sbtnClearClick(Sender: TObject);
begin
  // inherited; // nothing
  Search.Clear;
end;

procedure TFrmTouchScreenPickList.sbtnKeyboardClick(Sender: TObject);
var
   ASearchText: String;
begin
  ASearchText := Search.Text;
//  if touchscrn.TouchScreen_Keyboard( Self, ASearchText ) then
//     begin
//       Search.Text := ASearchText;
//       btnLaunchClick( NIL );
//     end;
end;

procedure TFrmTouchScreenPickList.DoGridCalcCellColors(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin

  if (UpperCase(column.Field.FieldName) = UpperCase(SortColumn.FieldName)) then
    begin
       Attribs.Color:= clTeal;
       Attribs.Font.Color := clWhite;
    end
  else
    begin
       Attribs.Color:= clWhite;
       Attribs.Font.Color := clBlack;
    end

end;

procedure TFrmTouchScreenPickList.DoGridCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
     if AFieldName = SortColumn.FieldName then
        AFont.Color := clNavy
     else AFont.Color := clBlack;
end;

procedure TFrmTouchScreenPickList.DoGridCalcTitleImage(Sender: TObject; Field: TField;
  var TitleImageAttributes: TwwTitleImageAttributes);
begin
     if Field.FieldName = SortColumn.FieldName then
        begin
             if FDescOrd then TitleImageAttributes.ImageIndex := 1
             else TitleImageAttributes.ImageIndex := 2;
             TitleImageAttributes.Alignment := taRightJustify;
        end
     else TitleImageAttributes.ImageIndex := 0;
end;

procedure TFrmTouchScreenPickList.DoGridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  FOnColumnFlag:= FALSE;
end;

procedure TFrmTouchScreenPickList.DoGridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
    if SortColumn.FieldName = AFieldName then
       FDescOrd:= not FDescOrd
    else
       FDescOrd:= FALSE;

    SortByChange( Query.FieldByName( AFieldName ) );
end;


function TFrmTouchScreenPickList.Grid: TUniDBGrid;
begin
  Result := NIL;
end;

procedure TFrmTouchScreenPickList.ReadGrid;
begin
  IQRegFormRead( Owner, [TIQUniGridControl(tsGrid.DBGrid)]);
end;

procedure TFrmTouchScreenPickList.WriteGrid;
begin
  IQRegFormWrite( Owner, [TIQUniGridControl(tsGrid.DBGrid)]);
end;

procedure TFrmTouchScreenPickList.AfterShow;
begin
  inherited;

  // Adjust if something has gone wrong with sizing
  if Height < 480 then
     Height := 500;

  if Width < 720 then
     Width := 770;

  // always center a touch-screen pick list
//  IQMS.Common.Controls.CenterForm(Self);

  ReadGrid;
  AutoSizeGrid;
end;

procedure TFrmTouchScreenPickList.AdjustButtonSizes;
var
  i: Integer;
begin
  // IMPORTANT NOTE:  The base class will stack up the controls in
  // SetButtons in the IQAfterShowMessage procedure.  The only thing
  // we do in this procedure is set sizes.

  // Set the flow panel margin for the check boxes
//  FlowPanel1.BorderWidth := 8;
  // Toggle PK_HIDE
  sbtnToggleHide.Width := c_touchscreen_btn_size;
  sbtnToggleHide.Height := c_touchscreen_btn_size;
  pnlPkHide.Width := c_touchscreen_btn_size;
  // Toggle PK_HIDE
  sbtnUser1.Width := c_touchscreen_btn_size;
  sbtnUser1.Height := c_touchscreen_btn_size;
  PnlUser.Width := c_touchscreen_btn_size;
  // Set button sizes
  for i := 0 to PnlSearchBtns.ControlCount - 1 do
    if (PnlSearchBtns.Controls[i] is TUniSpeedButton) then
      begin
        TUniSpeedButton(PnlSearchBtns.Controls[i]).Width := c_touchscreen_btn_size;
        TUniSpeedButton(PnlSearchBtns.Controls[i]).Height := c_touchscreen_btn_size;
      end
    else if (PnlSearchBtns.Controls[i] is TUniPanel) then
      TUniPanel(PnlSearchBtns.Controls[i]).Height := c_touchscreen_btn_size;
  btnLaunch.Width := Max(140,
    IQMS.Common.Screen.GetTextWidthPixels(btnLaunch.Caption, Self.Font) + 4);
  btnLaunch.Height := c_touchscreen_btn_size;
end;

procedure TFrmTouchScreenPickList.AutoSizeGrid;
var
   i, x1,x2: Integer;
   s: String;
begin
  // 03/16/2009 Ensures that the full caption displays.
  // Note: users cannot resize columns on a touch-screen.
  for i := 0 to tsGrid.DBGrid.DBGrid.Columns.Count- 1 do
   begin
     s := tsGrid.DBGrid.DBGrid.Columns[i].Title.Caption;
     x1 := Length(s) + 2;
     x2 :=  tsGrid.DBGrid.DBGrid.Columns[i].Width;
     tsGrid.DBGrid.DBGrid.Columns[i].Width := Max(x1,x2);
   end;
end;

end.
