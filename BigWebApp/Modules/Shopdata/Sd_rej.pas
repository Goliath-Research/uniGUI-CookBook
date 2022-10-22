unit Sd_rej;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  System.Variants,
  IQMS.WebVcl.KeyPad,
  { TODO : IQMS.Common.UserMessages has an issue }
  //IQMS.Common.UserMessages,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  { TRejectRec }
  TRejectOptions = packed record
    RejectCode: string;
    RejectCodeID: Integer;
    Attribute: string;
    Cavity: Integer;
    Quantity: Real;
    Comment: string;
    NonConformLocationID: Integer;
  end;

  { TFrmSDRejectEdit }
  TFrmSDRejectEdit = class(TUniForm)
    PnlKeysMain: TUniPanel;
    SrcRejects: TDataSource;
    QryRejectCode: TFDQuery;
    QryRejectCodeREJECT_CODE: TStringField;
    QryRejectCodeATTRIBUTE: TStringField;
    QryRejectCodeEPLANT_ID: TBCDField;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    PnlControls: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnUOM: TUniBitBtn;
    PnlRejects: TUniPanel;
    PnlNavReason: TUniPanel;
    NavReason: TUniDBNavigator;
    Grid: TIQUniGridControl;
    Panel2: TUniPanel;
    Label2: TUniLabel;
    PnlEditQuantityCtrls: TUniPanel;
    PnlCavity: TUniPanel;
    Label1: TUniLabel;
    sbtnEditBoxQty: TUniSpeedButton;
    btnClearCavity: TUniSpeedButton;
    edtCavity: TUniEdit;
    PnlResult: TUniPanel;
    lblQty: TUniLabel;
    btnClearQty: TUniSpeedButton;
    edtQty: TUniEdit;
    Bevel1: TUniPanel;
    IQKeyPad1: TIQWebKeyPad;
    Label3: TUniLabel;
    PnlComment: TUniPanel;
    lblComment: TUniLabel;
    sbtnEditComment: TUniSpeedButton;
    sbtnClearComment: TUniSpeedButton;
    Bevel2: TUniPanel;
    edtComment: TUniEdit;
    GridImages: TUniImageList;
    QryRejectCodeSEQ: TFMTBCDField;
    QryRejectCodeSOURCE: TStringField;
    QryRejectCodeMFGCELL_ID: TBCDField;
    QryRejectCodeID: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure DoClearQty(Sender: TObject);
    procedure PnlRejectsResize(Sender: TObject);
    procedure SrcRejectsDataChange(Sender: TObject; Field: TField);
    procedure btnUOMClick(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure DoRejectQtyChange(Sender: TObject);
    procedure sbtnEditBoxQtyClick(Sender: TObject);
    procedure edtCavityExit(Sender: TObject);
    procedure DoClearCavity(Sender: TObject);
    procedure IQKeyPad1Change(Sender: TObject);
    procedure DoEditComment(Sender: TObject);
    procedure DoClearComment(Sender: TObject);
    procedure GridCalcTitleAttributes(Sender: TObject; AFieldName: string;
      AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
      { TODO : TwwTitleImageAttributes not converted yet }
   { procedure GridCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);   }
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure QryRejectCodeAfterOpen(DataSet: TDataSet);
    private
      { Private declarations }
      FBom_Mfgcell_ID: Real;
      FRejectOptions: TRejectOptions;
      FSearchFieldName: string;
      FDescOrder: Boolean;
      FHistIllumPartID: Real;
      FWorkCenterID: Real;
      procedure IQAfterShowMessage(var Msg: TMessage);
      { TODO : IQMS.Common.UserMessages has an issue }
       // message iq_AfterShowMessage;
      function GetQty: Real;
      procedure SetQty(const Value: Real);
      function GetCavity: Integer;
      procedure SetCavity(const Value: Integer);
      procedure CopyOptionsTo(var ARejectOptions: TRejectOptions);
      procedure AssignSearchField(const AFieldName: string);
      procedure ChangeSortField(const AFieldName: string);
      procedure ApplyOptions(AOptions: TRejectOptions);
      function CanEditUOM(const AMFGType: string): Boolean;
      function CanEditCavity(const AMFGType: string): Boolean;
      function GetDefaultMFGType(const AMFGType: string): string;
    public
      { Public declarations }
      FocusImage: TControlCanvas;
      FMFGType: string;
      FMFGTypeDefault: string;
      FUOM: string;
      FArinvtID: Real;
      FStandard_ID: Real;
      class function DoShowModal(const AWorkCenterID: Int64;
        const AHistIllumPartID: Int64;
        var ARejectOptions: TRejectOptions): Boolean;

      procedure UpdateOptions;
      function Init(const AHistUllumPartID: Real): Boolean;

      property HistIllumPartID: Real read FHistIllumPartID
        write FHistIllumPartID;
      property WorkCenterID: Real read FWorkCenterID write FWorkCenterID;
      property Quantity: Real read GetQty write SetQty;
      property Cavity: Integer read GetCavity write SetCavity;
      property Bom_Mfgcell_ID: Real read FBom_Mfgcell_ID;
  end;

function DoRejectPad(const AWorkCenterID: Real;
  const AHistIllumPartID: Real;
  var ARejectOptions: TRejectOptions): Boolean;

procedure ClearOptions(var ARejectOptions: TRejectOptions);

implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  sd_uomconv,
  shopdata_rscstr,
  { TODO : touchscrn not yet converted }
  //touchscrn,
  IQMS.WebVcl.ResourceStrings,
  Math;

{$REGION 'Wrapper implementation'}

function DoRejectPad(const AWorkCenterID: Real;
  const AHistIllumPartID: Real;
  var ARejectOptions: TRejectOptions): Boolean;
var
  LFrmSDRejectEdit : TFrmSDRejectEdit;
begin
  LFrmSDRejectEdit := TFrmSDRejectEdit.Create(UniGUIApplication.UniApplication);
  with LFrmSDRejectEdit do
  begin
    WorkCenterID := AWorkCenterID;
    HistIllumPartID := AHistIllumPartID;
    ApplyOptions(ARejectOptions);
    Result := ShowModal = mrOk;
    if Result then
      CopyOptionsTo(ARejectOptions);
    end;
end;

procedure ClearOptions(var ARejectOptions: TRejectOptions);
begin
  ZeroMemory(@ARejectOptions, SizeOf(TRejectOptions));
end;

{$ENDREGION 'Wrapper implementation'}

{$REGION 'TFrmSDRejectEdit'}

{ TFrmSDRejectEdit }


class function TFrmSDRejectEdit.DoShowModal(const AWorkCenterID,
  AHistIllumPartID: Int64; var ARejectOptions: TRejectOptions): Boolean;
var
  LFrmSDRejectEdit : TFrmSDRejectEdit;
begin
  LFrmSDRejectEdit := TFrmSDRejectEdit.Create(UniGUIApplication.UniApplication);
  with LFrmSDRejectEdit do
  begin
    WorkCenterID := AWorkCenterID;
    HistIllumPartID := AHistIllumPartID;
    ApplyOptions(ARejectOptions);
    Result := ShowModal = mrOk;
    if Result then
      CopyOptionsTo(ARejectOptions);
  end;
end;

procedure TFrmSDRejectEdit.FormShow(Sender: TObject);
begin
  FDescOrder := FALSE;
  IQMS.Common.RegFrm.IQRegStringScalarRead(Self, 'Search Field', FSearchFieldName);
  IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'Sort Descending', FDescOrder);
  if FSearchFieldName = '' then
    FSearchFieldName := 'REJECT_CODE';

  // 07/17/2012 Ensure touch-screen font applied.

  { TODO : touchscrn not yet converted }
  //touchscrn.ApplyTouchscreenFont(Self);

  if not Init(FHistIllumPartID) then // see below; also opens datasets.
    System.SysUtils.Abort;

  // 11/24/2014 Set the MaxLength property for the target field size.
  // EIQ-4826 SER# 06118 - Increase Reject.Comment1 field from VARCHAR2 50 to VARCHAR2 250
  edtComment.MaxLength := GetFieldSize('REJECTS','COMMENT1');

  { TODO : IQMS.Common.UserMessages has an issue }
  //PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmSDRejectEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegStringScalarWrite(Self, 'Search Field', FSearchFieldName);
end;

procedure TFrmSDRejectEdit.IQAfterShowMessage(var Msg: TMessage);
begin
  if Grid.CanFocus then
    Grid.SetFocus;
end;

function TFrmSDRejectEdit.CanEditUOM(const AMFGType: string): Boolean;
begin
  // 12/03/2015 (Byron, EIQ-9773) Allow Custom UOM for all MFG types.
  Result := True;

  // 02/07/2011 Expanded list to include 'INJECTION'.  The original
  // list was, 'EXTRUSION', 'EXTRUSION2', 'EXTRUSION3'.
  // 12/07/2012 Added this method to consolidate a couple of areas.
  // Result := StrInList(FMFGTypeDefault, ['EXTRUSION', 'EXTRUSION2',
  //  'EXTRUSION3', 'INJECTION']); // iqstring
end;

function TFrmSDRejectEdit.CanEditCavity(const AMFGType: string): Boolean;
begin
  // 12/07/2012 Added this method
  Result := StrInList(FMFGTypeDefault, ['INJECTION', 'DIECAST', 'BLOWMOLD']);
end;

function TFrmSDRejectEdit.Init(const AHistUllumPartID: Real): Boolean;
var
  A: Variant;
begin
  try
    // Initialize
    Result := FALSE;

    // Clear record
    ClearOptions(FRejectOptions);

    // Clear screen
    Self.Quantity := 0;
    Self.Cavity := 0;
    edtComment.Clear;

    { 01-05-06 - add support for reject codes mfgcell }
    FBom_Mfgcell_ID := SelectValueFmtAsFloat('select s.mfgcell_id ' +
      'from hist_illum_rt h, hist_illum_part p, standard s ' +
      ' where p.id = %f and p.hist_illum_rt_id = h.id and h.standard_id = s.id',
      [AHistUllumPartID]);

    // see rejects.pas
    FArinvtID := SelectValueFmtAsFloat('select p.arinvt_id from partno p, ' +
      'hist_illum_part h where h.id = %f and p.id = h.partno_id',
      [AHistUllumPartID]);
    A := SelectValueArrayFmt('select h.mfg_type, h.uom, h.standard_id ' +
      'from hist_illum_rt h, hist_illum_part p where p.id = %f and ' +
      'p.hist_illum_rt_id = h.id',
      [AHistUllumPartID]);
    if VarArrayDimCount(A) > 0 then
      begin
        FMFGType := System.Variants.VarToStr(A[0]);
        FUOM := System.Variants.VarToStr(A[1]);
        FStandard_ID := System.Variants.VarAsType(A[2], varInteger);
      end;

    FMFGTypeDefault := GetDefaultMFGType(FMFGType);
    // 12/03/2015 (Byron, EIQ-9773) Do not disable button based on MFG type.
    //btnUOM.Visible := CanEditUOM(FMFGTypeDefault);
    PnlCavity.Visible := CanEditCavity(FMFGTypeDefault);

    // 08/23/2007 Adjust the form height
    if not PnlCavity.Visible then
      begin
        PnlEditQuantityCtrls.Height := PnlEditQuantityCtrls.Height -
          PnlCavity.Height;
        Self.Height := Self.Height - PnlCavity.Height;
      end;

    // Now, open datasets
    IQSetTablesActive(TRUE, Self);

    // Pass true result
    Result := TRUE;

  except
    on E: Exception do
      begin
        { TODO : touchscrn has not been converted yet }
        //touchscrn.TouchScreen_Msg_Error(E.Message);
        System.SysUtils.Abort;
      end;
  end;
end;

function TFrmSDRejectEdit.GetDefaultMFGType(const AMFGType: string): string;
begin
  Result := SelectValueFmtAsString('SELECT standard_mfgtype ' +
    'FROM mfgtype WHERE mfgtype = ''%s'' AND ROWNUM < 2',
    [AMFGType]);
  if IQMS.Common.StringUtils.IsEmpty(Result) then
    Result := AMFGType;
end;

procedure TFrmSDRejectEdit.CopyOptionsTo(
  var ARejectOptions: TRejectOptions);
begin
  // First, update the options with any changes
  UpdateOptions;
  // Now, copy the final options to the var param
  //CopyOptions(FRejectOptions, ARejectOptions);
  // Copy values to the target record
  ARejectOptions := FRejectOptions;
end;

procedure TFrmSDRejectEdit.UpdateOptions;
begin
  with FRejectOptions do
    begin
      RejectCode := QryRejectCodeREJECT_CODE.AsString;
      RejectCodeID := QryRejectCodeID.AsInteger;
      Attribute := QryRejectCodeATTRIBUTE.AsString;
      Cavity := Self.Cavity;
      Quantity := Self.Quantity;
      Comment := edtComment.Text;
      NonConformLocationID := SelectValueFmtAsInteger(
      'SELECT non_conform_locations_id FROM reject_code WHERE id = %d',
      [QryRejectCodeID.AsInteger]);
    end;
end;

procedure TFrmSDRejectEdit.ApplyOptions(AOptions: TRejectOptions);
begin
  // CopyOptions(AOptions, FRejectOptions);
  // Copy values to the target record
  FRejectOptions := AOptions;
  QryRejectCode.open;
  if AOptions.RejectCode > '' then
    QryRejectCode.Locate('REJECT_CODE', AOptions.RejectCode, []);
  Self.Cavity := AOptions.Cavity;
  Self.Quantity := AOptions.Quantity;
  edtComment.Text := AOptions.Comment;
end;

procedure TFrmSDRejectEdit.btnOKClick(Sender: TObject);
begin
  try
    FRejectOptions.RejectCode := QryRejectCodeREJECT_CODE.AsString;
    // shopdata_rscstr. cTXT0000020 =
    // 'Quantity is zero.  Do you wish to continue?'
    { TODO : touchscrn has not been converted yet }
   { if (Quantity = 0) and
      not touchscrn.TouchScreen_Msg_Confirm(shopdata_rscstr.cTXT0000020) then
      ModalResult := mrNone;      }
  except
    on E: Exception do
      begin
      { TODO : touchscrn has not been converted yet }
        //touchscrn.TouchScreen_Msg_Error(E.Message);
        System.SysUtils.Abort;
      end;
  end;
end;

procedure TFrmSDRejectEdit.DoClearQty(Sender: TObject);
var
  AOnExit: TNotifyEvent;
begin
  try
    AOnExit := edtQty.OnExit;
    edtQty.OnExit := nil;
    edtQty.Clear;
    { TODO : TIQWebKeyPad has no member ClearCache }
    //IQKeyPad1.ClearCache;
  finally
    edtQty.OnExit := AOnExit;
  end;
end;

procedure TFrmSDRejectEdit.DoClearCavity(Sender: TObject);
var
  AOnExit: TNotifyEvent;
begin
  try
    AOnExit := edtQty.OnExit;
    edtCavity.OnExit := nil;
    edtCavity.Clear;
  finally
    edtCavity.OnExit := AOnExit;
  end;
end;

procedure TFrmSDRejectEdit.PnlRejectsResize(Sender: TObject);
begin
{ TODO : TIQUniGridControl has no member ColWidths }
 { try
    Grid.ColWidths[1] := PnlRejects.ClientWidth - Grid.ColWidths[0];
  except
    System.SysUtils.Abort;
  end;  }
end;

procedure TFrmSDRejectEdit.SrcRejectsDataChange(Sender: TObject;
  Field: TField);
begin
  if not Showing or not QryRejectCode.Active then
    Exit;
  FRejectOptions.RejectCode := QryRejectCodeREJECT_CODE.AsString;
  FRejectOptions.Attribute := QryRejectCodeATTRIBUTE.AsString;
end;

procedure TFrmSDRejectEdit.btnUOMClick(Sender: TObject);
var
  AValue: Real;
  AArinvt_ID: Real;
  ASourceUOM: string;
  AUOMType: string;
  ALengthUomType: Boolean;
begin
  AValue := Quantity;
  ALengthUomType := CompareText(FMFGTypeDefault, 'EXTRUSION') = 0;
  // 12/03/2015 (Byron, EIQ-9773) Allow Custom UOM for all MFG types.
  //if CanEditUOM(FMFGTypeDefault) then
  //  begin
      ASourceUOM := IIf(ALengthUomType, 'FT', 'EACH');
      AUOMType := IIf(ALengthUomType, 'LENGTH', 'WEIGHT');
      { UomConv.pas }
      if IQGetConvertedUOM_SD(ASourceUOM, // Source UOM
        FUOM, // Target UOM
        AValue, // Converted Value
        AUOMType, // UOM Type
        FArinvtID) then // Arinvt_ID
        begin
          Quantity := AValue;
        end;
  //  end;
end;

function TFrmSDRejectEdit.GetQty: Real;
begin
  if not IQMS.Common.Numbers.IsStringValidFloat(Nz(Trim(edtQty.Text), '0'), Result) then
    Result := 0;
end;

procedure TFrmSDRejectEdit.SetQty(const Value: Real);
var
  aValue:Real;
begin
  aValue := Value;
  if Math.IsNan(AValue) then
    aValue := 0;
  edtQty.Text := FormatFloat1000SeparatorA(aValue, 2);
  IQKeyPad1.CachedValueStr := edtQty.Text;
end;

function TFrmSDRejectEdit.GetCavity: Integer;
begin
  if not IQMS.Common.Numbers.IsStringValidInteger(Nz(Trim(edtCavity.Text), '0'),
    Result) then
    Result := 0;
end;

procedure TFrmSDRejectEdit.SetCavity(const Value: Integer);
begin
  if Trunc(Value) > 0 then
    edtCavity.Text := FormatFloat1000SeparatorA(Value)
  else
    edtCavity.Clear;
end;

procedure TFrmSDRejectEdit.AssignEPlantFilter(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'BOM_MFGCELL_ID', FBom_Mfgcell_ID);
  AssignQueryParamValue(DataSet, 'WORK_CENTER_ID', FWorkCenterID);
  AssignQueryParamValue(DataSet, 'STANDARD_ID', FStandard_ID);
end;

procedure TFrmSDRejectEdit.DoRejectQtyChange(Sender: TObject);
begin
  if Showing then
    try
      FormatEditTextAsFloat(edtQty); // iqlib
      IQKeyPad1.CachedValueStr := edtQty.Text;
    except
      on E: Exception do
        begin
        { TODO : touchscrn has no web convert }
         // touchscrn.TouchScreen_Msg_Error(E.Message);
          System.SysUtils.Abort;
        end;
    end;
end;

procedure TFrmSDRejectEdit.sbtnEditBoxQtyClick(Sender: TObject);
var
  i: Integer;
begin

  if not IQMS.Common.Numbers.IsStringValidInteger(edtCavity.Text, i) then
    i := 0;

  // Should be Integer (not float)
  { TODO : touchscrn has no web convert }
  {if touchscrn.TouchScreen_KeyPad(Self, i) then
    edtCavity.Text := IntToStr(i);     }

end;

procedure TFrmSDRejectEdit.edtCavityExit(Sender: TObject);
begin
  try
    FormatEditTextAsInteger(edtCavity); // iqlib
  except
    on E: Exception do
      begin
      { TODO : touchscrn has no web convert }
      //  touchscrn.TouchScreen_Msg_Error(E.Message);
        System.SysUtils.Abort;
      end;
  end;
end;

procedure TFrmSDRejectEdit.IQKeyPad1Change(Sender: TObject);
begin
  if Showing then
    begin
      edtQty.Text := FormatFloat1000SeparatorA(IQKeyPad1.CachedValue, 2);
      // iqlib
      { TODO : TUniEdit does not contain a member SelStart }
     // edtQty.SelStart := Length(edtQty.Text);
    end;
end;

procedure TFrmSDRejectEdit.DoEditComment(Sender: TObject);
var
  S: string;
begin
  S := edtComment.Text;
  { TODO : touchscrn not yet converted }
 { if touchscrn.TouchScreen_Keyboard(Self, S, edtComment.MaxLength) then
    edtComment.Text := S;     }
end;

procedure TFrmSDRejectEdit.DoClearComment(Sender: TObject);
begin
  edtComment.Clear;
end;

procedure TFrmSDRejectEdit.GridCalcTitleAttributes(Sender: TObject;
  AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
  if AFieldName = FSearchFieldName then
    begin
      AFont.Color := clNavy;
      AFont.Style := AFont.Style + [fsBold];
    end
  else
    begin
      AFont.Color := clBlack;
      AFont.Style := AFont.Style - [fsBold];
    end
end;

{ TODO : TwwTitleImageAttributes not converted yet }
{procedure TFrmSDRejectEdit.GridCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
var
  ASearchField: TField;
begin
  if (QryRejectCode.FindField(FSearchFieldName) <> nil) and
    (QryRejectCode.FieldByName(FSearchFieldName) = Field) then
    TitleImageAttributes.ImageIndex := IQMS.Common.Numbers.IIf(
      FDescOrder, 1, 0)
  else
    TitleImageAttributes.ImageIndex := - 1;
end;    }

procedure TFrmSDRejectEdit.GridTitleButtonClick(Sender: TObject;
  AFieldName: string);
begin
  ChangeSortField(AFieldName);
end;

procedure TFrmSDRejectEdit.ChangeSortField(const AFieldName: string);
var
  AField: TField;
begin
  // Get the field, if it exists; if not, AField will be NULL.
  AField := QryRejectCode.FindField(AFieldName);

  // Check field exists in dataset
  if (AField = nil) then
    Exit;

  if AFieldName = FSearchFieldName then
    FDescOrder := not FDescOrder
  else
    FDescOrder := FALSE;

  // Save setting changes
  IQMS.Common.RegFrm.IQRegStringScalarWrite(Self, 'Search Field', AFieldName);
  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'Sort Descending', FDescOrder);
  IQRegFormWrite(Self, [Grid]);
  // Assign the new search field
  AssignSearchField(AFieldName);
  // Apply setting changes
  IQRegFormRead(Self, [Grid]);
end;

procedure TFrmSDRejectEdit.AssignSearchField(const AFieldName: string);
var
  i: Integer;
  hMsg: TPanelMesg;
  AAfterOpen: TDataSetNotifyEvent;
  ABeforeClose: TDataSetNotifyEvent;
begin
  // 'Sorting Dataset ...'
  hMsg := hPleaseWait(IQMS.WebVcl.ResourceStrings.cTXT0000172);
  try
    try
      Screen.Cursor := crSQLWait;
      AAfterOpen := QryRejectCode.AfterOpen;
      ABeforeClose := QryRejectCode.BeforeClose;
      QryRejectCode.AfterOpen := nil;
      QryRejectCode.BeforeClose := nil;
      QryRejectCode.Close;

      i := Pos('ORDER BY ', UpperCase(QryRejectCode.SQL.Text));
      if i > 0 then
        QryRejectCode.SQL.Text := Copy(QryRejectCode.SQL.Text, 1, i - 1);
      QryRejectCode.SQL.Add('ORDER BY ' + FSearchFieldName);

      if FDescOrder then
        QryRejectCode.SQL.Add('desc');

      QryRejectCode.Open;

    finally
      QryRejectCode.AfterOpen := AAfterOpen;
      QryRejectCode.BeforeClose := ABeforeClose;
      Screen.Cursor := crDefault;
    end;

    FSearchFieldName := AFieldName; { Assign new search field }

  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;
end;

procedure TFrmSDRejectEdit.QryRejectCodeAfterOpen(DataSet: TDataSet);
begin
  if (FSearchFieldName > '') then
    AssignSearchField(FSearchFieldName);
end;

{$ENDREGION 'TFrmSDRejectEdit'}

end.
